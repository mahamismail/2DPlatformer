extends Control

#Tutorial Reference: https://www.youtube.com/watch?v=Su3pU14YzeY

var questMenu_showing = false setget questMenu_is_showing

func _unhandled_input(event):
	if event.is_action_pressed("QuestsMenu"):
		self.questMenu_showing = !questMenu_showing
	
func _ready():
	hide()


func _quest_is_inProgress():
	$ColorRect/QuestPanel/InProgress


func questMenu_is_showing(value):
	questMenu_showing = value
	get_tree().paused =  questMenu_showing
	visible = questMenu_showing

func _on_CloseButton_pressed():
	self.questMenu_showing = false
	pass # Replace with function body.


func _on_QuestMenuButton_pressed():
	self.questMenu_showing = true
	pass # Replace with function body.
