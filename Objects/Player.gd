extends KinematicBody2D

var speed = 200
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	move()

func move():
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
		
	direction = direction.normalized()
	move_and_slide(direction * speed)

func _on_HitBox_body_entered(body:Node):
	if body.is_in_group("Hex"):
		queue_free()
		
		EndMenu.visible = true
