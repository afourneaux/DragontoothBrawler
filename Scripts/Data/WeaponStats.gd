extends Node

enum Weapon {
	NONE,
	CROSSBOW,
}
enum Special {
	NONE
}
enum StatField {
	NONE, 
	NAME, 
	DAMAGE, 
	FORCE
}

func get_weapon_name(weapon):
	return WEAPON_STATS[weapon][StatField.NAME]

func get_damage(weapon):
	return WEAPON_STATS[weapon][StatField.DAMAGE]

func get_force(weapon):
	return WEAPON_STATS[weapon][StatField.FORCE]

const WEAPON_STATS = {
	Weapon.NONE: {
		StatField.NAME: "==undefined name==",
		StatField.DAMAGE: 0,
		StatField.FORCE: 0,
	},
	Weapon.CROSSBOW: {
		StatField.NAME: "Crossbow",
		StatField.DAMAGE: 25,
		StatField.FORCE: 50,
	},
}
