extends StaticBody2D


var my_scale :float= 6
var delta_scale :float= -0.8
var delta_rotation :float= 0.0
var threshold :float= 0.1
var pass_score :float= 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	my_scale += delta_scale * delta
	scale = Vector2(my_scale, my_scale)
	rotate(delta_rotation)
	
	if my_scale <= threshold:
		queue_free()


func _on_Score_body_entered(body:Node):
	if body.is_in_group("Player"):
		Score.score += pass_score
		Score.refresh()
