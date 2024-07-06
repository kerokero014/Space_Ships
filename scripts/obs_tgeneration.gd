extends Node

@onready var pl_bird := preload("res://obstacles/bird.tscn")
@onready var pl_cactus := preload("res://obstacles/cactus.tscn")

func _ready() -> void:
	randomize()
	generate_osb()
	# Set up a timer to generate obstacles at intervals
	var timer = Timer.new()
	timer.wait_time = 2.0  # Time in seconds between obstacle generation
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	add_child(timer)
	timer.start()

func _process(delta: float) -> void:
	pass

func generate_osb() -> void:
	var rnd: int = int(randi() % 2)
	
	match rnd:
		0:
			var inst_bird = pl_bird.instantiate() as Area2D
			add_child(inst_bird)
			inst_bird.position = Vector2(1171, 494)  # Example position, adjust as needed
		1:
			var inst_cactus = pl_cactus.instantiate() as Area2D
			add_child(inst_cactus)
			inst_cactus.position = Vector2(643, 543)  # Example position, adjust as needed

func _on_Timer_timeout() -> void:
	generate_osb()
