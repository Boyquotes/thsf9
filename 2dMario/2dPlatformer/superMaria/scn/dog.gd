extends Area2D

const MOVE_SPEED = 350.0

var monTerritoire = false
signal attaqueEnCours
signal chienTresProche

func _ready():
	$AnimatedSprite.animation = "cours"
	$AnimatedSprite.play()
	pass

func _process(delta):
	var input_dir = Vector2()
	input_dir.x = 1.0
	if !monTerritoire:
		position += (delta * MOVE_SPEED) * input_dir
	pass


func _on_Territoire_area_entered(area):
	if !area.is_in_group("dogs"):
		monTerritoire = true
		print("c'est mon territoire")
		$AnimatedSprite.animation = "attack"
		emit_signal("attaqueEnCours")

	pass # replace with function body


func _on_dog_area_entered(area):
	#On verifie que ce ne soit pas la seconde area du dog qui se détecte entre elles
	if !area.is_in_group("dogs"):
		print("tres proche")
		emit_signal("chienTresProche")
		pass # replace with function body
