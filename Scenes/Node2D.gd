extends Node2D
var is_paused := false
@onready var resume = $Control/VBoxContainer/resume

func _ready():
	hide()

func _process(delta):
	print("is paused ", is_paused)
	if Input.is_action_just_pressed("pause"):
		resume.focused = false
		is_paused = !is_paused
		get_tree().paused = is_paused
	
	if get_tree().paused == true:
		show()

	elif get_tree().paused == false:
		hide()


