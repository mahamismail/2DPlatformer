extends KinematicBody2D

onready var quest = QuestGlobal.quest
onready var dialogue = $Dialogue
#onready var questDisplay = get_node(@"../../../InterfaceLayer/QuestDisplay")

signal quest_accepted()

enum QuestState {
	COMPLETED,
	INPROGRESS,
	NOTFOUNDYET,
}

func _ready():
	QuestState.NOTFOUNDYET
	$Dialogue.hide()
	
	if get_parent().get_name() == "NPCGuy1":
		quest = "Retrieve all 40 coins in this world"
	
	elif get_parent().get_name() == "NPCGuy2":
		quest = "Kill all your enemies!"
	
	elif get_parent().get_name() == "NPCGuy3":
		quest = "Find the magic portal!"

	elif get_parent().get_name() == "NPCGuy4":
		quest = "Retrieve 40 coins in this world"
	
	elif get_parent().get_name() == "NPCGuy5":
		quest = "Find the secret tunnel"
	
	#if get_parent().get_name() == "NPCGuy1":
	#	add_quest("QUEST 1", "Retrieve all 40 coins in this world")
	
	#elif get_parent().get_name() == "NPCGuy2":
	#	add_quest("QUEST 2", "Kill all your enemies!")
	
	#elif get_parent().get_name() == "NPCGuy3":
	#	add_quest("QUEST 3", "Find the magic portal!")
	
	#elif get_parent().get_name() == "NPCGuy4":
	#	add_quest("QUEST 4", "Retrieve 40 coins in this world")
	
	#elif get_parent().get_name() == "NPCGuy5":
	#	add_quest("QUEST 5", "Find the secret tunnel")
	
#var _player_path = get_node(@"../../Player")
	
# Function to add a new quest to the quest array
#func add_quest(name, description):
#	var quest
#	quest.name = name
#	quest.description = description
#	quests.append(quest)

func _unhandled_input(event):

	if event.is_action_pressed("yes"):
		print(quest + "accepted!")
		emit_signal("quest_accepted")
		$CollisionShape2D.set_deferred("disabled", true)
		
	if event.is_action_pressed("no"):
		$Dialogue.hide()
		$TextEdit.show()  #hides the exclamation marks
		print("quest declined!")

func quest_is_completed():
	QuestState.COMPLETED
	$CollisionShape2D.set_deferred("disabled", true)
	print("Quest completed!")

func quest_is_inProgress():
	QuestState.INPROGRESS
	print("Quest is in progress")
	

