extends Node2D

class_name Character

signal on_death
signal on_health_changed

var weapons_node: Node
@export var player_id: int = -1:
	set (value):
		player_id = value
		set_multiplayer_authority(value, true)

var character_id = CharacterStats.Character.NONE

# Default values. Override when needed
static func get_speed(): return 400
static func get_friction(): return 5
static func get_jump_height(): return 800
static func get_floaty_factor(): return 3
static func get_max_health(): return 100

@export var health: int:
	set(value):
		var new_health = clamp(value, 0, get_max_health())
		if new_health == health:
			return
		health = new_health
		on_health_changed.emit(new_health)
		if health <= 0:
			die()

func _ready():
	assert(character_id != CharacterStats.Character.NONE)
	
func _enter_tree():
	set_authority()

func die():
	on_death.emit(get_multiplayer_authority())
	queue_free()

func get_character_global_position():
	return $Character.global_position

func set_authority():
	push_warning("PLAYER:")
	push_warning(PlayerData.player_name)
	push_warning("SETTING AUTHORITY:")
	push_warning(player_id)
	push_warning("FOR CHARACTER:")
	push_warning(character_id)
	set_multiplayer_authority(player_id, true)


# CHARACTER FACTORY
# TODO: Organise better with CharacterStats

static var character_scenes = {
	CharacterStats.Character.NONE: null,
	CharacterStats.Character.ASH: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.BAYLIE: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.EIRE: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.ETIENNE: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.GALINA: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.LEDDID: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.SAYARAT: load("res://Prefabs/Characters/Eire.tscn"),
	CharacterStats.Character.SIMFIR: load("res://Prefabs/Characters/Simfir.tscn")
}

static func factory_create(
		character_id: int,
		player_id: int,
		spawn_position: Vector2,
		on_character_died: Callable,
		weapons_node: Node
	) -> Character:
	var character: Character = character_scenes[character_id].instantiate()
	character.position = spawn_position
	character.weapons_node = weapons_node
	character.on_death.connect(on_character_died)
	character.player_id = player_id
	return character
