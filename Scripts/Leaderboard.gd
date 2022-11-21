extends Control
const LEADERBOARD_NAME := 'Score'
var fetching_rank := 20
func _ready() -> void:	
	var top_leaderboard = GotmLeaderboard.new()
	top_leaderboard.name = LEADERBOARD_NAME
	var all_score := []
	var top_scores = yield(top_leaderboard.get_scores(), "completed")
	all_score.append_array(top_scores)
	while top_scores.size() >= 20:
		top_scores = yield(top_leaderboard.get_scores_by_rank(fetching_rank), "completed")
		fetching_rank += 20
		all_score.append_array(top_scores)
	var rank := 0
	for scores in all_score:
		rank += 1
		create_panel(rank,scores)
func create_panel(rank:int, score:GotmScore):
	var p := $"%Board".duplicate() as Panel
	p.show()
	$VBoxContainer/ScrollContainer/VBoxContainer.add_child(p)
	p.get_node('HBoxContainer/Rank').text = '#%s' % rank
	p.get_node('HBoxContainer/Name').text = score.properties['user']
	p.get_node('HBoxContainer/Score').text = str(score.value)


func _on_Quit_pressed() -> void:
	get_tree().change_scene('res://Scenes/MainMenu.tscn')
