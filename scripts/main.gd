extends Node2D

const WORLD_SCENE = "res://scenes/levels/world/world.tscn"
const CHAR_CUSTOMIZATION = "res://scenes/characters/customize_character/customize_character.tscn"

# Quit window when user clicks quit
func _on_quit_pressed():
	get_tree().quit()

# Change Scene to World when user clicks play
func _on_play_pressed():
	get_tree().change_scene_to_file(CHAR_CUSTOMIZATION)
