extends State
class_name StateStay

var current_position : Vector2

func _init():
	NEXT = StateRun
	PREV = StateLay
	ANIMATION = 'stay'


func after_setup():
	current_position = CAT.target_position
	set_animation()


func update(_delta):
	if CAT.target_position != current_position:
		warm_up()
