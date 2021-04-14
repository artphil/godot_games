extends RigidBody2D

export var pulou = 0
export var chao = true
var jump_speed = -400
var character_speed = 100
var transcedent = false

var start_position = Vector2(0,0)
var move = 0


func _ready():
	start_position = position
	sprite.play()
	restart()


func _process(delta):
	
	if transcedent:
		sprite.visible = !sprite.visible
	
	if linear_velocity.y < 0:
		sprite.animation = "up"
	elif linear_velocity.y > 0:
		sprite.animation = "down"
	else:
		sprite.animation = "run"
		
	if position.x < 0:
		restart()


func _input(event):
	if event.is_action_pressed("ui_select"):
		if pulou < 2:
			pulou += 1
			set_linear_velocity(Vector2(get_linear_velocity().x, jump_speed))


func restart():
	position = start_position
	transcedent = true
	set_collision_mask_bit(1, false)
	$Timer.start()


func _on_Timer_timeout():
	transcedent = false
	set_collision_mask_bit(1, true)
	sprite.visible = true
