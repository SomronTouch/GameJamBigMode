extends Marker2D

# This class is responsible for instantiating the damage text popup above the scene
# object.
class_name DamagePopUp

# takes in damage_numbers.tscn 
@export var damage_node : PackedScene
# damage text pop up color
@export var color : Color = Color(1,1,1,1)

func _ready():
	randomize()

# instantiate damage popup text above the scene object attached to
func popup():
	var damage = damage_node.instantiate()
	damage.get_node("Label").set_modulate(color)
	damage.position = global_position
	
	var tween = get_tree().create_tween()
	tween.tween_property(damage,
						"position",
						global_position + _get_direction(),
						0.74)
	get_tree().current_scene.add_child(damage)

# fade text in random direction
func _get_direction():
	return Vector2(randf_range(-1,1), -randf()) * 16

