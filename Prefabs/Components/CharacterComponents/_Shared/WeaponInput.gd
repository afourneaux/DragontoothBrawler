extends Node2D

class_name WeaponInput

var mouse_position

func _ready():
	if !is_multiplayer_authority():
		queue_free()
	mouse_position = get_global_mouse_position()
	# DEBUG
	var debug_cursor_scene = load("res://Prefabs/Components/CharacterComponents/_Shared/debugicon.tscn")
	add_child(debug_cursor_scene.instantiate())

func _process(_delta):
	mouse_position = get_global_mouse_position()
