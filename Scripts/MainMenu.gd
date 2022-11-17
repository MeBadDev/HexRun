extends Control

#change scene to the game scene
func _on_PlayButton_pressed():
	get_tree().change_scene("res://World.tscn")

#quit the game
func _on_QuitButton_pressed():
	get_tree().quit()
