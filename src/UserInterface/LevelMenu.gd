extends CanvasLayer

func _on_BackButton_pressed():
	get_tree().change_scene("res://src/UserInterface/TitleMenu.tscn");

func _on_TextureButton1_pressed():
	get_tree().change_scene("res://src/Main/Game.tscn");

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://src/Main/Game2.tscn");
