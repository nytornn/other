extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -450.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event):
	if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		$Sprite2D.play("run")
	elif Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		$Sprite2D.play("run")
	else:
		$Sprite2D.play("idle")
	

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		sprite_2d.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
