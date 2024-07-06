extends Area2D


const VELOCITY:float = 250.0

func _physics_process(delta:float) -> void:
	position.x -= VELOCITY * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "player":
		area.queue_free()


func _on_body_entered(body):
	if body.name == "cactus":
		body.queue_free()
