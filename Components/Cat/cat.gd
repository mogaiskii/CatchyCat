extends Area2D
class_name Cat

@export var WARMTH_PERCENT : int = 0  # max: 100  # unused :(
@export var TOP_BOUND : int
@export var LEFT_BOUND : int
@export var RIGHT_BOUND : int
@export var BOTTOM_BOUND : int
var state = StateLay.new()
var target_position : Vector2
var start_position : Vector2
enum Side {LEFT, UP, RIGHT, DOWN}
var cat_side = Side.RIGHT
var sprite : AnimatedSprite2D
var animation_sprite_name : String

signal cat_wins


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("AnimatedSprite2D")
	start_position = Vector2(position)
	_initial_settings()


func _initial_settings():
	cat_side = Side.RIGHT
	state = StateLay.new()
	position = Vector2(start_position)
	target_position = Vector2(position)
	state.setup(self)
	play_sleep()


func calc_side(delta_pos):
	if abs(delta_pos.x) >= abs(delta_pos.y):
		if delta_pos.x > 0:
			return Side.LEFT
		else:
			return Side.RIGHT
	else:
		if delta_pos.y <= 0:
			return Side.DOWN
		else:
			return Side.UP


func set_side(delta_pos):
	var side = calc_side(delta_pos)
	cat_side = side


func _set_animation(animation_name):
	if animation_name != animation_sprite_name:
		animation_sprite_name = animation_name
		sprite.play(animation_name)


func _on_game_reset():
	_initial_settings()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	state.on_process(delta)
	var delta_pos = Vector2(position.x - target_position.x, position.y - target_position.y)
	set_side(delta_pos)
	state.set_animation()


func _set_state(new_state):
	#state.free()
	state = new_state

func _on_bait_moved(x, y):
	target_position = Vector2(x, y)


func _is_move_allowed(x, y):
	if x < LEFT_BOUND or x > RIGHT_BOUND or y < TOP_BOUND or y > BOTTOM_BOUND:
		return false
	return true


func play_sleep():
	get_node("SleepPLayer").start_playing()

func stop_playing_sleep():
	get_node("SleepPLayer").stop_playing()

func play_mew():
	get_node("MewWinPlayer").start_playing()


func _on_area_entered(_area):
	if state == null:
		return
	state.on_bait_touched()


func win():
	play_mew()
	cat_wins.emit()
