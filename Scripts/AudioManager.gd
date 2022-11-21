extends Node
const PLAYER_COUNT := 8

var player_list := []

func _ready():
	#for some reason i want to initalize GOTM project key here
	var config := GotmConfig.new()
	config.beta_unsafe_force_global_scores = true
	config.project_key = Secret.get_project_key()
	Gotm.initialize(config)
	pause_mode = PAUSE_MODE_PROCESS
	for i in PLAYER_COUNT:
		var player := AudioStreamPlayer.new()
		player.volume_db = -1
		add_child(player)
		player_list.append(player)
		player.connect('finished',self,'on_player_finished',[player])

func play(audio:AudioStream):
	for players in player_list:
		if not players.playing:
			players.stream = audio
			players.play()
			break
func on_player_finished(player:AudioStreamPlayer):
	player.stream = null
	player.playing = false
