extends Area2D
signal hit

@export var speed = 400
@export var bullet_simple_scene: PackedScene
var screen_size

func _ready():
	hide()
	screen_size = get_viewport_rect().size
	$CollisionPolygon2D.set_deferred("disabled", true)

func _process(delta):
	if !get_tree().current_scene.game_state:
		return
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left_move"):
		velocity.x -= 1
	if Input.is_action_pressed("right_move"):
		velocity.x += 1
	if Input.is_action_pressed("up_move"):
		velocity.y -= 1
	if Input.is_action_pressed("down_move"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if Input.is_action_just_pressed("fire"):
		$BulletTimer.start()
	if Input.is_action_just_released("fire"):
		$BulletTimer.stop()

func start(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false
	$AnimatedSprite2D.play("fly")


func _on_area_entered(area):
	# 播放碰撞音效
	$MeDownSound.play()
	# 发生碰撞
	$CollisionPolygon2D.set_deferred("disabled", true)
	$AnimatedSprite2D.play("down")
	$BulletTimer.stop()
	hit.emit()


func _on_bullet_timer_timeout():
	# 添加子弹
	$BulletSound.play()
	var bullet_simple = bullet_simple_scene.instantiate()
	bullet_simple.position = position
	bullet_simple.position.y = bullet_simple.position.y - 60
	$Bullets.add_child(bullet_simple)
