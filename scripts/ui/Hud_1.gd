extends CanvasLayer
signal game_again
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_again_button_up():
	# 发出重新开始的信号
	game_again.emit()
	hide()


func _on_game_over_button_up():
	hide()
	game_over.emit()
