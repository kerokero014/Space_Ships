extends CharacterBody2D

const GRAVITY: float = 1200.0
const JUMP_POWER: float = -650.0

enum State { NORMAL, BENT }
var current_state: State = State.NORMAL

func _ready() -> void:
	current_state = State.NORMAL

func _process(delta: float) -> void:
	if Input.is_action_pressed("bentdown"):
		current_state = State.BENT
	else:
		current_state = State.NORMAL

	use_animation()

func _physics_process(delta: float) -> void:
	use_gravity(delta)
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_POWER
	
	move_and_slide()

func use_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

func use_animation() -> void:
	match current_state:
		State.NORMAL:
			$AnimatedSprite2D.play("run")
			$Standing.set_deferred("disabled", false)
			$Bent.set_deferred("disabled", true)
		State.BENT:
			$AnimatedSprite2D.play("bentdown")
			$Standing.set_deferred("disabled", true)
			$Bent.set_deferred("disabled", false)
