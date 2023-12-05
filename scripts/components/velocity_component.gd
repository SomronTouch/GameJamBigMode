extends Node2D

class_name VelocityComponent

@export var movement_speed : float

func SetMoveSpeed(moveSpeed:float):
	movement_speed = moveSpeed

# moves the palyer right
func Move(characterBody: CharacterBody2D):
	characterBody.velocity.x = movement_speed

func ApplyKnockBack(knockbackDirection: Vector2, characterBody : CharacterBody2D):
	if characterBody.is_on_floor():
		characterBody.velocity = knockbackDirection.normalized() * 500
	characterBody.move_and_slide()
	

