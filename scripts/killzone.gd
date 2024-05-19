extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
#Timer is established in the inspector tool
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
#When the timer is done, this resets the game
	get_tree().reload_current_scene()
