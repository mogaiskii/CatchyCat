extends State
class_name StatePrepare

@export var TIMER : float = 1.3  # seconds
@export var MAX_DISTANCE : int = 350

func _init():
	NEXT = StateJump
	PREV = StateStay
	ANIMATION = 'prepare'


func after_setup():
	set_animation()


func update(delta):
	TIMER -= delta
	if abs(CAT.position.distance_to(CAT.target_position)) > MAX_DISTANCE:
		chill_down()
	if TIMER <= 0:
		warm_up()
