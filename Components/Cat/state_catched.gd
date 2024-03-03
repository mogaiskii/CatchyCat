extends State
class_name StateCatched


func _init():
	SIDEABLE = false
	ANIMATION = 'catched'


func after_setup():
	set_animation()
	CAT.win()
