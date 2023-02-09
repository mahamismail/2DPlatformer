extends Panel

var coins_collected = Global.coins_collected

onready var coins_label = $Label
#onready var stateOfQ = QuestGlobal.stateOfQ
#onready var QuestState = QuestGlobal.QuestState

signal you_Win()
signal updateUIOnComp()

func _ready():
	coins_label.set_text(str(coins_collected))
	# Static types are necessary here to avoid warnings.
	var anim_sprite: AnimatedSprite = $AnimatedSprite
	anim_sprite.play()
	
	var _player_path = get_node(@"../../Level/Player")
	#var _player_path = get_node(@"../../Level/Player")
	_player_path.connect("collect_coin", self, "_collect_coin")

func _collect_coin():
	coins_collected += 1
	coins_label.set_text(str(coins_collected))
	
	#if stateOfQ == QuestState.INPROGRESS:
	if coins_collected == 40: #if all 40 coins collected, emit the signal "you win"
		print("Updating UI")
		emit_signal("you_Win")
		emit_signal("updateUIOnComp")
		#emit_signal("you_Win")
		pass
