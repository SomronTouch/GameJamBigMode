extends Node2D

class_name HealthComponent

# signals
signal health_changed
signal health_depleted

# export variables
@export var max_health: float = 10.0

# class variables
var health: float

func _ready() -> void:
	health = max_health
	
func apply_damage(damage: float) -> void:
	# emit signals when health changes and/or is depleted
	health = max(0, health - damage)
	if health <= 0:
		health_depleted.emit()
	else:
		health_changed.emit()
