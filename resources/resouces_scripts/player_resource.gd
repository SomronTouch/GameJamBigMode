extends Resource

class_name PlayerResource

# Player Stats
@export var name : String
@export var health : int
@export var def : int
@export var movement_speed : int
@export var knockback_distance: int

# Player Exp
@export var player_exp : int
@export var weapon_exp : int
@export var player_level : int
@export var player_next_level_exp : int # exp needed to level up
@export var weapon_next_level_exp : int

# Player inventory
@export var player_gold : int


