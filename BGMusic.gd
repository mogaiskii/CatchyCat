extends AudioStreamPlayer

func _on_finished():
	stream_paused = false
	play()
