extends Node2D


export(Resource) var g


func _ready():
	$Label.text = "O jogador escolhido foi " + str(g.player_choose)



func _on_Button_pressed():
	get_tree().change_scene("res://cenas/TelaInicial.tscn")
