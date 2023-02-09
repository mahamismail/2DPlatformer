extends Area2D

var health = Global.health
onready var game = get_node(@"../../../")

#If player enters the Lava's Area2D, the game ends.
func _on_Lava_body_entered(body):
	if body is Player:
		health = health - 1
	pass # Replace with function body.
