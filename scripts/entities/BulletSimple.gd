extends Node2D

@export var speed = 400


func _process(delta):
	if !get_tree().current_scene.game_state:
		return
	var velocity = Vector2.ZERO
	velocity.y = -1
	velocity = velocity * speed
	position = position + velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_bullet_area_entered(area):
	queue_free()
