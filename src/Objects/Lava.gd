extends Area2D

var health = Global.health
onready var game = get_node(@"../../../")

func _on_Lava_body_entered(body):
	if body is Player:
		health = 0
		body.hide()
		game.end_Game()
	pass # Replace with function body.
