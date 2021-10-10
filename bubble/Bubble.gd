extends StaticBody2D

export (String) var day = "Mon"

onready var label = get_node("Control/CenterContainer/Label")

func _ready():
	label.text = day
