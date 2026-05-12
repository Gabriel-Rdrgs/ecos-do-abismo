extends Resource
class_name PlayerStats

@export var vigor: int = 12
@export var stamina: int = 11
@export var strength: int = 12
@export var dexterity: int = 11
@export var intelligence: int = 9
@export var faith: int = 9

func get_max_hp() -> int:
	return 100 + vigor * 20

func get_max_stamina() -> int:
	return 50 + stamina * 10

func get_max_eco() -> int:
	return 30 + (intelligence + faith) * 8