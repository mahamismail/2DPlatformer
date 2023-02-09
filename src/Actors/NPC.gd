extends KinematicBody2D

enum QuestState {
	COMPLETED,
	INPROGRESS,
	NOTFOUND,
}

func _ready():
	QuestState.NOTFOUND
	
func quest_is_completed():
	QuestState.COMPLETED
	$CollisionShape2D.set_deferred("disabled", true)
	print("Quest completed!")

func quest_is_inProgress():
	QuestState.INPROGRESS
	print("Quest is in progress")
	
