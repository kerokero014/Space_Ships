extends Area2D


const VELOCITY:float = 250.0

func _physics_process(delta:float) -> void:
	position.x -= VELOCITY * delta
