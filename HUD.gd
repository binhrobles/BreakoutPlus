extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

var score = 0;

func update_score(points):
	score += points;
	$ScoreLabel.text = str(score)

func game_over():
	$StartButton.show()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
