class_name Slime
extends CharacterBody2D

# export variables
@export var damage_number_location: DamagePopUp
@export var velocityComponent: VelocityComponent

# class constants
const SPEED = 50.0
const KNOCK_BACK_DIRECTION_RIGHT = Vector2.RIGHT
const KNOCKBACK_STRENGTH = 500

# class variables
var knockback = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func _process(delta):
	if knockback:
		velocity.x = -SPEED
	
func applyKnockback():
	if is_on_floor():
		velocity = KNOCK_BACK_DIRECTION_RIGHT.normalized() * KNOCKBACK_STRENGTH
	knockback = true
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		velocityComponent.ApplyKnockBack(Vector2.RIGHT,self)
		knockback = true
		damage_number_location.popup()
