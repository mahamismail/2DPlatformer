extends Panel

#var health = 3
var health = Global.health
onready var health_label = $Amount

onready var animation_player = $Heart/AnimationPlayer

signal you_Died()

func _ready():
#	health_label.set_text(str(health))
		# Check if the game is in splitscreen mode by checking the scene root name.
	if get_tree().get_root().get_child(0).name == "Splitscreen":
		var _level_node = get_node(@"../../../../Black/SplitContainer/ViewportContainer1/Viewport1/Level")
		_level_node.get_node("Player1").connect("lose_health", self, "_lose_health")
		_level_node.get_node("Player2").connect("lose_health", self, "_lose_health")
	else:
		var _player_path = get_node(@"../../Level/Player")
		_player_path.connect("lose_health", self, "_lose_health")
	
func _lose_health():
	animation_player.play("HeartLost")
	health = health - 1
	health_label.set_text(str(health))
	print(health)
	
	if health <= 0:
		emit_signal("you_Died")
		pass
