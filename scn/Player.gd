extends CharacterBody2D

@export var animation: bool = false

func _physics_process(delta):
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		if !animation:
			velocity = direction * data.speed
			$AnimationPlayer.play('walk')
			
			if direction.x < 0:
				$Sprite2D.flip_h = true
			elif direction.x > 0:
				$Sprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, data.speed)
		velocity.y = move_toward(velocity.y, 0, data.speed)
		if !animation: $AnimationPlayer.play('idle')

	move_and_slide()

func _input(event):
	if event.is_action_pressed("use") and !animation:
		animation = true
		$AnimationPlayer.play("rake")
		rake()

func rake():
	$RakeArea/CollisionShape2D.shape.radius = data.rakeRadius
	for i in $RakeArea.get_overlapping_bodies():
		i.apply_impulse(i.position.direction_to(position) * data.rakeForce, Vector2.ZERO)
