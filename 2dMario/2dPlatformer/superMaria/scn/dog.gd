extends Area2D

const MOVE_SPEED = 25.0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var input_dir = Vector2()
	input_dir.x = 1.0

	position += (delta * MOVE_SPEED) * input_dir
	pass
