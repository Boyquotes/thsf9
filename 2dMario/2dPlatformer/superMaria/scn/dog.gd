extends Area2D

const MOVE_SPEED = 51.0

signal monTerritoire

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var input_dir = Vector2()
	input_dir.x = 1.0
	$AnimatedSprite.animation = "cours"
	$AnimatedSprite.play()
	position += (delta * MOVE_SPEED) * input_dir
	pass


func _on_Territoire_area_entered(area):
	if !area.is_in_group("dogs"):
		print("c'est mon territoire")
		emit_signal("monTerritoire") 
	pass # replace with function body
