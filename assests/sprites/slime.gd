extends Node2D
#These are used to check if there is an upcoming collision
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 60
var direction = 1 #if we need to go in the opposite direction we use -1

# Called ever frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	#position.x += 1 -> not good
#delta is the amount of time that the last frame has occured
	position.x += SPEED * delta * direction
#We multiply by direction so that it can go the opposite way
# -x pixels
