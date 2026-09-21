extends Node2D

class_name WeaponInput

var mouse_position

func _ready():
	set_process(get_parent().get_parent().player_id == multiplayer.get_unique_id())
	mouse_position = get_global_mouse_position()
	# DEBUG
	#if get_parent().get_parent().player_id == multiplayer.get_unique_id():
	#	var debug_cursor_scene = load("res://Prefabs/Components/CharacterComponents/_Shared/debugicon.tscn")
	#	add_child(debug_cursor_scene.instantiate())

func _process(_delta):
	mouse_position = get_global_mouse_position()
