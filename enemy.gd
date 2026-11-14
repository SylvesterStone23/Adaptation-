extends CharacterBody2D

var speed = 200
var chase_speed = 350
var player_chase = false
var player = null
signal player_died

var wander_direction = Vector2.ZERO

func _ready():
	choose_new_wander_direction()

func _physics_process(delta):
	if player_chase and player:
		var direction = (player.position - position).normalized()
		velocity = direction * chase_speed
		$AnimatedSprite2D.play("enemy_walk")
	else:
		velocity = wander_direction * speed
		if wander_direction != Vector2.ZERO:
			$AnimatedSprite2D.play("enemy_walk")
		else:
			$AnimatedSprite2D.stop()
		
	move_and_slide()

func choose_new_wander_direction():
	# 20% chance to pause/stand still, 80% chance to pick a random 360-degree direction
	if randf() < 0.2:
		wander_direction = Vector2.ZERO
	else:
		# Pick a completely random angle in a full circle
		var random_angle = randf() * TAU
		wander_direction = Vector2.RIGHT.rotated(random_angle)

func _on_timer_timeout():
	if not player_chase:
		choose_new_wander_direction()

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == player:
		player = null
		player_chase = false
		choose_new_wander_direction()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "player2":
		# Look for DeathScreen at the root of the main scene
		var death_screen = get_tree().current_scene.get_node_or_null("DeathScreen")
		if death_screen:
			death_screen.show_death_screen()
		else:
			print("Error: DeathScreen not found!")
