extends Node

enum Character {NONE, ASH, BAYLIE, EIRE, ETIENNE, GALINA, LEDDID, SAYARAT, SIMFIR}
enum StatField {NONE, NAME, HEALTH}

func get_character_name(character):
	return CHARACTER_STATS[character][StatField.NAME]

func get_health(character):
	return CHARACTER_STATS[character][StatField.HEALTH]

const CHARACTER_STATS = {
	Character.NONE: {
		StatField.NAME: "==undefined name==",
		StatField.HEALTH: 0
	},
	Character.ASH: {
		StatField.NAME: "Ash",
		StatField.HEALTH: 70
	},
	Character.BAYLIE: {
		StatField.NAME: "Baylie",
		StatField.HEALTH: 70
	},
	Character.EIRE: {
		StatField.NAME: "Eire",
		StatField.HEALTH: 70
	},
	Character.ETIENNE: {
		StatField.NAME: "Étienne",
		StatField.HEALTH: 100
	},
	Character.GALINA: {
		StatField.NAME: "Galina",
		StatField.HEALTH: 150
	},
	Character.LEDDID: {
		StatField.NAME: "Leddid",
		StatField.HEALTH: 150
	},
	Character.SAYARAT: {
		StatField.NAME: "Sayarat",
		StatField.HEALTH: 100
	},
	Character.SIMFIR: {
		StatField.NAME: "Simfir",
		StatField.HEALTH: 70
	}
}
