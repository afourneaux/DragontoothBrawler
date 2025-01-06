extends Node

signal on_update_player_data

enum Field {NAME, CHARACTER, READY}

# Basic info
var _player_name = ""
var player_name:
	set(value):
		if value != _player_name:
			_player_name = value
			on_update_player_data.emit(package_data())
	get:
		return _player_name
var _selected_character = Globals.Character.NONE
var selected_character:
	set(value):
		if value != _selected_character:
			_selected_character = value
			on_update_player_data.emit(package_data())
	get:
		return _selected_character

# Lobby info
var _is_ready = false
var is_ready:
	set(value):
		if value != _is_ready:
			_is_ready = value
			on_update_player_data.emit(package_data())
	get:
		return _is_ready

func package_data():
	return {
		Field.NAME: player_name,
		Field.CHARACTER: selected_character,
		Field.READY: is_ready
	}

func reset():
	_player_name = ""
	_selected_character = Globals.Character.NONE
	_is_ready = false
