extends State
class_name StateJump

var target_lock : Vector2
@export var SPEED : int = 400
var side_lock = null


func _init():
	NEXT = StateCatched
	PREV = StateStay
	ANIMATION = 'jump'


func after_setup():
	target_lock = Vector2(CAT.target_position)
	side_lock = CAT.cat_side
	set_animation()


func get_current_anim_name():
	var side_name = CAT.Side.keys()[side_lock].to_lower()
	return ANIMATION + "_" + side_name


func on_bait_touched():
	warm_up()


func update(delta):
	var delta_position = Vector2(target_lock - CAT.position).normalized() * SPEED * delta
	CAT.position += delta_position
	if abs(CAT.position.distance_to(target_lock)) <= 10:
		chill_down()
