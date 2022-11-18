extends StaticBody2D

#scale
var my_scale :float= 6
#how much scale we shrink every frame
var delta_scale :float= -0.8
#how much will we rotate per frame
var delta_rotation :float= 0.0
#destroy if we are smaller than threshold
var threshold :float= 0.1
#how much score will we gain if we pass this hex
var pass_score :float= 1

func _init() -> void:
	#set scale to my_scale
	scale = Vector2(my_scale,my_scale)

#called every frame
func _physics_process(delta):
	#become smaller every frame
	my_scale += delta_scale * delta
	scale = Vector2(my_scale, my_scale)
	#rotate to make it harder
	#godot use radians but we usually use rotation degree, so we 
	rotation_degrees += delta_rotation
	
	if my_scale <= threshold:
		queue_free()


func _on_Score_body_entered(body:Node):
	if body.is_in_group("Player"):
		#delete Score Area2D after player got the score,
		#so player won't get score multiple times
		$Score.queue_free()
		body.score += pass_score