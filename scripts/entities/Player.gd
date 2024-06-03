extends Area2D

@export var speed = 400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("fly")
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left_move"):
		velocity -= 1
	if Input.is_action_pressed("right_move"):
		velocity += 1
	if Input.is_action_pressed("up_move"):
		velocity -= 1
	if Input.is_action_pressed("down_move"):
		velocity += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
