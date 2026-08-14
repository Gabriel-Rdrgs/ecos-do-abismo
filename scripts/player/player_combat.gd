extends Node

var player: CharacterBody2D
var attack_area: Area2D
var attack_duration_timer: Timer
var attack_cooldown_timer: Timer

func setup(
    p_player: CharacterBody2D,
    p_attack_area: Area2D,
    p_attack_duration_timer: Timer,
    p_attack_cooldown_timer: Timer
) -> void:
    player = p_player
    attack_area = p_attack_area
    attack_duration_timer = p_attack_duration_timer
    attack_cooldown_timer = p_attack_cooldown_timer

    attack_area.monitoring = false

    if not attack_area.body_entered.is_connected(_on_attack_area_body_entered):
        attack_area.body_entered.connect(_on_attack_area_body_entered)

    if not attack_area.area_entered.is_connected(_on_attack_area_area_entered):
        attack_area.area_entered.connect(_on_attack_area_area_entered)

    if not attack_duration_timer.timeout.is_connected(_on_attack_duration_timeout):
        attack_duration_timer.timeout.connect(_on_attack_duration_timeout)

    if not attack_cooldown_timer.timeout.is_connected(_on_attack_cooldown_timeout):
        attack_cooldown_timer.timeout.connect(_on_attack_cooldown_timeout)

func try_attack() -> void:
    if not player.can_attack or player.is_dashing:
        return

    if player.current_stamina < player.attack_stamina_cost:
        return

    player.can_attack = false
    player.is_attacking = true
    player._set_stamina(player.current_stamina - player.attack_stamina_cost)

    attack_area.monitoring = true
    attack_duration_timer.start()

func update_attack_area_direction() -> void:
    var attack_offset := 20.0
    attack_area.position.x = attack_offset * player.facing_direction

func _on_attack_duration_timeout() -> void:
    attack_area.monitoring = false
    player.is_attacking = false
    attack_cooldown_timer.start()

func _on_attack_cooldown_timeout() -> void:
    player.can_attack = true

func _on_attack_area_body_entered(body: Node) -> void:
    if body.has_method("take_damage"):
        var damage := CombatCalculator.calculate_physical_damage(player.stats)
        body.take_damage(damage)

func _on_attack_area_area_entered(area: Area2D) -> void:
    if area.has_method("take_damage"):
        var damage := CombatCalculator.calculate_physical_damage(player.stats)
        area.take_damage(damage)