extends Area2D

@onready var timer: Timer = $Timer
@onready var dead_sound: AudioStreamPlayer2D = $DeadSound

func _on_body_entered(_body: Node2D) -> void:
	dead_sound.play()
	print("You died!")
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
