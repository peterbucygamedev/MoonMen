extends Node2D
@onready var laser = $laser

func _process(delta):
	if laser.is_colliding():
		print("is colliding")
		
	if !laser.is_colliding():
		print("not colliding")
	
