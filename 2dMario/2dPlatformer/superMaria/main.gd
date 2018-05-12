extends Node2D

var dog = preload("res://scn/dog.tscn")
var score = 0

func _ready():
	dog.connect("monTerritoire", self, "_on_territoire")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_territoire():
	print("mon territoire signal recu")
	
func crypto_won():
	score += 100
	get_node("HUD/LabelCryptoMonnaie").text = "CryptoMonnaie: " + str(score)
	
	
	