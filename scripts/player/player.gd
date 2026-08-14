extends CharacterBody2D

signal hp_changed(current: int, maximum: int)
signal stamina_changed(current: float, maximum: float)
signal eco_changed(current: int, maximum: int)

@export var move_speed: float = 180.0
@export var jump_velocity: float = -380.0
@export var gravity: float = 980.0

@export var jump_stamina_cost: float = 10.0
@export var stamina_recover_rate: float = 20.0

@export var attack_stamina_cost: float = 12.0
@export var attack_duration: float = 0.15
@export var attack_cooldown: float = 0.30

@export var dash_speed: float = 420.0
@export var dash_duration: float = 0.18
@export var dash_cooldown: float = 0.50
@export var dash_stamina_cost: float = 18.0

@export var spell_eco_cost: float = 8.0
@export var spell_cooldown: float = 0.35
@export var spell_scene: PackedScene

@export var stats: PlayerStats

@onready var attack_area: Area2D = $AttackArea
@onready var spell_spawn_point: Marker2D = $SpellSpawnPoint
@onready var combat: Node = $Combat
@onready var magic: Node = $Magic
@onready var dash: Node = $Dash
@onready var attack_duration_timer: Timer = $AttackDurationTimer
@onready var attack_cooldown_timer: Timer = $AttackCooldownTimer
@onready var spell_cooldown_timer: Timer = $SpellCooldownTimer
@onready var dash_duration_timer: Timer = $DashDurationTimer
@onready var dash_cooldown_timer: Timer = $DashCooldownTimer

var max_hp: int
var max_stamina: float
var max_eco: int

var current_hp: int
var current_stamina: float
var current_eco: int

var _prev_stamina: float = -1.0

var is_attacking: bool = false
var can_attack: bool = true

var is_dashing: bool = false
var can_dash: bool = true

var can_cast_spell: bool = true

var facing_direction: int = 1

func _ready() -> void:
	if stats == null:
		stats = PlayerStats.new()

	max_hp = stats.get_max_hp()
	max_stamina = float(stats.get_max_stamina())
	max_eco = stats.get_max_eco()

	current_hp = max_hp
	current_stamina = max_stamina
	current_eco = max_eco

	combat.setup(
		self ,
		attack_area,
		attack_duration_timer,
		attack_cooldown_timer
	)

	magic.setup(
		self ,
		spell_spawn_point,
		spell_cooldown_timer
	)

	dash.setup(
		self ,
		dash_duration_timer,
		dash_cooldown_timer
	)

	hp_changed.emit(current_hp, max_hp)
	stamina_changed.emit(current_stamina, max_stamina)
	eco_changed.emit(current_eco, max_eco)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if velocity.y > 0:
			velocity.y = 0
		if not is_dashing:
			current_stamina = minf(current_stamina + stamina_recover_rate * delta, max_stamina)

	var stamina_rounded := snappedf(current_stamina, 0.5)
	if stamina_rounded != _prev_stamina:
		_prev_stamina = stamina_rounded
		stamina_changed.emit(current_stamina, max_stamina)

	var direction := Input.get_axis("move_left", "move_right")

	if direction != 0 and not is_dashing:
		facing_direction = int(sign(direction))

	if not is_dashing:
		velocity.x = direction * move_speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		if current_stamina >= jump_stamina_cost and not is_dashing:
			velocity.y = jump_velocity
			_set_stamina(current_stamina - jump_stamina_cost)

	if Input.is_action_just_pressed("attack"):
		combat.try_attack()

	if Input.is_action_just_pressed("dash"):
		dash.try_dash(direction)

	if Input.is_action_just_pressed("cast_spell"):
		magic.try_cast_spell()

	combat.update_attack_area_direction()
	move_and_slide()

func take_damage(amount: int) -> void:
	current_hp = maxi(current_hp - amount, 0)
	hp_changed.emit(current_hp, max_hp)
	if current_hp <= 0:
		_on_death()

func _on_death() -> void:
	GameManager.on_player_death(self )

func _set_stamina(value: float) -> void:
	current_stamina = clampf(value, 0.0, max_stamina)
	stamina_changed.emit(current_stamina, max_stamina)

func _set_eco(value: int) -> void:
	current_eco = clampi(value, 0, max_eco)
	eco_changed.emit(current_eco, max_eco)
