extends Node

var character_appearance_data: Dictionary = {
	"selected_hair": 0,
	"selected_eyes": 0,
	"selected_body": 0,
	"selected_arms": 0,
	"selected_shirt": 0,
	"selected_pants": 0,
	"selected_shoes": 0
}

func update_character_appearance(new_appearance_data: Dictionary) -> void:
	for key in new_appearance_data:
		if key in character_appearance_data:
			character_appearance_data[key] = new_appearance_data[key]

func get_character_appearance() -> Dictionary:
	return character_appearance_data
