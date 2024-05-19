extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# This gets the direction which is either -1, 0, 1
	var direction = Input.get_axis("Move left", "Move Right")
	if direction == 1:
		animated_sprite_2d.flip_h = false
		
	if direction == -1:
		animated_sprite_2d.flip_h = true
		
	#if player is not on the floor then render animation
	#Play animation
	if is_on_floor():
		
		if direction == 0:
		#This will say that when the direction is stopped
			#We will play the idle animation
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Run")
			
	else:
		animated_sprite_2d.play("Jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
