extends Node

signal on_update_player_data

enum Field {NAME, CHARACTER, READY}

# Basic info
var player_name = "":
	set(value):
		if value != player_name:
			player_name = value
			on_update_player_data.emit(package_data())
var selected_character = Globals.Character.NONE:
	set(value):
		if value != selected_character:
			selected_character = value
			on_update_player_data.emit(package_data())

# Lobby info
var is_ready = false:
	set(value):
		if value != is_ready:
			is_ready = value
			on_update_player_data.emit(package_data())

func package_data():
	return {
		Field.NAME: player_name,
		Field.CHARACTER: selected_character,
		Field.READY: is_ready
	}
