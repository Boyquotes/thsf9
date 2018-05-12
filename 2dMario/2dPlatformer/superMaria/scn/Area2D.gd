extends Area2D

signal score
var score_emitted = false
var score = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_area_entered(area):
	score += 1
	print("signe paranormale")
	if not score_emitted:
		score_emitted = true
		print("scoring")
		print(score)
		emit_signal("score")
	queue_free()
	pass # replace with function body


