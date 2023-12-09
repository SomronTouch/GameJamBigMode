extends Resource

class_name EnemyResource
# Enemy Stats
@export var name : String
@export var health : int
@export var damage : int
@export var defence : int

# Enemy Movement
@export var movement_speed : int
@export var knockback_distance : int

#Enemy Gains
@export var player_exp : int
@export var weapon_exp : int
@export var gold_gained : int
