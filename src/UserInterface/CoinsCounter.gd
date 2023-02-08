extends Panel

var coins_collected = Global.coins_collected

onready var coins_label = $Label

signal you_Win()

func _ready():
	coins_label.set_text(str(coins_collected))
	# Static types are necessary here to avoid warnings.
	var anim_sprite: AnimatedSprite = $AnimatedSprite
	anim_sprite.play()

func _collect_coin():
	coins_collected += 1
	coins_label.set_text(str(coins_collected))
	print(Global.coin_collected)
	
	if coins_collected == 40: #if all 40 coins collected, emit the signal "you win"
		emit_signal("you_Win")
		pass
