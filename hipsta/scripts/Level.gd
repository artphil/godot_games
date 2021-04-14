extends Node2D

var rng = RandomNumberGenerator.new()
export (PackedScene) var Mob


func _ready():
	#$Player1/AnimatedSprite.play()
	pass


func _on_MobTimer_timeout():
	$MobTimer.wait_time = rng.randf_range(5, 15)
	var mob = Mob.instance()
	add_child(mob)
	mob.position = Vector2(1050, 550)
