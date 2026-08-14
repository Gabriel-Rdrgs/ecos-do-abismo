extends Area2D

@export var speed: float = 500.0
@export var lifetime: float = 1.5
@export var damage: int = 15

var direction: int = 1

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

	if not area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)

	_create_placeholder_visual()

	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position.x += speed * delta * direction

func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()

func _create_placeholder_visual() -> void:
	var sprite: Sprite2D = $Sprite2D
	if sprite.texture != null:
		return
	var image := Image.create(16, 16, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.4, 0.9, 1.0, 0.9))
	sprite.texture = ImageTexture.create_from_image(image)