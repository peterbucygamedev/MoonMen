extends Node2D
@onready var ray_cast_2d = $RayCast2D
@onready var line_2d = $Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var castPoint = ray_cast_2d.target_position
	
	if ray_cast_2d.is_colliding():
		castPoint = ray_cast_2d.get_collision_point()
		
		
	print(ray_cast_2d.get_collision_point())
	
	line_2d.add_point(Vector2(0,0), 0)
	line_2d.add_point(Vector2(0,0), 1)
	line_2d.points[1] = castPoint
	
	
