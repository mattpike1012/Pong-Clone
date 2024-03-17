extends Node

var player1_score = 0
var player2_score = 0

func on_countdown_finish():
	$CountdownTimer.visible = false
	$Ball.reset_ball()
	$Player1Paddle.can_move = true
	$Player2Paddle.can_move = true

func _on_player_1_scored(body):
	player1_score += 1
	$HUD/Score1.text = str(player1_score)
	
	if player1_score == 11:
		$Player1Paddle.can_move = false
		$Player2Paddle.can_move = false
		$HUD/WinnerMessage/Message.text = "Player 1 Wins!"
		$HUD/WinnerMessage.visible = true
	else:
		$Ball.reset_ball()

func _on_player_2_scored(body):
	player2_score += 1
	$HUD/Score2.text = str(player2_score)
	
	if player2_score == 11:
		$Player1Paddle.can_move = false
		$Player2Paddle.can_move = false
		$HUD/WinnerMessage/Message.text = "Player 2 Wins!"
		$HUD/WinnerMessage.visible = true
	else:
		$Ball.reset_ball()
