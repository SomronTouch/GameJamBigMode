class_name VelocityComponent
extends Node2D

# export variables
@export var movement_speed : float

func set_move_speed(speed: float) -> void:
	movement_speed = speed

# moves the palyer right
func move(character_body: CharacterBody2D) -> void:
	character_body.velocity.x = movement_speed

func apply_knockback(knockback_direction: Vector2,knockback_distance : int, character_body: CharacterBody2D) -> void:
	if character_body.is_on_floor():
		character_body.velocity = knockback_direction.normalized() * knockback_distance
	character_body.move_and_slide()
