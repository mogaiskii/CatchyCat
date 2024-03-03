extends Control

signal game_end
signal game_start
signal game_reset  # sets all to initial state


func _on_game_start():  # click
	visible = false
	game_start.emit()


func _on_game_restart():  # click
	game_reset.emit()
	game_start.emit()
	visible = false


func _on_cat_win():
	game_end.emit()
	visible = true
