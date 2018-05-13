extends Area2D

const MOVE_SPEED = 350.0

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
		$AnimatedSprite.stop()
		print("c'est mon territoire")
		$AnimatedSprite.animation = "attack"
		$AnimatedSprite.play()
	pass # replace with function body


func _on_dog_area_entered(area):
	print("le chien attaque")
	pass # replace with function body
