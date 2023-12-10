class_name Player
extends CharacterBody2D

# export variables
@export var character_velocity : VelocityComponent
@export var damageNumbers : DamagePopUp

# onready variables
@onready var hair_sprite = $CompositeSprite/Hair
@onready var eyes_sprite = $CompositeSprite/Eyes
@onready var body_sprite = $CompositeSprite/Body
@onready var arms_sprite = $CompositeSprite/Arms
@onready var shirt_sprite = $CompositeSprite/Shirt
@onready var pants_sprite = $CompositeSprite/Pants
@onready var shoes_sprite = $CompositeSprite/Shoes

# class variables
var composite_sprites = preload("res://scripts/composite_sprites.gd").new()
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	set_physical_appearance()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func _process(_delta):
	character_velocity.move(self)

func _on_hitbox_area_entered(_area):
	character_velocity.apply_knockback(Vector2.LEFT, self)
	damageNumbers.popup()

func set_physical_appearance() -> void:
	var appearance_data = Persistance.get_character_appearance()
	hair_sprite.texture = composite_sprites.hair_spritesheet[appearance_data["selected_hair"]] 
	eyes_sprite.texture = composite_sprites.eyes_spritesheet[appearance_data["selected_eyes"]]
	body_sprite.texture = composite_sprites.body_spritesheet[appearance_data["selected_body"]]
	arms_sprite.texture = composite_sprites.arms_spritesheet[appearance_data["selected_arms"]] 
	shirt_sprite.texture = composite_sprites.shirt_spritesheet[appearance_data["selected_shirt"]]
	pants_sprite.texture = composite_sprites.pants_spritesheet[appearance_data["selected_pants"]] 
	shoes_sprite.texture = composite_sprites.shoes_spritesheet[appearance_data["selected_shoes"]] 
