extends Area2D


#signals allow you to trigger a signal
#masks are what the item receives, layer is where the item is located

func _on_body_entered(body):
	queue_free()
