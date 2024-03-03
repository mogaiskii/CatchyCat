extends AudioStreamPlayer

var active = false


func start_playing():
	active = true
	stream_paused = false
	play()

func stop_playing():
	active = false
	stream_paused = true
	stop()


func _on_finished():
	if !active:
		return

	stream_paused = false
	play()
