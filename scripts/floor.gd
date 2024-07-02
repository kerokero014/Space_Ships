extends Node2D

const VELOCITY: float = 250.0

@onready var parts: Array = [$Track, $Track2]
var width_sprite: float

func _ready():
	width_sprite = parts[0].texture.get_size().x * parts[0].scale.x

func _process(delta: float) -> void:
	for part in parts:
		part.position.x -= VELOCITY * delta
		reset(part)

func reset(part: Sprite2D) -> void:
	if part.position.x < -width_sprite:
		part.position.x += 2 * width_sprite
