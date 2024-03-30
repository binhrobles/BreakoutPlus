extends CharacterBody2D

var speed = 400

func start():
	position = Vector2(600, 500)
	velocity = Vector2(speed, 0).rotated(45);

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
