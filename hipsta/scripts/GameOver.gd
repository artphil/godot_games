extends Node2D

export (Resource) var g


func _ready():
	$Label.text = "Score: "+ str(g.score)


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/Main.tscn")
