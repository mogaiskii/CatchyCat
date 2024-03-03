extends Node2D
class_name Rod

signal bait_moved(x : float, y : float)
@export var TOP_BOUND : int
@export var LEFT_BOUND : int
@export var RIGHT_BOUND : int
@export var BOTTOM_BOUND : int


func _ready():
	visible = false


func _on_bait_moved(x,y):
	if !visible:
		return
	bait_moved.emit(x, y)


func _on_game_start():
	visible = true

func _on_game_end():
	visible = false
