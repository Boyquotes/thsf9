extends Node

var beer_res = preload("res://scn/Beer.tscn")
var beer_icon = preload("res://scn/BeerIcon.tscn")
var customer_res = preload("res://scn/Customer.tscn")
var curr_index = 0
var curr_beer

var mouse_btn_pressed
var throw_vel = 0

func _ready():
	print("debut")
	spawn_beer()
	print("fin")

func _on_CustomerTimer_timeout():
	var customer = customer_res.instance()
	customer.position = $CustomerSpawn.position + Vector2(90 * (randi() % 6), 0)
	$Customers.add_child(customer)


func spawn_beer():
	var beer = beer_res.instance()
	beer.position = $BeerSpawn.position
	#self.connect(beer, self, "spawn_beer")
	$Beers.add_child(beer)
	curr_beer = beer

func _input(event):

	if event is InputEventMouseButton:
		print(event.pressed)
		if event.pressed:
			mouse_btn_pressed = true
		else:
			if mouse_btn_pressed:
				mouse_btn_pressed = false
				print("ici")
				print(curr_beer)
				if curr_beer != null:
					curr_beer.throw_beer(throw_vel/20)
					throw_vel = 0
					self.spawn_beer()

	if event is InputEventMouseMotion:
		if mouse_btn_pressed:
			throw_vel += event.speed.x


func _on_AddBeerBtn_pressed():
	var beer = beer_icon.instance()
	$UI/BeerContainer.add_child(beer)

func _on_ClearsBeers_pressed():
	print("clear clique")
	print($Beers)
	if($Beers != null):
		for child in $Beers.get_children():
			child.queue_free()

func _on_Area51_body_entered( body ):
	if body.has_method("throw_beer"):
		body.get_node("AnimationPlayer").play("FadeOut")
