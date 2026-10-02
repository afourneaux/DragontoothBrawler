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
	DISPLAY_NAME,
	DATA_NAME,
	SCENE
}

func get_character_display_name(character):
	return CHARACTER_STATS[character][StatField.DISPLAY_NAME]

func get_character_data_name(character):
	return CHARACTER_STATS[character][StatField.DATA_NAME]

func get_character_scene(character):
	return load(CHARACTER_STATS[character][StatField.SCENE])

func get_character_portrait(character):
	var portrait_package = null
	if character != CharacterStats.Character.NONE:
		portrait_package = load("res://Assets/Sprites/Portraits/%s.png" % CharacterStats.get_character_display_name(character))
	if portrait_package == null:
		portrait_package = load("res://Assets/Sprites/invalid.bmp")
	return portrait_package

const CHARACTER_STATS = {
	Character.NONE: {
		StatField.DISPLAY_NAME: "==undefined name==",
		StatField.DATA_NAME: "",
		StatField.SCENE: null
	},
	Character.ASH: {
		StatField.DISPLAY_NAME: "Ash",
		StatField.DATA_NAME: "ash",
		StatField.SCENE: "res://Prefabs/Characters/Ash.tscn"
	},
	Character.BAYLIE: {
		StatField.DISPLAY_NAME: "Baylie",
		StatField.DATA_NAME: "baylie",
		StatField.SCENE: "res://Prefabs/Characters/Baylie.tscn"
	},
	Character.EIRE: {
		StatField.DISPLAY_NAME: "Eire",
		StatField.DATA_NAME: "eire",
		StatField.SCENE: "res://Prefabs/Characters/Eire.tscn"
	},
	Character.ETIENNE: {
		StatField.DISPLAY_NAME: "Étienne",
		StatField.DATA_NAME: "etienne",
		StatField.SCENE: "res://Prefabs/Characters/Etienne.tscn"
	},
	Character.GALINA: {
		StatField.DISPLAY_NAME: "Galina",
		StatField.DATA_NAME: "galina",
		StatField.SCENE: "res://Prefabs/Characters/Galina.tscn"
	},
	Character.LEDDID: {
		StatField.DISPLAY_NAME: "Leddid",
		StatField.DATA_NAME: "leddid",
		StatField.SCENE: "res://Prefabs/Characters/Leddid.tscn"
	},
	Character.SAYARAT: {
		StatField.DISPLAY_NAME: "Sayarat",
		StatField.DATA_NAME: "sayarat",
		StatField.SCENE: "res://Prefabs/Characters/Sayarat.tscn"
	},
	Character.SIMFIR: {
		StatField.DISPLAY_NAME: "Simfir",
		StatField.DATA_NAME: "simfir",
		StatField.SCENE: "res://Prefabs/Characters/Simfir.tscn"
	}
}

func factory_create(
		character_id: int,
		player_id: int,
		spawn_position: Vector2,
		on_character_died: Callable
	) -> Character:
	var character: Character = get_character_scene(character_id).instantiate()
	character.position = spawn_position
	character.on_death.connect(on_character_died)
	character.player_id = player_id
	return character
