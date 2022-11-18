extends KinematicBody2D

var speed = 200
var score := 0 setget _score_changed
	
func _physics_process(delta):
	move()

#move
func move():
	#get the direction to move, this is already normalized
	var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
	move_and_slide(direction * speed)
#die if we touch hex
func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex"):
		queue_free()
		EndMenu.show()

func _score_changed(new_score:int):
	$GUI/Score.text = 'Score: %s' % new_score
	score = new_score