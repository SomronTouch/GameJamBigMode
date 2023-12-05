extends CharacterBody2D

@export var characterVelocity : VelocityComponent
@export var damageNumbers : DamagePopUp
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
func _process(delta):
	characterVelocity.Move(self)

func _on_hitbox_area_entered(area):
	characterVelocity.ApplyKnockBack(Vector2.LEFT, self)
	damageNumbers.popup()
