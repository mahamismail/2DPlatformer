extends Panel

#var health = 3
var health = Global.health
onready var health_label = $Amount
onready var animation_player = $Heart/AnimationPlayer

signal you_Died()

func _ready():
		# Check if the game is in splitscreen mode by checking the scene root name.
	if get_tree().get_root().get_child(1).name == "Game":
		var _player_path = get_node(@"../../Level/Player")
		_player_path.connect("lose_health", self, "_lose_health")
	
func _lose_health(): #When player collides with enemy, this function is called.
	animation_player.play("HeartLost")
	health = health - 1
	health_label.set_text(str(health))
	print(health)
	
	if health <= 0: #if health is 0 or less, you die. 
		emit_signal("you_Died")
		pass
