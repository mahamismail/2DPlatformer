extends Control

onready var root = get_tree().get_root()
onready var scene_root = root.get_child(root.get_child_count() - 1);

func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/UserInterface/LevelMenu.tscn");


func _on_QuitButton_pressed():
	scene_root.notification(NOTIFICATION_WM_QUIT_REQUEST)
	get_tree().quit()


func _on_AboutGameButton_pressed():
	get_tree().change_scene("res://src/UserInterface/About.tscn");

