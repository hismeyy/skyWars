extends Node

@export var enemy_scene: PackedScene
var game_state = false
# Called when the node enters the scene tree for the first time.
func _ready():
	game_state = true
	$BackgroundImg.start()
	$Player.start($StartPosition.position)
	$EnemyTimer.start()
	


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
	
	
