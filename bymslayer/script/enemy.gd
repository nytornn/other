extends RigidBody2D

class_name Enemy

@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d_2 = $RayCast2D2
@onready var animated_sprite_2d = $AnimatedSprite2D

var right = 1

var speed = 200

func _physics_process(delta):
	if(right == 1):
		var direction = Vector2.RIGHT

		linear_velocity.x = direction.x * speed

		if ray_cast_2d.is_colliding() or ray_cast_2d_2.is_colliding():
			right = -1
			ray_cast_2d.target_position *= -1
			animated_sprite_2d.flip_h = true
			ray_cast_2d_2.target_position *= -1
			
	elif(right == -1):
		var direction = Vector2.LEFT

		linear_velocity.x = direction.x * speed

		if ray_cast_2d.is_colliding() or ray_cast_2d_2.is_colliding():
			right = 1
			ray_cast_2d.target_position *= -1
			animated_sprite_2d.flip_h = false
			ray_cast_2d_2.target_position *= -1
