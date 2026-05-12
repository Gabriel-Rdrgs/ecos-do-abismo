extends CanvasLayer

@onready var hp_label: Label = $Panel/StatsList/HPLabel
@onready var stamina_label: Label = $Panel/StatsList/StaminaLabel
@onready var eco_label: Label = $Panel/StatsList/EcoLabel

var player: CharacterBody2D

func set_player(new_player: CharacterBody2D) -> void:
	player = new_player

func _process(_delta: float) -> void:
	if player == null:
		return

	if player.has_method("get"):
		var current_hp = player.get("current_hp")
		var max_hp = player.get("max_hp")
		var current_stamina = player.get("current_stamina")
		var max_stamina = player.get("max_stamina")
		var current_eco = player.get("current_eco")
		var max_eco = player.get("max_eco")

		hp_label.text = "HP: %d / %d" % [current_hp, max_hp]
		stamina_label.text = "Stamina: %d / %d" % [current_stamina, max_stamina]
		eco_label.text = "Eco: %d / %d" % [current_eco, max_eco]