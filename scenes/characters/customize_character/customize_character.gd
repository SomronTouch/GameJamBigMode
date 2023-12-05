extends Node2D

@export var player : Node2D

const WORLD_SCENE = "res://scenes/levels/world/world.tscn"

@onready var hairSprite = $Player/CompositeSprite/Hair
@onready var eyesSprite = $Player/CompositeSprite/Eyes
@onready var bodySprite = $Player/CompositeSprite/Body
@onready var armsSprite = $Player/CompositeSprite/Arms
@onready var shirtSprite = $Player/CompositeSprite/Shirt
@onready var pantsSprite = $Player/CompositeSprite/Pants
@onready var shoesSprite = $Player/CompositeSprite/Shoes

var current_hair: int = 0
var current_eyes: int = 0
var current_body: int = 0
var current_arms: int = 0
var current_shirt: int = 0
var current_pants: int = 0
var current_shoes: int = 0

var composite_sprites = preload("res://scripts/composite_sprites.gd").new()

func _ready():
	hairSprite.texture = composite_sprites.hair_spritesheet[current_hair]
	eyesSprite.texture = composite_sprites.eyes_spritesheet[current_eyes]
	bodySprite.texture = composite_sprites.body_spritesheet[current_body]
	armsSprite.texture = composite_sprites.arms_spritesheet[current_arms]
	shirtSprite.texture = composite_sprites.shirt_spritesheet[current_shirt]
	pantsSprite.texture = composite_sprites.pants_spritesheet[current_pants]
	shoesSprite.texture = composite_sprites.shoes_spritesheet[current_shoes]

func _on_change_hair_pressed():
	current_hair = (current_hair + 1) % composite_sprites.hair_spritesheet.size()
	hairSprite.texture = composite_sprites.hair_spritesheet[current_hair]


func _on_change_eye_pressed():
	current_eyes = (current_eyes + 1) % composite_sprites.eyes_spritesheet.size()
	eyesSprite.texture = composite_sprites.eyes_spritesheet[current_eyes]


func _on_change_body_pressed():
	current_body = (current_body + 1) % composite_sprites.body_spritesheet.size()
	bodySprite.texture = composite_sprites.body_spritesheet[current_body]


func _on_change_arms_pressed():
	current_arms = (current_arms + 1) % composite_sprites.arms_spritesheet.size()
	armsSprite.texture = composite_sprites.arms_spritesheet[current_arms]


func _on_change_shirt_pressed():
	current_shirt = (current_shirt + 1) % composite_sprites.shirt_spritesheet.size()
	shirtSprite.texture = composite_sprites.shirt_spritesheet[current_shirt]


func _on_change_pants_pressed():
	current_pants = (current_pants + 1) % composite_sprites.pants_spritesheet.size()
	pantsSprite.texture = composite_sprites.pants_spritesheet[current_pants]


func _on_change_shoes_pressed():
	current_shoes = (current_shoes + 1) % composite_sprites.shoes_spritesheet.size()
	shoesSprite.texture = composite_sprites.shoes_spritesheet[current_shoes]


func _on_accept_pressed():
	get_tree().change_scene_to_file(WORLD_SCENE)
