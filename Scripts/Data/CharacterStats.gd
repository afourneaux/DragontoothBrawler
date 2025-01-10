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
	NAME, 
	HEALTH,
	WEAPON,
	SPECIAL
}

func get_character_name(character):
	return CHARACTER_STATS[character][StatField.NAME]

func get_health(character):
	return CHARACTER_STATS[character][StatField.HEALTH]

func get_weapon(character):
	return CHARACTER_STATS[character][StatField.WEAPON]

func get_special(character):
	return CHARACTER_STATS[character][StatField.SPECIAL]

const CHARACTER_STATS = {
	Character.NONE: {
		StatField.NAME: "==undefined name==",
		StatField.HEALTH: 0,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.ASH: {
		StatField.NAME: "Ash",
		StatField.HEALTH: 70,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.BAYLIE: {
		StatField.NAME: "Baylie",
		StatField.HEALTH: 70,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.EIRE: {
		StatField.NAME: "Eire",
		StatField.HEALTH: 70,
		StatField.WEAPON: WeaponStats.Weapon.CROSSBOW,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.ETIENNE: {
		StatField.NAME: "Étienne",
		StatField.HEALTH: 100,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.GALINA: {
		StatField.NAME: "Galina",
		StatField.HEALTH: 150,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.LEDDID: {
		StatField.NAME: "Leddid",
		StatField.HEALTH: 150,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.SAYARAT: {
		StatField.NAME: "Sayarat",
		StatField.HEALTH: 100,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	},
	Character.SIMFIR: {
		StatField.NAME: "Simfir",
		StatField.HEALTH: 70,
		StatField.WEAPON: WeaponStats.Weapon.NONE,
		StatField.SPECIAL: WeaponStats.Special.NONE
	}
}
