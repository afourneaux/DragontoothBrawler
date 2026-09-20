extends Node

enum Character {
	NONE,
	ASH,
	BAYLIE,
	EIRE,
	ETIENNE,
	GALINA,
	LEDDID,
	SAYARAT,
	SIMFIR
}
enum StatField {
	NONE,
	NAME
}

func get_character_name(character):
	return CHARACTER_STATS[character][StatField.NAME]

func get_character_portrait(character):
	var portrait_package = null
	if character != CharacterStats.Character.NONE:
		portrait_package = load("res://Assets/Sprites/Portraits/%s.png" % CharacterStats.get_character_name(character))
	if portrait_package == null:
		portrait_package = load("res://Assets/Sprites/invalid.bmp")
	return portrait_package

const CHARACTER_STATS = {
	Character.NONE: {
		StatField.NAME: "==undefined name=="
	},
	Character.ASH: {
		StatField.NAME: "Ash"
	},
	Character.BAYLIE: {
		StatField.NAME: "Baylie"
	},
	Character.EIRE: {
		StatField.NAME: "Eire"
	},
	Character.ETIENNE: {
		StatField.NAME: "Étienne"
	},
	Character.GALINA: {
		StatField.NAME: "Galina"
	},
	Character.LEDDID: {
		StatField.NAME: "Leddid"
	},
	Character.SAYARAT: {
		StatField.NAME: "Sayarat"
	},
	Character.SIMFIR: {
		StatField.NAME: "Simfir"
	}
}


const character_scenes = {
	Character.NONE: null,
	Character.ASH: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.BAYLIE: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.EIRE: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.ETIENNE: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.GALINA: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.LEDDID: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.SAYARAT: preload("res://Prefabs/Characters/Eire.tscn"),
	Character.SIMFIR: preload("res://Prefabs/Characters/Simfir.tscn")
}

func factory_create(
		character_id: int,
		player_id: int,
		spawn_position: Vector2,
		on_character_died: Callable
	) -> Character:
	var character: Character = character_scenes[character_id].instantiate()
	character.position = spawn_position
	character.on_death.connect(on_character_died)
	character.player_id = player_id
	return character
