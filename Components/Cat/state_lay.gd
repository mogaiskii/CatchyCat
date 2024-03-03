extends State
class_name StateLay


func _init():
	NEXT = StateStay
	SIDEABLE = false
	ANIMATION = 'lay'


func after_setup():
	set_animation()


func update(_delta):
	if CAT.target_position != CAT.position:
		CAT.stop_playing_sleep()
		warm_up()
