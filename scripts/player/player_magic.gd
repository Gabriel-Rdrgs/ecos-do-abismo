extends Node

var player: CharacterBody2D
var spell_spawn_point: Marker2D
var spell_cooldown_timer: Timer

func setup(
    p_player: CharacterBody2D,
    p_spell_spawn_point: Marker2D,
    p_spell_cooldown_timer: Timer
) -> void:
    player = p_player
    spell_spawn_point = p_spell_spawn_point
    spell_cooldown_timer = p_spell_cooldown_timer

    if not spell_cooldown_timer.timeout.is_connected(_on_spell_cooldown_timeout):
        spell_cooldown_timer.timeout.connect(_on_spell_cooldown_timeout)

func try_cast_spell() -> void:
    # DEBUG TEMPORÁRIO — remover após validação da magia
    print("[PlayerMagic] try_cast_spell() chamado | current_eco=%s spell_eco_cost=%s spell_scene_null=%s" % [
        player.current_eco, player.spell_eco_cost, player.spell_scene == null
    ])

    if not player.can_cast_spell or player.is_dashing:
        # DEBUG TEMPORÁRIO — remover após validação da magia
        print("[PlayerMagic] cast bloqueado: can_cast_spell=%s is_dashing=%s" % [player.can_cast_spell, player.is_dashing])
        return
    if player.current_eco < player.spell_eco_cost:
        # DEBUG TEMPORÁRIO — remover após validação da magia
        print("[PlayerMagic] cast bloqueado: eco insuficiente (%s < %s)" % [player.current_eco, player.spell_eco_cost])
        return
    if player.spell_scene == null:
        push_warning("[PlayerMagic] spell_scene está null — configure 'Spell Scene' no Inspector do nó Player")
        return

    player.can_cast_spell = false
    player._set_eco(player.current_eco - int(player.spell_eco_cost))
    # DEBUG TEMPORÁRIO — remover após validação da magia
    print("[PlayerMagic] eco gasto, novo current_eco=", player.current_eco)

    var projectile = player.spell_scene.instantiate()
    if projectile == null:
        push_warning("[PlayerMagic] spell_scene.instantiate() retornou null — devolvendo eco gasto")
        player._set_eco(player.current_eco + int(player.spell_eco_cost))
        player.can_cast_spell = true
        return
    # DEBUG TEMPORÁRIO — remover após validação da magia
    print("[PlayerMagic] projétil instanciado: ", projectile)

    player.get_tree().current_scene.add_child(projectile)
    projectile.global_position = spell_spawn_point.global_position
    projectile.set("direction", player.facing_direction)
    # DEBUG TEMPORÁRIO — remover após validação da magia
    print("[PlayerMagic] projétil adicionado à cena: nome=%s posição=%s" % [projectile.name, projectile.global_position])

    spell_cooldown_timer.start()

func _on_spell_cooldown_timeout() -> void:
    player.can_cast_spell = true