class_name HitboxComponent
extends Area2D

# export variables
@export var health_component: HealthComponent
@export var damage_label_marker: Marker2D
@export var show_damage: bool

# preloads
var damage_number_component = preload("res://scenes/components/damage_num_component/damage_num_component.tscn")

func apply_damage(damage: int):
	if health_component:
		health_component.apply_damage(damage)
	if show_damage:
		display_damage(damage)

func display_damage(damage: int):
	if damage_label_marker:
		var damage_number = damage_number_component.instantiate()
		damage_number.damage_amount = damage
		damage_label_marker.add_child(damage_number)
