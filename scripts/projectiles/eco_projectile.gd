extends Area2D

@export var speed: float = 500.0
@export var lifetime: float = 1.5
@export var damage: int = 15

var direction: int = 1

func _ready() -> void:
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