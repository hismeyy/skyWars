extends Area2D

@export var speed = 400
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
	if !get_parent().get_parent().game_state:
		return
	var velocity = Vector2.ZERO
	velocity.y = 1
	velocity = velocity * speed
	position = position + velocity * delta
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
