extends ParallaxLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	pass

func _process(delta):
	print(position)
	print(motion_mirroring)

	position.x = position.x - 70 * delta
	pass
