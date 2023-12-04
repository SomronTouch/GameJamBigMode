extends CharacterBody2D
@export var damage_number_location: DamagePopUp

# CONST
const SPEED = 50.0

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
	var knockback_direction = Vector2.RIGHT
	var knockback_strength = 500.0
	
	if is_on_floor():
		velocity = knockback_direction.normalized() * knockback_strength
	knockback = true
	move_and_slide()



func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		applyKnockback()
		damage_number_location.popup()
		
