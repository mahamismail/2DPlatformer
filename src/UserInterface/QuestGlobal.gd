extends Node

onready var quest = ""

onready var NPCGuy1 = get_node(@"/root/Game/Level/NPCs2/NPCGuy1")
onready var NPCGuy2 = get_node(@"/root/Game/Level/NPCs2/NPCGuy2")
onready var NPCGuy3 = get_node(@"/root/Game2/Level/NPCs2/NPCGuy3")
onready var NPCGuy4 = get_node(@"/root/Game2/Level/NPCs2/NPCGuy4")
onready var NPCGuy5 = get_node(@"/root/Game2/Level/NPCs2/NPCGuy5")

enum QuestState {
	COMPLETED,
	INPROGRESS,
	NOTFOUNDYET,
}

func _ready():
	QuestState.NOTFOUNDYET
	
	if NPCGuy1:
		quest = "Retrieve all 40 coins in this world"
	
	elif NPCGuy2:
		quest = "Kill all your enemies!"
	
	elif NPCGuy3:
		quest = "Find the magic portal!"

	elif NPCGuy4:
		quest = "Retrieve 40 coins in this world"
	
	elif NPCGuy5:
		quest = "Find the secret tunnel"

func quest_is_completed():
	QuestState.COMPLETED
	$CollisionShape2D.set_deferred("disabled", true)
	print("Quest completed!")

func quest_is_inProgress():
	QuestState.INPROGRESS
	print("Quest is in progress")
	

