extends Resource

const LIFE_MAX = 5
const LIFE_INIT = 3
const SPEED_INIT = 1.0


var life : int
var speed : float
var score : int


func start():
	score = 0
	life = LIFE_INIT
	speed = SPEED_INIT


func life_up():
	if life < LIFE_MAX:
		life += 1


func life_down():
	if life > 0:
		life -= 1
