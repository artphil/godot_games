extends Node2D


export (Resource) var g

onready var layers = [	
				$layer_1_1,
				$layer_1_2,
				$layer_2_1,
				$layer_2_2,
				$layer_3_1,
				$layer_3_2,
				$layer_4_1,
				$layer_4_2
			]

func _process(delta):
	for layer in layers:
		layer.move(g.speed)
