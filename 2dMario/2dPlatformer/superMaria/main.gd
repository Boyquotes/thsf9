extends Node2D

var score = 0

func _ready():
	get_node("dog").connect("chienTresProche", self, "_on_chienTresProche")
	get_node("dog").connect("attaqueEnCours", self, "_on_attaqueEnCours")
	get_node("Player").connect("chienAbattu", self, "_on_chienAbattu")
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	pass

func _on_chienTresProche():
	print("chienTresProche signal recu")
	
func _on_attaqueEnCours():
	print("attttttaaaaaaaaquuueeee")
	
func crypto_won():
	score += 100
	get_node("HUD/LabelCryptoMonnaie").text = "CryptoMonnaie: " + str(score)
	
func _on_chienAbattu():
	print('virer le chien virer le chien virer le chien virer le chien')
	get_node("dog").queue_free()
	