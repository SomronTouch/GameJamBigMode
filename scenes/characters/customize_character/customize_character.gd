extends Node2D

@onready var hairSprite = $CompositeSprites/Hair
@onready var eyesSprite = $CompositeSprites/Eyes
@onready var bodySprite = $CompositeSprites/Body
@onready var armsSprite = $CompositeSprites/Arms
@onready var shirtSprite = $CompositeSprites/Shirt
@onready var pantsSprite = $CompositeSprites/Pants
@onready var shoesSprite = $CompositeSprites/Shoes

var current_hair: int = 0
var current_eyes: int = 0
var current_body: int = 0
var current_arms: int = 0
var current_shirt: int = 0
var current_pants: int = 0
var current_shoes: int = 0

var composite_sprites = preload("res://scripts/compositeSprites.gd").new()

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
