extends CanvasLayer
signal start_game

func _on_texture_button_button_up():
	hide()
	start_game.emit()
