@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("InputBuffer",
	"Timer",
	preload("node/input_buffer.gd"),
	preload("node/icon.png"))


func _exit_tree() -> void:
	remove_custom_type("InputBuffer")
