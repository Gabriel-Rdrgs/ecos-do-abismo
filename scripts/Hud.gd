extends CanvasLayer

@onready var hp_bar: ProgressBar = $HUDRoot/HPBar
@onready var stamina_bar: ProgressBar = $HUDRoot/StaminaBar
@onready var eco_bar: ProgressBar = $HUDRoot/EcoBar

var player: Node = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		push_warning("HUD: Player not found in group 'player'")

func _process(delta: float) -> void:
	if player == null:
		return

	hp_bar.value = float(player.hp) / float(player.max_hp)
	stamina_bar.value = float(player.stamina) / float(player.max_stamina)
	eco_bar.value = float(player.eco) / float(player.max_eco)
