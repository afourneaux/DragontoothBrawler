extends Node

enum Weapon {
	NONE,
	CROSSBOW,
	ORB
}
enum Special {
	NONE
}
enum StatField {
	NONE,
	NAME,
	DAMAGE,
	FORCE,
	PROJECTILE_SCENE
}

func get_weapon_name(weapon):
	return WEAPON_STATS[weapon][StatField.NAME]

func get_damage(weapon):
	return WEAPON_STATS[weapon][StatField.DAMAGE]

func get_force(weapon):
	return WEAPON_STATS[weapon][StatField.FORCE]

func get_projectile(weapon):
	return WEAPON_STATS[weapon][StatField.PROJECTILE_SCENE]

const WEAPON_STATS = {
	Weapon.NONE: {
		StatField.NAME: "==undefined name==",
		StatField.DAMAGE: 0,
		StatField.FORCE: 0,
		StatField.PROJECTILE_SCENE: null,
	},
	Weapon.CROSSBOW: {
		StatField.NAME: "Crossbow",
		StatField.DAMAGE: 25,
		StatField.FORCE: 50,
		StatField.PROJECTILE_SCENE: preload("res://Prefabs/GameObjects/Projectiles/quarrel.tscn"),
	},
	Weapon.ORB: {
		StatField.NAME: "Orb",
		StatField.DAMAGE: 10,
		StatField.FORCE: 100,
		StatField.PROJECTILE_SCENE: preload("res://Prefabs/GameObjects/Projectiles/orb.tscn"),
	},
}
