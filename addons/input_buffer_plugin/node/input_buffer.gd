class_name InputBuffer
extends Timer


@export var input: StringName 

## time since its been pressed and has been active.
var time_on: float:
	get:
		return (wait_time - time_left)
	set(_value):
		pass

## when getting this variable the input will expire.
var pressed: bool:
	get:
		if pressed:
			_input_expired()
			return true
		
		return false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(input):
		pressed = true
		start()


func _ready() -> void:
	timeout.connect(_input_expired)


func _input_expired() -> void:
	pressed = false
	stop()

## Returns the name of the first input that was pressed and is still pressed.
## If two inputs are pressed at the same time it will return first in array.
## Using match with this function can be usefull.
static func get_first_input(input_buffer: Array[InputBuffer]) -> StringName:
	var last_input: StringName = &""
	var shortest_time_on: float = 10000000
	
	for i in input_buffer:
		if i.pressed and i.time_on < shortest_time_on:
			shortest_time_on = i.time_on
			last_input = i.input
	
	return last_input

