extends Area2D

@onready var game_manager: Node = $"../../GameManager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_score()
	animation_player.play("pickup")
