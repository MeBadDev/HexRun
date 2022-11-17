extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	var canvas_rid = get_canvas_item()
	VisualServer.canvas_item_set_z_index(canvas_rid, 100)

func _on_RestartButton_pressed():
	get_tree().change_scene("res://World.tscn")
	visible = false
	Score.score = 0
	Score.refresh()


func _on_BackButton_pressed():
	get_tree().change_scene("res://GUI/MainMenu.tscn")
	visible = false


func _on_QuitButton_pressed():
	get_tree().quit()
