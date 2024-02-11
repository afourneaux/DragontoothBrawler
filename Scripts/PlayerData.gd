extends Node

signal _on_update_player_data()

# Basic info
var player_name = ""
var selected_character = Globals.Character.NONE

# Lobby info
var is_ready = false

func package_data():
	return {
		"player_name": player_name,
		"selected_character": selected_character,
		"is_ready": is_ready
	}
