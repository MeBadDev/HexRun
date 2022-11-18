extends KinematicBody2D
signal died
var speed = 200
var score := 0 setget _score_changed
var can_move := true
func _physics_process(delta):
	move()

#move
func move():
	if can_move:
		#get the direction to move, this is already normalized
		var direction = Input.get_vector('ui_left','ui_right','ui_up','ui_down')
		move_and_slide(direction * speed)
#die if we touch hex
func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex"):
		_die()

func _score_changed(new_score:int):
	$GUI/Score.text = 'Score: %s' % new_score
	score = new_score


func _die():
	can_move = false
	get_tree().paused = true
	emit_signal('died')
	$GUI/AnimationPlayer.play('Die')
	var t := create_tween().set_pause_mode(SceneTreeTween.TWEEN_PAUSE_PROCESS)
	t.tween_method(self,'_change_score_text',0,score,0.2)

func _change_score_text(new_score:int):
	$"%DeadScore".text = "Score: %s" % new_score



func _on_Menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene('res://Scenes/MainMenu.tscn')

func _on_Retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
