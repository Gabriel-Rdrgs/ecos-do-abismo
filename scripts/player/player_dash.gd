extends Node

var player: CharacterBody2D
var dash_duration_timer: Timer
var dash_cooldown_timer: Timer

func setup(
    p_player: CharacterBody2D,
    p_dash_duration_timer: Timer,
    p_dash_cooldown_timer: Timer
) -> void:
    player = p_player
    dash_duration_timer = p_dash_duration_timer
    dash_cooldown_timer = p_dash_cooldown_timer

    if not dash_duration_timer.timeout.is_connected(_on_dash_duration_timeout):
        dash_duration_timer.timeout.connect(_on_dash_duration_timeout)

    if not dash_cooldown_timer.timeout.is_connected(_on_dash_cooldown_timeout):
        dash_cooldown_timer.timeout.connect(_on_dash_cooldown_timeout)

func try_dash(input_direction: float) -> void:
    if not player.can_dash or player.is_attacking:
        return
    if player.current_stamina < player.dash_stamina_cost:
        return

    player.can_dash = false
    player.is_dashing = true
    player._set_stamina(player.current_stamina - player.dash_stamina_cost)

    var dash_direction: int
    if input_direction != 0:
        dash_direction = int(sign(input_direction))
    else:
        dash_direction = player.facing_direction

    player.velocity.x = dash_direction * player.dash_speed
    player.velocity.y = 0

    dash_duration_timer.start()

func _on_dash_duration_timeout() -> void:
    player.is_dashing = false
    dash_cooldown_timer.start()

func _on_dash_cooldown_timeout() -> void:
    player.can_dash = true