extends Area2D

@export var max_hp: int = 40

var current_hp: int

func _ready() -> void:
	current_hp = max_hp

func take_damage(amount: int) -> void:
	current_hp -= amount
	print("Enemy hit! HP atual:", current_hp)

	if current_hp <= 0:
		queue_free()