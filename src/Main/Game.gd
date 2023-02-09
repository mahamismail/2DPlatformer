extends Node
# This class contains controls that should always be accessible, like pausing
# the game or toggling the window full-screen.

signal quest_is_inProgress()
signal quest_is_completed()

# The "_" prefix is a convention to indicate that variables are private,
# that is to say, another node or script should not access them.
onready var _pause_menu = $InterfaceLayer/PauseMenu
onready var pause_menu_label = $InterfaceLayer/PauseMenu/ColorRect/CenterContainer/VBoxContainer/Label
onready var resume_button = $InterfaceLayer/PauseMenu/ColorRect/CenterContainer/VBoxContainer/ResumeButton
onready var playAgain_button = $InterfaceLayer/PauseMenu/ColorRect/CenterContainer/VBoxContainer/PlayAgainButton
onready var questDisplay = $InterfaceLayer/QuestDisplay
onready var questDescription = $InterfaceLayer/QuestDisplay/Panel/QuestDescription
onready var questAccepted = $InterfaceLayer/QuestDisplay/Panel/Accepted

onready var questMenu = $InterfaceLayer/QuestMenu/ColorRect/QuestPanel
onready var questsInProgress = questMenu.get_node("In_Progress")
onready var questsCompleted = questMenu.get_node("Completed")
onready var placeholderProg = questsInProgress.get_node("Placeholder")
onready var placeholderComp = questsCompleted.get_node("Placeholder")

func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()


onready var NPCGuy1 = $Level/NPCs2/NPCGuy1
onready var NPCGuy2 = $Level/NPCs2/NPCGuy2
onready var NPCGuy3 = $Level/NPCs2/NPCGuy3
onready var NPCGuy4 = $Level/NPCs2/NPCGuy4
onready var NPCGuy5 = $Level/NPCs2/NPCGuy5


#func _notification(what):
#	if what == NOTIFICATION_WM_QUIT_REQUEST:
		# We need to clean up a little bit first to avoid Viewport errors.
#		if name == "Splitscreen":
#			$Black/SplitContainer/ViewportContainer1.free()
#			$Black.queue_free()


func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()
	# The GlobalControls node, in the Stage scene, is set to process even
	# when the game is paused, so this code keeps running.
	# To see that, select GlobalControls, and scroll down to the Pause category
	# in the inspector.
	elif event.is_action_pressed("toggle_pause"):
		var tree = get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			_pause_menu.open()
		else:
			_pause_menu.close()
		get_tree().set_input_as_handled()

#DON'T FORGET TO LINK ALL THE NPCs TO THIS
func _quest_accepted():	
	#CHANGES IN QUEST DISPLAY & QUEST MENU
	questDisplay.show()
	
	if placeholderProg.is_visible():
		placeholderProg.hide()
	
	if get_tree().get_current_scene().get_name() == "Game":
		if NPCGuy1:
			questAccepted.set_text("Quest Accepted")
			questDescription.set_text(QuestGlobal.quest1)
			questsInProgress.get_node("Quest 1").show()
		elif NPCGuy2:
			questAccepted.set_text("Quest Accepted")
			questDescription.set_text(QuestGlobal.quest2)
			questsInProgress.get_node("Quest 2").show()
		elif NPCGuy3:
			questAccepted.set_text("Quest Accepted")
			questDescription.set_text(QuestGlobal.quest2)
			questsInProgress.get_node("Quest 3").show()
	elif get_tree().get_current_scene().get_name() == "Game2":

		if NPCGuy4:
			questAccepted.set_text("Quest Accepted")
			questDescription.set_text(QuestGlobal.quest4)
			questsInProgress.get_node("Quest 4").show()
			
		elif NPCGuy5:
			questAccepted.set_text("Quest Accepted")
			questDescription.set_text(QuestGlobal.quest5)
			questsInProgress.get_node("Quest 5").show()
	
			
	yield(get_tree().create_timer(5), "timeout")
	questDisplay.hide()
	
	emit_signal("quest_is_inProgress")


#function for the result of winning the game. Menu display

func win_Game():
	_pause_menu.open()
	pause_menu_label.set_text("You win!")
	resume_button.hide()

#function for the result of dying. Menu display
func end_Game():
	_pause_menu.open()
	pause_menu_label.set_text("You died!")
	playAgain_button.show()
	resume_button.hide()


#UPDATES IN QUEST MENU once quest is completed
func update_UI_OnComp():
	
	if placeholderComp.is_visible():
		placeholderComp.hide()
	
	if get_tree().get_current_scene().get_name() == "Game":
		if NPCGuy1:
			questAccepted.set_text("Quest Completed")
			questsCompleted.get_node("Quest 1").show()
		elif NPCGuy2:
			questAccepted.set_text("Quest Completed")
			questsCompleted.get_node("Quest 2").show()
		elif NPCGuy3:
			questAccepted.set_text("Quest Completed")
			questsCompleted.get_node("Quest 3").show()
	elif get_tree().get_current_scene().get_name() == "Game2":
		if NPCGuy4:
			questAccepted.set_text("Quest Completed")
			questsCompleted.get_node("Quest 4").show()
		elif NPCGuy5:
			questAccepted.set_text("Quest Completed")
			questsCompleted.get_node("Quest 5").show()
		pass # Replace with function body.
	
	yield(get_tree().create_timer(5), "timeout")
	questDisplay.hide()
	
	emit_signal("quest_is_completed")
