extends Area2D

@export var TOP_BOUND : int
@export var LEFT_BOUND : int
@export var RIGHT_BOUND : int
@export var BOTTOM_BOUND : int
@export var DISTANCE_TO_MOUSE : int = 100
signal moved(x : float, y : float)


func _ready():
	var parent = get_parent()
	TOP_BOUND = parent.TOP_BOUND
	LEFT_BOUND = parent.LEFT_BOUND
	RIGHT_BOUND = parent.RIGHT_BOUND
	BOTTOM_BOUND = parent.BOTTOM_BOUND


func _is_move_allowed(x, y):
	if x < LEFT_BOUND or x > RIGHT_BOUND or y < TOP_BOUND or y > BOTTOM_BOUND:
		return false
	return true


func _move(new_position):
	global_position = new_position
	moved.emit(global_position.x, global_position.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_position = get_viewport().get_mouse_position()
	var distance = mouse_position.distance_to(global_position)
	if distance > DISTANCE_TO_MOUSE:
		var x_vector = mouse_position.x - global_position.x
		var y_vector = mouse_position.y - global_position.y
		var move_vector = Vector2(x_vector, y_vector)
		var corrected_move_vector = move_vector.normalized() * (distance - DISTANCE_TO_MOUSE)

		var new_position = global_position + corrected_move_vector
		if _is_move_allowed(new_position.x, new_position.y):
			_move(new_position)
			return

		var position_x_candidate = Vector2(new_position.x, global_position.y)
		if _is_move_allowed(position_x_candidate.x, position_x_candidate.y):
			_move(position_x_candidate)
			return

		var position_y_candidate = Vector2(global_position.x, new_position.y)
		if _is_move_allowed(position_y_candidate.x, position_y_candidate.y):
			_move(position_y_candidate)
			return
