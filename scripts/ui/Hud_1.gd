extends CanvasLayer
signal game_again
signal game_over


func _ready():
	hide()


func _on_game_again_button_up():
	# 发出重新开的信号
	hide()
	game_again.emit()
	

func _on_game_over_button_up():
	# 发游戏结束信号
	hide()
	game_over.emit()
