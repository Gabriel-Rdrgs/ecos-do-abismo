extends RefCounted
class_name CombatCalculator

static func calculate_physical_damage(stats: PlayerStats) -> int:
	if stats == null:
		push_warning("CombatCalculator recebeu stats nulo.")
		return 1

	var base_damage := (stats.strength * 1.5) + stats.dexterity
	return maxi(int(base_damage), 1)

static func calculate_spell_damage(
	stats: PlayerStats,
	base_damage: int,
	intelligence_scaling: float = 0.7,
	faith_scaling: float = 0.0
) -> int:
	if stats == null:
		push_warning("CombatCalculator recebeu stats nulo.")
		return maxi(base_damage, 1)

	var scaled_damage := (
		base_damage
		+ stats.intelligence * intelligence_scaling
		+ stats.faith * faith_scaling
	)

	return maxi(int(scaled_damage), 1)
