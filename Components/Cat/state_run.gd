extends State
class_name StateRun

@export var SPEED : int = 200
@export var DISTANCE_TO_JUMP : int = 150


func _init():
	NEXT = StatePrepare
	PREV = StateStay
	ANIMATION = 'run'


func after_setup():
	set_animation()


func update(delta):
	var delta_position = Vector2(CAT.target_position - CAT.position).normalized() * SPEED * delta
	CAT.position += delta_position
	if abs(CAT.position.distance_to(CAT.target_position)) < DISTANCE_TO_JUMP:
		warm_up()
