class_name DamageNumComponent
extends Node2D

# onready variables
@onready var damage_label = $DamageLabel
@onready var animation_player = $DamageAnimation

# class variables
var damage_amount: int

func _ready():
	damage_label.set_text(str(damage_amount))
	animate()

func animate():
	animation_player.play("Damage_PopUp")
	var tween = get_tree().create_tween()
	var end_pos = get_random_direction() + global_position
	var animation_length = animation_player.current_animation_length
	tween.tween_property(self, "position", end_pos, animation_length)

func get_random_direction():
	return Vector2(randf_range(-100, -75), -100)
