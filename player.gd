extends CharacterBody2D

const speed = 550

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		velocity.x = 0
	else:
		velocity.x = 0
		velocity.y = 0
		
	# --- ANIMATION LOGIC ---
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop() # Or use $AnimatedSprite2D.play("idle") if you have an idle animation
		
	move_and_slide()
