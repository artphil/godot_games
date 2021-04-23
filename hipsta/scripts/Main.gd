extends Node2D

export (Resource) var g


func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Level.tscn")
