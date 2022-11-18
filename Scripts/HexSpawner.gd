extends Timer

#for some reason we can't preload here so i use load
export(PackedScene) var hex_scene
var rng = RandomNumberGenerator.new()
var is_previous_invert :bool = false

func _ready():
	randomize()

	#spawn a hex at the begining
	#note: 20.0 and 20 is two different thing 
	spawn_hex(rand_range(-1,1),0.1)
	
func _on_HexSpawner_timeout():
		spawn_hex(rand_range(-1,1),0.1)

func spawn_hex(delta_rotation:float,threshold = 0.1):
	var hex = hex_scene.instance()
	hex.rotation_degrees = randi() % 360
	hex.threshold = threshold
	get_tree().current_scene.call_deferred('add_child',hex)
	hex.delta_rotation = delta_rotation

	is_previous_invert = threshold <= 0
	


func _on_Player_died() -> void:
	queue_free()