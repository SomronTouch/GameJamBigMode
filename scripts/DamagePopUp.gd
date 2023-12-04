extends Marker2D

class_name DamagePopUp

@export var damage_node : PackedScene

func _ready():
	randomize()

func popup():
	var damage = damage_node.instantiate()
	damage.position = global_position
	
	var tween = get_tree().create_tween()
	tween.tween_property(damage,
						"position",
						global_position + _get_direction(),
						0.74)
	get_tree().current_scene.add_child(damage)

func _get_direction():
	return Vector2(randf_range(-1,1), -randf()) * 16
	
func _input(event):
	if event.is_action_pressed("test"):
		popup()
