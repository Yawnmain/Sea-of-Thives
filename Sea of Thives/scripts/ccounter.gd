extends Node
@onready var points_label: Label = %Ccounter

func add_point():
	Global.points += 1
	print(Global.points)
	points_label.text = "Золото " + str(Global.points)
	
