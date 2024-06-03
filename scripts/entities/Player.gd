extends Area2D
signal hit

@export var speed = 400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_parent().game_state:
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

func start(pos):
	position = pos
	show()
	$CollisionPolygon2D.disabled = false
	$AnimatedSprite2D.play("fly")


func _on_area_entered(area):
	# 发生碰撞
	$CollisionPolygon2D.set_deferred("disabled", true)
	$AnimatedSprite2D.play("down")
	hit.emit()
