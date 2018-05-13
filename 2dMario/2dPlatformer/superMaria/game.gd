extends Node2D

onready var window_size = OS.get_window_size()
onready var player = get_node("Player")
onready var player_world_pos = get_player_world_pos()


func _ready():
#	print('la')
#	print(player_world_pos)
	pass

func _process(delta):
	var pos = player.position
#	print(get_node('bar'))
	var posArea2d = get_node('bar').position
	
#	print("size")
	#var size = player.get_size()
	print(pos.y)
	print(posArea2d.y)
	if pos.y > posArea2d.y:
		get_tree().change_scene("res://main.tscn")
#	print('ici')
#	print(player_world_pos)
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass


func get_player_world_pos():
	# Converts the player position to the map he's on. Returns the map id/coordinates as Vector2
	var pos = player.position
#	print(get_node('bar'))
	var posArea2d = get_node('bar').position

#	print("size")
	#var size = player.get_size()
#	print(pos)
#	print(posArea2d)
#	print(player)
	var x = floor(pos.x / window_size.x)
	var y = floor(pos.y / window_size.y)
	return Vector2(x, y)
#	return pos
	
func _update_camera():
#	print("update camera")
	# Checks if the player is touching or moved beyond the view rectangle's edges
	# If so, offset the camera in this direction
	var new_player_world_pos = get_player_world_pos()
	var transform = Transform2D()
	
	if new_player_world_pos != player_world_pos:
		player_world_pos = new_player_world_pos
		transform = get_viewport().get_canvas_transform()
		transform[2] = -player_world_pos * window_size
		get_viewport().set_canvas_transform(transform)
	return transform


func _on_Area2D_area_entered(area):
	print("on va au bar")
	pass # replace with function body
