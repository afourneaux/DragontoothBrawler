extends Node

const SCENE_LOBBY_MENU = "LobbyMenu"
const SCENE_MAIN_MENU = "MainMenu"
const SCENE_CHARACTER_MENU = "CharacterSelectMenu"
const MAX_PLAYERS = 8

enum ANIMATION_STATE {NONE, STAND, WALK, JUMP, ATTACK, FALL, WALLGRAB, HURT}

const DEBUG_SINGLE_PLAYER = true
