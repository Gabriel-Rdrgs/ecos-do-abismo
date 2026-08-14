extends Area2D

@export var speed: float = 500.0
@export var lifetime: float = 1.5
@export var base_damage: int = 35 # Dardo de Eco — GDD 6.3: "Dano base: 35 + INT * 0.7"
@export var intelligence_scaling: float = 0.7
@export var faith_scaling: float = 0.0

var direction: int = 1
var caster_stats: PlayerStats

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

	if not area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)

	if caster_stats == null:
		push_warning("[EcoProjectile] caster_stats não foi atribuído — dano usará apenas base_damage, sem scaling de INT/FTH.")

	_create_placeholder_visual()

	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position.x += speed * delta * direction

func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		var final_damage := CombatCalculator.calculate_spell_damage(
			caster_stats, base_damage, intelligence_scaling, faith_scaling
		)
		body.take_damage(final_damage)
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		var final_damage := CombatCalculator.calculate_spell_damage(
			caster_stats, base_damage, intelligence_scaling, faith_scaling
		)
		area.take_damage(final_damage)
		queue_free()

func _create_placeholder_visual() -> void:
	var sprite: Sprite2D = $Sprite2D
	if sprite.texture != null:
		return
	var image := Image.create(16, 16, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.4, 0.9, 1.0, 0.9))
	sprite.texture = ImageTexture.create_from_image(image)