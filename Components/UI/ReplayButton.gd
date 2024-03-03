extends TextureButton


func _init():
	visible = false

func _on_game_end():
	visible = true
