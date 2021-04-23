extends KinematicBody2D


export (Resource) var g
export var speed = 200

func _ready():
	$AnimatedSprite.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * speed *  (1 + g.speed / 10)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
