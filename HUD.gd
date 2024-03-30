extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func update_score(score):
	$ScoreLabel.text = str(score)

func game_over():
	$StartButton.show()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
