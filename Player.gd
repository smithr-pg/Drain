extends KinematicBody2D

export (int) var speed = 150
export (int) var jump_speed = -250
export (int) var gravity = 500

var velocity = Vector2.ZERO
var double_jump = true

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor() or double_jump:
			velocity.y = jump_speed
			double_jump = false
	if is_on_floor():
		double_jump = true
