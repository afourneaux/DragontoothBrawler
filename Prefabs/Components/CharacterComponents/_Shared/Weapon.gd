extends Node

class_name Weapon

var parent: Character = null

func _ready():
	parent = get_parent()
