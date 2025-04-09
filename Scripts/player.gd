extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -200.0
@onready var last_position = position


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if(is_on_floor()):
		# Check if the player is on the floor and has moved.
		if position != last_position:
			# If the player has moved, reset the last position to the current position.
			last_position = position
