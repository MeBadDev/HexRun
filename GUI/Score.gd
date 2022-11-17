extends Control


var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var canvas_rid = get_canvas_item()
	VisualServer.canvas_item_set_z_index(canvas_rid, 100)

func _process(delta):
	if Input.is_action_just_pressed("ui_home"):
		get_tree().root.print_tree_pretty()

func refresh():
	$Label.text = str(score)
