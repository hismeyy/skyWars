extends Node

@export var enemy_scene: PackedScene
var game_state = false
var is_background = true

"""
初始化
"""
func init_main():
	is_background = true
	# 动态背景
	$BackgroundImg.start()
	$BackgroundMusic.play()
	$Player.hide()
	$EnemyTimer.start()
	# 清除所有的子弹
	get_tree().call_group("bullet", "queue_free")

func _ready():
	init_main()

func _on_enemy_timer_timeout():
	# 定时添加敌人
	var enemy = enemy_scene.instantiate()
	$Enemys.add_child(enemy)

"""
游戏结束
"""
func game_over():
	game_state = false
	$BackgroundImg.pause()
	$EnemyTimer.stop()
	$BackgroundMusic.stop()
	$HUD1.show()

"""
游戏开始
"""
func start_game():
	is_background = false
	game_state = true
	$BackgroundImg.start()
	$BackgroundMusic.play()
	$EnemyTimer.start()
	$Player.start($StartPosition.position)
	# 清除所有的敌人和子弹
	get_tree().call_group("enemy", "queue_free")
	get_tree().call_group("bullet", "queue_free")

func _on_hud_start_game():
	start_game()

func _on_hud_1_game_over():
	init_main()
	$HUD.show()

func _on_hud_1_game_again():
	start_game()
