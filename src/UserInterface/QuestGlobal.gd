extends Node

onready var quest1 = "Retrieve all 40 coins in this world"
onready var quest2 = "Kill all your enemies!"
onready var quest3 = "Find the magic portal!"
onready var quest4 = "Retrieve 40 coins in this world"
onready var quest5 = "Find the secret tunnel"

enum QuestState {
	COMPLETED,
	INPROGRESS,
	NOTFOUNDYET,
}

func _ready():
	QuestState.NOTFOUNDYET

