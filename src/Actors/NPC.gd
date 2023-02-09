extends KinematicBody2D

onready var QuestState = QuestGlobal.QuestState
onready var dialogue = $Dialogue

signal quest_accepted()

func _ready():
	$Dialogue.hide()

func _unhandled_input(event):
	
	if dialogue.is_visible():
		if event.is_action_pressed("yes"):
			print("quest accepted!")
			emit_signal("quest_accepted")
			$CollisionShape2D.set_deferred("disabled", true)
			$TextEdit.set_text("..")
		elif event.is_action_pressed("no"):
			$Dialogue.hide()
			$TextEdit.show()  #hides the exclamation marks
			print("quest declined!")

func quest_is_completed():
	QuestState.COMPLETED
	$CollisionShape2D.set_deferred("disabled", true)
	print("Quest completed!")

func _quest_is_inProgress():
	QuestState.INPROGRESS
	print("Quest is in progress")
