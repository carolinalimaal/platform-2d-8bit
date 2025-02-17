extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
