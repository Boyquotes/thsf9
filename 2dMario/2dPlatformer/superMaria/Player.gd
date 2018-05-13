extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -700
var motion = Vector2()
var jumping = false
var size

signal move
var camera

enum Direction {TOP, RIGHT, DOWN, LEFT}

func ready():
	var sprite = get_node("Sprites")
	size = sprite.get_texture().get_size() * sprite_get_scale()
	print("taille debut")
	print(size)

func _physics_process(delta):
#	motion.y += GRAVITY
	var is_moving = Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")
	if ( is_moving and !jumping):
		if Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
		elif Input.is_action_pressed("ui_right"):
			motion.x = SPEED
		elif Input.is_action_pressed("ui_up"):
			motion.y = -SPEED
		elif Input.is_action_pressed("ui_down"):
			motion.y = SPEED
	else:
		motion.x = 0
		motion.y = 0

	if is_moving:
		emit_signal("move")
		
	if is_on_floor():
		print("On floor");
		if Input.is_action_just_pressed("ui_up"):
			print("On jump")
			motion.y = JUMP_HEIGHT
		
	motion = move_and_slide(motion,UP)

	pass