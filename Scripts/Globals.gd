extends Node

# TODO investigate migrating globals to other object types
# https://docs.godotengine.org/en/stable/tutorials/best_practices/node_alternatives.html

const SCENE_LOBBY_MENU = "LobbyMenu"
const SCENE_MAIN_MENU = "MainMenu"
const SCENE_CHARACTER_MENU = "CharacterSelectMenu"
const MAX_PLAYERS = 8

# Audio
const AUDIO_NOT_OWNED_VOLUME_FACTOR = 0.5

# Animation
enum ANIMATION_STATE {NONE, STAND, WALK, JUMP, ATTACK, FALL, WALLGRAB, HURT}

const DEBUG_SINGLE_PLAYER = true
