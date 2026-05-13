extends CanvasLayer

@onready var hp_label: Label = $Panel/StatsList/HPLabel
@onready var stamina_label: Label = $Panel/StatsList/StaminaLabel
@onready var eco_label: Label = $Panel/StatsList/EcoLabel

func connect_to_player(player: CharacterBody2D) -> void:
	player.hp_changed.connect(_on_hp_changed)
	player.stamina_changed.connect(_on_stamina_changed)
	player.eco_changed.connect(_on_eco_changed)

func _on_hp_changed(current: int, maximum: int) -> void:
	hp_label.text = "HP: %d / %d" % [current, maximum]

func _on_stamina_changed(current: float, maximum: float) -> void:
	stamina_label.text = "Stamina: %d / %d" % [int(current), int(maximum)]

func _on_eco_changed(current: int, maximum: int) -> void:
	eco_label.text = "Eco: %d / %d" % [current, maximum]
