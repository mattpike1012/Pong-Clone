extends Node

var player1_score = 0
var player2_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_1_scored(body):
	player1_score += 1
	$HUD/Score1.text = str(player1_score)
	
	if player1_score == 11:
		$HUD/WinnerMessage/Message.text = "Player 1 Wins!"
		$HUD/WinnerMessage.visible = true
	else:
		$Ball.generate_new_ball()

func _on_player_2_scored(body):
	player2_score += 1
	$HUD/Score2.text = str(player2_score)
	
	if player2_score == 11:
		$HUD/WinnerMessage/Message.text = "Player 2 Wins!"
		$HUD/WinnerMessage.visible = true
	else:
		$Ball.generate_new_ball()
