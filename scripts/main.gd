extends Node2D

func _on_play_pressed():
	SceneManager.goto_scene("res://scenes/characters/customize_character/customize_character.tscn")

func _on_quit_pressed():
	get_tree().quit()
