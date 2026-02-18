extends CharacterBody2D

# ===== Atributos básicos =====
var vig := 10
var sta := 10
var str := 10
var dex := 10
var int_stat := 10
var fth := 10

var max_hp: int
var max_stamina: int
var max_eco: int

var hp: int
var stamina: float
var eco: float

# ===== Movimento =====
const GRAVITY := 1200.0
const MOVE_SPEED := 200.0
const JUMP_FORCE := -400.0

func _ready() -> void:
	_calculate_stats()
	# TESTE: deixar tudo na metade para ver as barras mexendo
	hp = max_hp / 2
	stamina = max_stamina / 2
	eco = max_eco / 2

func _calculate_stats() -> void:
	max_hp = 100 + vig * 20
	max_stamina = 50 + sta * 10
	max_eco = 30 + (int_stat + fth) * 8

	hp = max_hp
	stamina = max_stamina
	eco = max_eco

func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_movement(delta)
	_handle_jump()

	move_and_slide()

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		# recupera um pouco de stamina parado no chão
		stamina = min(stamina + 20.0 * delta, max_stamina)

func _handle_movement(delta: float) -> void:
	var input_dir := 0.0
	if Input.is_action_pressed("move_left"):
		input_dir -= 1.0
	if Input.is_action_pressed("move_right"):
		input_dir += 1.0

	velocity.x = input_dir * MOVE_SPEED

func _handle_jump() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE
