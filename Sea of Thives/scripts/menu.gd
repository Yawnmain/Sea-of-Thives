extends Node

func _ready():
	AudioPlayer.play_music_level()

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
