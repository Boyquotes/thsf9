extends Area2D

#signal score
#var score_emitted = false
#var score = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_CryptoMonnaies_area_entered(area):
	print("signe paranormale")
	if area.is_in_group("joueurs"):
		get_node("..").crypto_won()
		queue_free()
	pass # replace with function body
