class_name HealthComponent
extends Node2D

# signals
signal health_changed
signal health_depleted

# export variables
@export var defence_resource : DefenceResource

func _ready() -> void:
	defence_resource.current_health = defence_resource.max_health
	print(defence_resource.max_health)
	
func apply_damage(damage: float) -> void:
	# emit signals when health changes and/or is depleted
	defence_resource.current_health = max(0, defence_resource.current_health - damage)
	if defence_resource.current_health <= 0:
		health_depleted.emit()
	else:
		health_changed.emit()
