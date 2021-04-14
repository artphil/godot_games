extends KinematicBody2D

# stats
var score : int = 0
 
# physics
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
var jumpCounter = 0
 
var start_position = Vector2()
var invencible = true
var vel : Vector2 = Vector2()
onready var sprite = $AnimatedSprite

var grounded : bool = false

func _ready():
	start_position = position
	sprite.play()
	restart()

func _process(delta):
	if invencible:
		sprite.visible = !sprite.visible
	
	if vel.y < 0:
		sprite.animation = "up"
	elif vel.y > 0:
		sprite.animation = "down"
	else:
		sprite.animation = "run"
		
	if position.x < -20:
		restart()
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("enemy"):
			restart()
		
func _physics_process(delta):
	# reset horizontal velocity
	vel.x = 0
	 
	# movement inputs
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
		
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	 
	# jump input
	#if is_on_floor():
	if $GroundDetector.is_colliding():
		if not grounded:
			grounded = true
			vel.y = 0
			jumpCounter = 0
	else:
		grounded = false
		vel.y += gravity * delta

func _input(event):
	if event.is_action_pressed("ui_select") and jumpCounter < 2:
		jumpCounter +=1
		vel.y = -jumpForce

func restart():
	position = start_position
	invencible = true
	set_collision_mask_bit(1, false)
	$Timer.start()

func _on_Timer_timeout():
	invencible = false
	set_collision_mask_bit(1, true)
	sprite.visible = true
