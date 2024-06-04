extends Node

@export var enemy_scene: PackedScene
var game_state = false
var is_background = true
# Called when the node enters the scene tree for the first time.
func _ready():
	init_main()

func init_main():
	is_background = true
	# 动态背景
	$BackgroundImg.start()
	$EnemyTimer.start()
	$BackgroundMusic.play()
	$Player.hide()
	get_tree().call_group("bullet", "queue_free")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_timer_timeout():
	var enemy = enemy_scene.instantiate()
	$Enemys.add_child(enemy)


func game_over():
	game_state = false
	$BackgroundImg.pause()
	$EnemyTimer.stop()
	$BackgroundMusic.stop()
	$HUD1.show()
	

func start_game():
	is_background = false
	game_state = true
	$Player.start($StartPosition.position)
	$BackgroundImg.start()
	$EnemyTimer.start()
	$BackgroundMusic.play()
	# 清楚所有的敌人和子弹
	get_tree().call_group("enemy", "queue_free")
	get_tree().call_group("bullet", "queue_free")
	
	
func _on_hud_start_game():
	start_game()


func _on_hud_1_game_over():
	init_main()
	$HUD.show()


func _on_hud_1_game_again():
	start_game()
