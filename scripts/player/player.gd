extends CharacterBody2D

@export var move_speed: float = 180.0
@export var jump_velocity: float = -380.0
@export var gravity: float = 980.0

@export var jump_stamina_cost: float = 10.0
@export var stamina_recover_rate: float = 20.0

@export var attack_stamina_cost: float = 12.0
@export var attack_duration: float = 0.15
@export var attack_cooldown: float = 0.30
@export var attack_damage: int = 10

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

var max_hp: int
var max_stamina: float
var max_eco: int

var current_hp: int
var current_stamina: float
var current_eco: int

var is_attacking: bool = false
var can_attack: bool = true

var is_dashing: bool = false
var can_dash: bool = true

var can_cast_spell: bool = true

var facing_direction: int = 1
var dash_direction: int = 1

func _ready() -> void:
	if stats == null:
		stats = PlayerStats.new()

	max_hp = stats.get_max_hp()
	max_stamina = float(stats.get_max_stamina())
	max_eco = stats.get_max_eco()

	current_hp = max_hp
	current_stamina = max_stamina
	current_eco = max_eco

	attack_area.monitoring = false
	attack_area.body_entered.connect(_on_attack_area_body_entered)
	attack_area.area_entered.connect(_on_attack_area_area_entered)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if velocity.y > 0:
			velocity.y = 0
		if not is_dashing:
			current_stamina = minf(current_stamina + stamina_recover_rate * delta, max_stamina)

	var direction := Input.get_axis("move_left", "move_right")

	if direction != 0 and not is_dashing:
		facing_direction = int(sign(direction))

	if not is_dashing:
		velocity.x = direction * move_speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		if current_stamina >= jump_stamina_cost and not is_dashing:
			velocity.y = jump_velocity
			current_stamina -= jump_stamina_cost

	if Input.is_action_just_pressed("attack"):
		try_attack()

	if Input.is_action_just_pressed("dash"):
		try_dash(direction)

	if Input.is_action_just_pressed("cast_spell"):
		try_cast_spell()

	update_attack_area_direction()
	move_and_slide()

func try_attack() -> void:
	if not can_attack or is_dashing:
		return

	if current_stamina < attack_stamina_cost:
		return

	can_attack = false
	is_attacking = true
	current_stamina -= attack_stamina_cost
	attack_area.monitoring = true

	await get_tree().create_timer(attack_duration).timeout
	attack_area.monitoring = false
	is_attacking = false

	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

func try_dash(input_direction: float) -> void:
	if not can_dash or is_attacking:
		return

	if current_stamina < dash_stamina_cost:
		return

	can_dash = false
	is_dashing = true
	current_stamina -= dash_stamina_cost

	if input_direction != 0:
		dash_direction = int(sign(input_direction))
	else:
		dash_direction = facing_direction

	velocity.x = dash_direction * dash_speed
	velocity.y = 0

	await get_tree().create_timer(dash_duration).timeout
	is_dashing = false

	await get_tree().create_timer(dash_cooldown).timeout
	can_dash = true

func try_cast_spell() -> void:
	if not can_cast_spell or is_dashing:
		return

	if current_eco < spell_eco_cost:
		return

	if spell_scene == null:
		return

	can_cast_spell = false
	current_eco -= int(spell_eco_cost)

	var projectile = spell_scene.instantiate()
	if projectile == null:
		can_cast_spell = true
		return

	get_tree().current_scene.add_child(projectile)
	projectile.global_position = spell_spawn_point.global_position
	projectile.set("direction", facing_direction)

	await get_tree().create_timer(spell_cooldown).timeout
	can_cast_spell = true

func update_attack_area_direction() -> void:
	var attack_offset := 20.0
	attack_area.position.x = attack_offset * facing_direction

func _on_attack_area_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(attack_damage)

func _on_attack_area_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(attack_damage)
