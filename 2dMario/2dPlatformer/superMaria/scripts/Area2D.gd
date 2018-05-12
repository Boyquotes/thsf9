extends Area2D

var dedans = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_UP) and dedans == true:
		get_tree().change_scene("res://scn/Level2.tscn")
	pass


func _on_Area2D_area_entered(area):
	print("on peut rentrer")
	dedans = true
	pass # replace with function body
