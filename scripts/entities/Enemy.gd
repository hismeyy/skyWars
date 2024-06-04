extends Area2D

@export var speed = 400
# 飞机是否可以运行 撞击后不可运行
var runing = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("fly")
	# 随机选择一个位置
	position.y = 0
	position.x = randi() % 480
	# 随机选择速度
	speed = randi() % 200 + 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!get_tree().current_scene.game_state || !runing) && !get_tree().current_scene.is_background:
		return
	var velocity = Vector2.ZERO
	velocity.y = 1
	velocity = velocity * speed
	position = position + velocity * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	$CollisionPolygon2D.set_deferred("disabled", true)
	# 播放碰撞音效
	$AudioStreamPlayer.play()
	# 停止运动
	runing = false
	$AnimatedSprite2D.play("down")
	

func _on_animated_sprite_2d_animation_finished():
	queue_free()
