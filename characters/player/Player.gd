extends CharacterBody2D

@export var test: DamagePopUp

const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()
	
func _process(delta):
	velocity.x = SPEED
		
func _on_body_enter(body):
	if body.is_in_group("Slime"):
		print("hello") # TODO: Cleanup print debug output!
		
func applyKnockback():
	var knockback_direction = Vector2.LEFT
	var knockback_strength = 500.0
	
	if is_on_floor():
		velocity = knockback_direction.normalized() * knockback_strength
	
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Slime"):
		applyKnockback()
		test.popup()
		print("collided with Slime") # TODO: Cleanup print debug output!
