extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var music: AudioStreamPlayer2D = $Music

func _ready() -> void:
	animation_player.play("game_win")
	music.play()

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
