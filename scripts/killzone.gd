extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
#Timer is established in the inspector tool
	timer.start()


func _on_timer_timeout():
#When the timer is done, this resets the game
	get_tree().reload_current_scene()
