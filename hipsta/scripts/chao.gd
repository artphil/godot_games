extends StaticBody2D

func _ready():
	pass 


func _on_Player_body_entered(_body):
	get_parent().get_node("Player").pulou = 0
