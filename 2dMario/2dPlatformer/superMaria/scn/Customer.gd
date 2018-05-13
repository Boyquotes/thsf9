extends Sprite
var beer
var compteur = 0

func _ready():
	var compteur = 0
	$AnimationPlayer.play("FadeIn")

func _on_BeerArea_body_entered( body ):
	if body.has_method("throw_beer"):
		beer = body
		$Timer.start()

func _on_BeerArea_body_exited( body ):
	if body.has_method("throw_beer"):
		beer = null
		$Timer.stop()
		$Timer.wait_time = 1

func _on_Timer_timeout():
	$AnimationPlayer.play("FadeOut")
	beer.get_node("AnimationPlayer").play("FadeOut")

func _on_AnimationPlayer_animation_finished( anim_name ):
	if anim_name == "FadeOut":
#		beer.queue_free()
		compteur += 1
		print(compteur)
		self.queue_free()
