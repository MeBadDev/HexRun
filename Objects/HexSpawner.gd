extends Timer


var hex_scene = preload("res://Objects/Hex.tscn")
var rng = RandomNumberGenerator.new()
var is_previous_invert :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_hex(0)

func _on_HexSpawner_timeout():
	var r = rng.randi_range(0, 9)
	if !is_previous_invert:
		if Score.score <= 10:
			spawn_hex(0)
		elif Score.score <= 20:
			spawn_hex(0.005)
		elif Score.score <= 30:
			if r <= 5:
				spawn_hex(0, -2)
			else:
				spawn_hex(0.005)
		else:
			if r <= 5:
				spawn_hex(0.005, -2)
			else:
				spawn_hex(0.005, -2)
	else:
		is_previous_invert = false

func spawn_hex(delta_rotation,threshold = 0.1):
	var hex = hex_scene.instance()
	hex.rotation = 30 * rng.randi_range(0, 10)
	hex.delta_rotation = delta_rotation
	hex.threshold = threshold
	get_tree().current_scene.add_child(hex)
	if threshold <= 0:
		is_previous_invert = true
	else:
		is_previous_invert = false
	
