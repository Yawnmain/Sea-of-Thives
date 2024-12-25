extends Node

func _on_level_1_pressed() -> void:
	Global.points = 0
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
