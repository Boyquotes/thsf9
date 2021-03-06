extends KinematicBody2D

const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const MIN_ONAIR_TIME = 0.1
const WALK_SPEED = 250 # pixels/sec
const JUMP_SPEED = 600
const SIDING_CHANGE_SPEED = 10
const BULLET_VELOCITY = 1000
const SHOOT_TIME_SHOW_WEAPON = 0.2

var linear_vel = Vector2()
var onair_time = 0 #
var on_floor = false
var shoot_time=99999 #time since last shot

var anim=""

#cache the sprite here for fast access (we will set scale to flip it often)
onready var sprite = $sprite

func _physics_process(delta):
	#increment counters

	onair_time += delta
	shoot_time += delta

	### MOVEMENT ###

	# Apply Gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and Slide
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect Floor
	if is_on_floor():
		onair_time = 0

	on_floor = onair_time < MIN_ONAIR_TIME

	### CONTROL ###

	# Horizontal Movement
	var target_speed = 0
	print(Input.get_joy_axis(1,JOY_AXIS_0))
	# Go to the left with joypad
	if Input.get_joy_axis(0,JOY_AXIS_0) < 0 :
		target_speed += -1
	# Go to the right with joypad
	if Input.get_joy_axis(0,JOY_AXIS_0) > 0.1 :
		target_speed += 1
		
	if Input.is_action_pressed("ui_left") :
		target_speed += -1
	if Input.is_action_pressed("ui_right"):
		target_speed +=  1

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)

	# Jumping
	if on_floor and Input.is_action_just_pressed("ui_up"):
		linear_vel.y = -JUMP_SPEED
		$sound_jump.play()
	# Jumping with joypad
	print(Input.get_joy_axis(2,JOY_AXIS_1))
	if on_floor and Input.get_joy_axis(0, JOY_AXIS_1) < 0 :
		linear_vel.y = -JUMP_SPEED
		$sound_jump.play()