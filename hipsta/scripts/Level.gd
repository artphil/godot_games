extends Node2D

export (Resource) var g
export (PackedScene) var Mob
var rng = RandomNumberGenerator.new()

onready var score_gui = $GUI/HBoxContainer/Score/Value
onready var life_gui = $GUI/HBoxContainer/LifeBar/Life
onready var player = $Player/AnimatedSprite


func _ready():
	g.start()
	pass


func _process(delta):
	score_gui.text = str(g.score)
	life_gui.value = g.life
	player.speed_scale = round(1+g.speed/10)


func _on_MobTimer_timeout():
	$MobTimer.wait_time = rng.randf_range(5, 15)
	var mob = Mob.instance()
	add_child(mob)
	mob.position = Vector2(1024, 550)


func _on_ScoreCounter_timeout():
	g.score += 1
	g.speed += 0.1
	if g.score % 10 == 0:
		g.life_up()
