extends Node2D

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_tree().current_scene.game_state:
		return
	var velocity = Vector2.ZERO
	velocity.y = -1
	velocity = velocity * speed
	position = position + velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()