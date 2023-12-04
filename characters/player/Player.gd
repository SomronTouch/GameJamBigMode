extends CharacterBody2D

@export var damage_pop_up: DamagePopUp

const SPEED = 50.0
const KNOCK_BACK_DIRECTION_LEFT = Vector2.LEFT
const KNOCKBACK_STRENGTH = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
	
# sets the velocity.x equal to the player's speed
func _process(delta):
	velocity.x = SPEED

# Calculate knock back when player colliders with monsters
func applyKnockback():	
	if is_on_floor():
		velocity = KNOCK_BACK_DIRECTION_LEFT.normalized() * KNOCKBACK_STRENGTH
	
	move_and_slide()

# When an object enters the player's Area2D, write logic here
func _on_area_2d_area_entered(area):
	if area.is_in_group("Slime"):
		applyKnockback()
		damage_pop_up.popup()
