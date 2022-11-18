extends Node
const PLAYER_COUNT := 8

var player_list := []

func _ready():
	for i in PLAYER_COUNT:
		var player := AudioStreamPlayer.new()
		add_child(player)
		player_list.append(player)
		player.connect('finished',self,'on_player_finished',[player])

func play(audio:AudioStream):
	for players in player_list:
		if not players.playing:
			players.play(audio)
func on_player_finished(player:AudioStreamPlayer):
	player.playing = false