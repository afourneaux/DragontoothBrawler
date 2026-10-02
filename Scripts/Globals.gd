extends Node

# TODO investigate migrating globals to other object types
# https://docs.godotengine.org/en/stable/tutorials/best_practices/node_alternatives.html

const SCENE_LOBBY_MENU = "LobbyMenu"
const SCENE_MAIN_MENU = "MainMenu"
const SCENE_CHARACTER_MENU = "CharacterSelectMenu"
const MAX_PLAYERS = 8
const PLAYER_SPAWN_DELAY = 3

# Audio
const AUDIO_NOT_OWNED_VOLUME_FACTOR = 0.5

# Animation
enum ANIMATION_STATE {NONE, STAND, WALK, JUMP, ATTACK, FALL, WALLGRAB, HURT}
func get_animation(animation_enum):
	var animation = "none"
	match animation_enum:
		Globals.ANIMATION_STATE.STAND:
			animation = "stand"
		Globals.ANIMATION_STATE.JUMP:
			animation = "jump"
		Globals.ANIMATION_STATE.STAND:
			animation = "stand"
		Globals.ANIMATION_STATE.WALLGRAB:
			animation = "wallgrab"
		Globals.ANIMATION_STATE.FALL:
			animation = "fall"
		Globals.ANIMATION_STATE.WALK:
			animation = "walk"
		Globals.ANIMATION_STATE.NONE:
			push_error("Animation state NONE provided")
		_:
			push_error("Unrecognised animation state: %s" % str(animation_enum))
	return animation
	

const DEBUG_SINGLE_PLAYER = true
const DEBUG_BLOCK_VICTORY = true
