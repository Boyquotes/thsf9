extends Area2D

var Level = preload("res://scn/Level.tscn")
var dog = preload("res://scn/dog.tscn")

const MOVE_SPEED = 250.0

var saute = false
var temps_saut = 0.8
var temps_saut_timer = 0

var is_game_over = false

signal gameOver
signal chienAbattu

var attack=false
var vie = 5

#cache the sprite here for fast access (we will set scale to flip it often)
onready var sprite = $sprite

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$AnimatedSprite.play()
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
		$AnimatedSprite.animation = "cours"
		$AnimatedSprite.flip_h = true
		input_dir.x -= 1.0
	
	if Input.is_key_pressed(KEY_RIGHT):
		$AnimatedSprite.animation = "cours"
		$AnimatedSprite.flip_h = false
		input_dir.x += 1.0
	if !Input.is_key_pressed(KEY_RIGHT) and !Input.is_key_pressed(KEY_LEFT) and attack == false:
		$AnimatedSprite.animation = "default"

	position += (delta * MOVE_SPEED) * input_dir
#	print(position)

	#saut
	if saute == false:
		if get_position().y < 550 :
			set_position( Vector2( get_position().x, get_position().y + 8 ) )
	else:
		set_position( Vector2( get_position().x, get_position().y - 6 ) )
		
	pass

func _input(event):
	if event.is_action_pressed("attack"):
		attack = true
		$AnimatedSprite.animation = "coup"
		print("attaqueSingleton")
		print(position)
		var dog_instance = dog.instance()
		print(dog_instance.position)
		var distance_ennemi = position.x - dog_instance.position.x
		print(distance_ennemi)
		if distance_ennemi < 0 and distance_ennemi > -200:
			print("on peut lincher")
			emit_signal("chienAbattu")
	if event.is_action_released("attack"):
		$AnimatedSprite.animation = "default"
		attack = false
	if event.is_action_pressed("saute"):
		saute = true
	pass

func _on_Player_area_entered(area):
	print('on me touche')
	if area.is_in_group("dogs"):
		print('le chien nous touche')
		is_game_over = true
		vie -= 1
		get_node("../HUD/Vie").text = "Vie: " + str(vie)
		#emit_signal("gameOver")
		#queue_free()
	pass # replace with function body
