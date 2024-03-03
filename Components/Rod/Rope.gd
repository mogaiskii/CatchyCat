extends Node2D

@export_range(1, 1000) var segments : int = 100
@export var width : int = 2
@export var color : Color = Color.WHITE_SMOKE
@export var antialiasing : bool = false

var POINT_1 = null
var POINT_2 = null


func make_rope(point1, point2):
	draw_line(point1, point2, color, width, antialiasing)


func _draw():
	if POINT_2 == null or POINT_1 == null:
		return

	make_rope(POINT_1, POINT_2)


func _process(_delta):
	var mousepoint = get_viewport().get_mouse_position()
	if mousepoint != POINT_1:
		POINT_1 = mousepoint
		queue_redraw()


func _on_bait_moved(x, y):
	POINT_2 = Vector2(x, y)
	queue_redraw()
