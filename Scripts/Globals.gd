extends Node

signal _on_scene_changed(new_scene)

const SCENE_LOBBY_MENU = "LobbyMenu"
const SCENE_MAIN_MENU = "MainMenu"
const SCENE_CHARACTER_MENU = "CharacterSelectMenu"
const MAX_PLAYERS = 8

enum Character {NONE, ASH, BAYLIE, EIRE, ETIENNE, GALINA, LEDDID, SAYARAT, SIMFIR}
const CHARACTER_NAMES = {
	Character.ASH: "Ash",
	Character.BAYLIE: "Baylie",
	Character.EIRE: "Eire",
	Character.ETIENNE: "Étienne",
	Character.GALINA: "Galina",
	Character.LEDDID: "Leddid",
	Character.SAYARAT: "Sayarat",
	Character.SIMFIR: "Simfir"
}
