extends Node

var current_score = 0
var total_coins = 8

@onready var timer: Timer = $Timer
@onready var level_sound: AudioStreamPlayer2D = $"../LevelSound"
@onready var score: Label = $"../CoinScoreLabel/Panel/score"

func _ready() -> void:
	level_sound.play()

func _process(_delta: float) -> void:
	end_game()

func add_score():
	current_score += 1
	score.text = "%1d" % current_score
	print("+1 Coin")

func end_game():
	if current_score == total_coins:
		current_score += 1
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/game_win.tscn")
