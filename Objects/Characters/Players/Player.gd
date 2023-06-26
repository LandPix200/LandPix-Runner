extends KinematicBody2D

var GRAVITY = 1000
var run_speed = 200
var jump_force = 350
var acceleration = 0.25
var run_direction = 0
var face_direction = 0
var velocity = Vector2()
var can_double_jump = true

func _ready():
	$AnimatedSprite.play("idle")


func _physics_process(delta):
	
	velocity.y += GRAVITY * delta

	var left_pressed = int(Input.is_action_pressed("ui_left") or $HUD.left_btn.is_pressed())
	var right_pressed = int(Input.is_action_pressed("ui_right") or $HUD.right_btn.is_pressed())
	run_direction = right_pressed - left_pressed
	
	velocity.x = run_speed * run_direction 
	jump()
	manage_animations()
	manage_direction()
	resurection()
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func jump():
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			$Sounds/JumpSound.play()
			can_double_jump = true
			velocity.y = -jump_force
		if not is_on_floor() and can_double_jump:
			double_jump()
		
		
func double_jump():
	$Sounds/DoubleJumpSound.play()
	var double_jump_force = jump_force * 1.5
	can_double_jump = false
	velocity.y = -double_jump_force
	$AnimatedSprite.play("double jump")
	

func resurection():
	if global_position.y > $Camera2D.limit_bottom:
		global_position.y = 0




	
func manage_animations():
	if not int(velocity.x) == 0 and is_on_floor():
		$AnimatedSprite.play("run")
	if is_on_floor() and int(velocity.x) == 0:
		$AnimatedSprite.play("idle")
		
	if not is_on_floor() and can_double_jump:
		$AnimatedSprite.play("jump")
		

		
		
	
func manage_direction():
	if not run_direction == 0:
		face_direction = run_direction
	
	if(face_direction == 1):
		$AnimatedSprite.flip_h = false
	if(face_direction == -1):
		$AnimatedSprite.flip_h = true



func _on_HUD_jump():
	if is_on_floor():
		$Sounds/JumpSound.play()
		can_double_jump = true
		velocity.y = -jump_force
	if not is_on_floor() and can_double_jump:
		double_jump()


func _on_HUD_toLeft():
	pass
	


func _on_HUD_toRight():
	pass
