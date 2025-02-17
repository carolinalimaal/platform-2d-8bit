extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("RESET")

func _process(_delta: float) -> void:
	pause_menu()

func resume():
	get_tree().paused = false
	animation_player.play_backwards("pause_menu")

func pause():
	get_tree().paused = true
	animation_player.play("pause_menu")

func pause_menu():
	if Input.is_action_just_pressed("pause_menu") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause_menu") and get_tree().paused:
		resume()


func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
