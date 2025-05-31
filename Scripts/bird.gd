extends CharacterBody2D

const JUMP_VELOCITY = -450.0

var is_dead: bool = false

func _physics_process(delta: float) -> void:
	if get_slide_collision_count() != 0:
		die()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func die():
	if is_dead == false:
		is_dead = true
		print("Died")
