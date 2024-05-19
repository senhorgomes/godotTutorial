extends Area2D
@onready var game_manager = %"Game Manager"


#signals allow you to trigger a signal
#masks are what the item receives, layer is where the item is located

func _on_body_entered(body):
	game_manager.add_point() 
	queue_free()
