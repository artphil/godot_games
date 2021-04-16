extends Sprite

export var scroll_speed : float = 1
var g_texture_width : float = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta : float):
	_attempt_reposition()

func move(game_speed : float):
	position.x -= scroll_speed * game_speed
	
func _attempt_reposition():
	if position.x < -g_texture_width:
		# Don't just reset position to texture width, otherwise there will be a gap
		position.x += 2 * g_texture_width
		
