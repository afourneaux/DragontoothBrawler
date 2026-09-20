extends Node2D

class_name Character

signal on_death
signal on_health_changed

var weapons_node: Node
@export var player_id: int = -1

var character_id = CharacterStats.Character.NONE

# Default values. Override when needed
func get_speed(): return 400
func get_friction(): return 5
func get_jump_height(): return 800
func get_floaty_factor(): return 3
func get_max_health(): return 100

@export var health: int:
	set(value):
		var new_health = clamp(value, 0, get_max_health())
		if new_health == health:
			return
		health = new_health
		on_health_changed.emit(new_health)

func _ready():
	assert(character_id != CharacterStats.Character.NONE)
	assert(player_id > 0)
	health = get_max_health()
	on_health_changed.connect(check_die)

func get_weapons_node():
	return get_parent().get_weapons_node()

func check_die(_new_health):
	if health <= 0:
		die()

func die():
	on_death.emit(player_id)
	queue_free()

func get_character_global_position():
	return $Character.global_position

func get_character_level_position():
	return $Character.position
