extends CharacterBody2D

var speed = 450
var spin_factor = 0.25;

func start(_position, _rotation):
	rotation_degrees = _rotation
	position = _position;
	velocity = Vector2(speed, 0).rotated(rotation);

func _physics_process(delta):
	rotation += (delta * velocity.length() * spin_factor)
	var collision = move_and_collide(velocity * delta)
	if collision:
		spin_factor *= -1;
		var speedMod = 1;
		if collision.get_collider().has_method("hit"):
			speedMod = collision.get_collider().hit()
			
		velocity = velocity.bounce(collision.get_normal()) * speedMod;
