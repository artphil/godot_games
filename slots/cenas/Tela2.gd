extends Node2D


export(Resource) var g 


func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://cenas/TelaInicial.tscn")


func _on_ButtonPlayer1_pressed():
	g.player_choose = 1
	get_tree().change_scene("res://cenas/Tela3.tscn")


func _on_ButtonPlayer2_pressed():
	g.player_choose = 2
	get_tree().change_scene("res://cenas/Tela3.tscn")
