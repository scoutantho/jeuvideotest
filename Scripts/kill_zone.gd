extends Area2D

var _body: CharacterBody2D


func _on_timer_timeout() -> void:
	print("Timer timeout")
	ResetBodyPosition(_body, 10, 10)
	pass # Replace with function body.

func _on_area_2d_body_entered(body:Node2D) -> void:
	print("Body entered the kill zone")
	body.set_physics_process(false)
	body.set_collision_mask_value(0, false)
	body.set_collision_layer_value(0, false)
	_body = body
	$Timer.start()
	pass # Replace with function body.

func ResetBodyPosition(body:CharacterBody2D, x:float,  y:float) -> void:
	print("Resetting body position to: ", x, y)
	# Reset the position of the body to the specified coordinates.
	body.position = Vector2(x, y)
	body.set_physics_process(true)
	body.set_collision_mask_value(0, true)
	body.set_collision_layer_value(0, true)
	pass