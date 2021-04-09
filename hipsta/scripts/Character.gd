extends RigidBody2D

export var pulou = 0
export var chao = true
var jump_speed = -400
var character_speed = 100
var transcedent = false

var start_position = Vector2(0,0)


func _ready():
	start_position = position
	$AnimatedSprite.play()
	restart()


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += character_speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= character_speed * delta
	
	if transcedent:
		$AnimatedSprite.visible = !$AnimatedSprite.visible
	
	if linear_velocity.y < 0:
		$AnimatedSprite.animation = "up"
	elif linear_velocity.y > 0:
		$AnimatedSprite.animation = "down"
	else:
		$AnimatedSprite.animation = "run"
		
	if position.x < 0:
		restart()


func _input(event):
	if event.is_action_pressed("ui_select"):
		if pulou < 2:
			pulou += 1
			set_linear_velocity(Vector2(linear_velocity.x, jump_speed))


func restart():
	position = start_position
	transcedent = true
	set_collision_mask_bit(1, false)
	$Timer.start()


func _on_Timer_timeout():
	transcedent = false
	set_collision_mask_bit(1, true)
	$AnimatedSprite.visible = true
