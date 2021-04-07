extends RigidBody2D

export var pulou = 0
export var chao = true


func _ready():
	contact_monitor = true
	contacts_reported = 2
	$AnimatedSprite.play()


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += 100 * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= 100 * delta
	
	if linear_velocity.y < 0:
		$AnimatedSprite.animation = "up"
	elif linear_velocity.y > 0:
		$AnimatedSprite.animation = "down"
	else:
		$AnimatedSprite.animation = "run"


func jump():
	if pulou < 2:
		pulou += 1
		linear_velocity.y = -400



func _input(event):
	if event.is_action_pressed("ui_up"):
		jump()
