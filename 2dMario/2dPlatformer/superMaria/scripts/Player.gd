extends Area2D

var Level = preload("res://scn/Level.tscn")

const MOVE_SPEED = 250.0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var input_dir = Vector2()
#	if Input.is_key_pressed(KEY_UP):
#		input_dir.y -= 1.0
#	if Input.is_key_pressed(KEY_DOWN):
#		input_dir.y += 1.0
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x -= 1.0
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x += 1.0
		
	position += (delta * MOVE_SPEED) * input_dir
	pass
