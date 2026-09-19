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
