extends TextureRect
var rng = RandomNumberGenerator.new()
export (PackedScene) var Mob

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_MobTimer_timeout():
	$MobTimer.wait_time = rng.randf_range(3, 10)
	var mob = Mob.instance()
	add_child(mob)
	mob.position = Vector2(1050, 550)
