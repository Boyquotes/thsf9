#extends Node2D
#
#var cryptoMonnaies = preload("res://scn/cryptoMonnaies.tscn")
#
#
#func _ready():
#	print("on connect")
#	cryptoMonnaies.connect("score", self, "_on_Player_score")
#	print("on connect en dessous")
#	pass
#
##func _process(delta):
##
##	pass
#
#func _on_Player_score():
#	print("on score")
#	#get_node("LabelCryptoMonnaie").text = "Score: " + str(score)