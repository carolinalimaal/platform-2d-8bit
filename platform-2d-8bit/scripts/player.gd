extends CharacterBody2D

const SPEED = 100
const JUMP = 240

enum State {idle, run, jump, fall, climb}
var current_state

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	set_state()
	update_animations()
	
	player_falling(delta)
	player_run()
	player_jump()
	
	move_and_slide()

func get_direction():
	return Input.get_axis("move_left", "move_right")

func player_falling(delta):
	if !is_on_floor():
		velocity += get_gravity() * delta

func player_run():
	var direction = get_direction()
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h = false if direction > 0 else true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func player_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP

func set_state():
	if is_on_floor():
		if get_direction():
			current_state = State.run
		else:
			current_state = State.idle
		
		if Input.is_action_just_pressed("jump"):
			current_state = State.jump
		
	else:
		current_state = State.fall


func update_animations():
	if current_state == State.idle:
		animation_player.play("idle")
	elif current_state == State.run:
		animation_player.play("run")
	elif current_state == State.jump:
		animation_player.play("jump")
	elif current_state == State.fall:
		animation_player.play("fall")
