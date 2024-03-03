extends Node
class_name State

var NEXT = null
var PREV = null
var ANIMATION = "lay"
var SIDEABLE = true

var CAT: Cat = null


func on_bait_touched():
	pass


func get_current_anim_name():
	if SIDEABLE:
		var side_name = CAT.Side.keys()[CAT.cat_side].to_lower()
		return ANIMATION + "_" + side_name

	return ANIMATION


func set_animation():
	CAT._set_animation(get_current_anim_name())


func setup(cat):
	CAT = cat
	#print(get_script().get_path())
	after_setup()


func after_setup():
	pass


func set_next():
	if NEXT != null:
		var next = NEXT.new()
		next.setup(CAT)
		CAT._set_state(next)
		return next
	return self


func set_prev():
	if PREV != null:
		var prev = PREV.new()
		prev.setup(CAT)
		CAT._set_state(prev)
		return prev
	return self


func chill_down():
	CAT.WARMTH_PERCENT -= 20
	return set_prev()


func warm_up():
	CAT.WARMTH_PERCENT += 20
	return set_next()


func on_process(delta):
	update(delta)


func update(_delta):
	pass
