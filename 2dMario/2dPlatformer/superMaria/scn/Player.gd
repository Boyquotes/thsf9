extends Area2D

var Level = preload("res://scn/Level.tscn")

const MOVE_SPEED = 2500.0
const JUMP_SPEED = 6

var saute = false
var temps_saut = 1
var temps_saut_timer = 0

var is_game_over = false

signal gameOver

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process_input( true )

func _process(delta):
	if saute && temps_saut_timer < temps_saut:
		temps_saut_timer += delta
	else:
		saute = false
		temps_saut_timer = 0
	
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
	
	if saute == false:
		if get_position().y < 558 :
			set_position( Vector2( get_position().x, get_position().y + 2 ) )
	else:
		set_position( Vector2( get_position().x, get_position().y - 2 ) )
		

func _input(event):
	if event.is_action_pressed( "saute" ):
		saute = true

func _on_Player_area_entered(area):
	print('on me touche')
	if area.is_in_group("dogs"):
		print('le chien nous touche')
		is_game_over = true
		#emit_signal("gameOver")
		queue_free()
	pass # replace with function body
