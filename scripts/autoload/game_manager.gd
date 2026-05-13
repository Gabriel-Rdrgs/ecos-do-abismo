extends Node

signal eco_lost(amount: int, position: Vector2)
signal eco_recovered(amount: int)

const ECO_SHADOW_SCENE = preload("res://scenes/world/eco_shadow.tscn")

var lost_eco: int = 0
var eco_lost_position: Vector2 = Vector2.ZERO
var has_lost_eco: bool = false

var _eco_shadow_instance: Node = null

func on_player_death(player: CharacterBody2D) -> void:
    lost_eco = player.current_eco

    if lost_eco > 0:
        eco_lost_position = player.global_position
        has_lost_eco = true
        eco_lost.emit(lost_eco, eco_lost_position)
        _spawn_eco_shadow()

    player.queue_free()

func try_recover_eco(player: CharacterBody2D) -> void:
    if not has_lost_eco:
        return

    has_lost_eco = false
    var recovered := lost_eco
    lost_eco = 0
    eco_lost_position = Vector2.ZERO
    _eco_shadow_instance = null

    player._set_eco(player.current_eco + recovered)
    eco_recovered.emit(recovered)

func _spawn_eco_shadow() -> void:
    if _eco_shadow_instance != null:
        _eco_shadow_instance.queue_free()

    _eco_shadow_instance = ECO_SHADOW_SCENE.instantiate()
    _eco_shadow_instance.global_position = eco_lost_position
    get_tree().current_scene.add_child.call_deferred(_eco_shadow_instance)