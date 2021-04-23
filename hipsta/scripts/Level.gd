extends Node2D

export (Resource) var g
export (Array, PackedScene) var Mobs
export (Array, PackedScene) var  backgrounds
var MAX_MOBS = [60,80,100] 
var MAX_LEVEL = 2

var rng = RandomNumberGenerator.new()
var mob_pos = [Vector2(1024, 550),Vector2(1024, 520),Vector2(1024, 400),Vector2(1024, 250)]
var mos_times = [2,3,0.5,0.2]

var level : int
var bg : Node

onready var score_gui = $GUI/HBoxContainer/Score/Value
onready var life_gui = $GUI/HBoxContainer/LifeBar/Life
onready var player = $Player/AnimatedSprite


func _ready():
	level = -1
	new_bg()
	g.start()


func _process(delta):
	score_gui.text = str(g.score)
	life_gui.value = g.life
	player.speed_scale = round(1+g.speed/10)


func _on_MobTimer_timeout():
	var t = rng.randi_range(0, 100)
	var m = rng.randi_range(0, MAX_MOBS[level])
	
	if t < 50:
		$MobTimer.wait_time = mos_times[0]
	elif t < 60:
		$MobTimer.wait_time = mos_times[1]
	elif t < 80:
		$MobTimer.wait_time = mos_times[2]
	elif t < 95:
		$MobTimer.wait_time = mos_times[2]
	else:
		$MobTimer.wait_time = mos_times[3]
		
	if m < 50:
		instance_mob(0)
	elif m < 60:
		instance_mob(1)
	elif m < 80:
		instance_mob(2)
	else:
		instance_mob(3)


func _on_ScoreCounter_timeout():
	g.score += 1
	g.speed += 0.1
	if g.score % 100 == 0:
		g.life_up()
		new_bg()


func instance_mob(i):
	var mob = Mobs[i].instance()
	add_child(mob)
	mob.position = mob_pos[i]


func new_bg():
	if level < MAX_LEVEL:
		level += 1
		if bg:
			bg.queue_free()
		bg = backgrounds[level].instance()
		add_child(bg)
