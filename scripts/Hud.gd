extends CanvasLayer

@onready var hp_bar: TextureProgressBar = $HUDRoot/HPBar
@onready var stamina_bar: TextureProgressBar = $HUDRoot/StaminaBar
@onready var eco_bar: TextureProgressBar = $HUDRoot/EcoBar

var player: Node = null

func _ready() -> void:
	# procura o Player na cena
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		push_warning("HUD: Player not found in group 'player'")

func _process(delta: float) -> void:
	if player == null:
		return

	# assumindo que o Player tem hp, max_hp, stamina, max_stamina, eco, max_eco
	hp_bar.value = float(player.hp) / float(player.max_hp)
	stamina_bar.value = float(player.stamina) / float(player.max_stamina)
	eco_bar.value = float(player.eco) / float(player.max_eco)
