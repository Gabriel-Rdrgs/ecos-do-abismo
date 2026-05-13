extends Area2D

func _ready() -> void:
    body_entered.connect(_on_body_entered)
    _create_placeholder_visual()

func _on_body_entered(body: Node) -> void:
    if not body is CharacterBody2D:
        return
    GameManager.try_recover_eco(body)
    queue_free()

func _create_placeholder_visual() -> void:
    var sprite := $Sprite2D
    var image := Image.create(32, 32, false, Image.FORMAT_RGBA8)
    image.fill(Color(0.4, 0.8, 1.0, 0.7))
    sprite.texture = ImageTexture.create_from_image(image)
    sprite.modulate = Color(0.4, 0.8, 1.0, 0.8)