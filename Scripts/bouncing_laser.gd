extends Node2D
var sender
var bounces := 3
const MAX_LENGTH := 2000

@onready var line_2d = $Line2D
@onready var laser = $laser
@onready var lasers_end = $lasersEnd

var max_cast_to #Vector2 variable
var rot := 0.0 #mouse rotation

#lasers array
var lasers := []

func ready():
	#add initial line to the array
	lasers.append(laser)
	
	for i in range(bounces):
		var raycast = laser.duplicate()
		raycast.enabled = false
		raycast.add_exception(sender)
		add_child(raycast)
		lasers.append(raycast)
		
	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	$laser.target_position = max_cast_to
	
	$line2D.set_as_toplevel(true)
	
func _process(_delta):
	
	
	rot = get_local_mouse_position().angle()
	#line_2d.clear_points()
	
	line_2d.add_point(global_position)
	
	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	
	var idx = -1
	for raycast in lasers:
		
		idx += 1
		var raycastCollision = raycast.get_collision_point()
		
		raycast.target_position = max_cast_to
		
		if raycast.is_colliding():
			line_2d.add_point(raycastCollision)
			
			var collider = raycast.get_collider()
		
			if collider.is_in_group("players"):
				#do damage
				pass
			
			max_cast_to = max_cast_to.bounce(raycast.get_collision_normal())
		
			#if number is less the size opf lasers point array
			if idx < lasers.size()-1:
				#enable the laserpoint at index
				lasers[idx+1].enabled = true
				lasers[idx+1].global_position = raycastCollision+(1*max_cast_to.normalized())
			if idx == lasers.size()-1:
				lasers_end.global_position = raycastCollision
				
			else:#if no collision
				line_2d.add_point(global_position + max_cast_to)
				
				if idx == 0:
					raycast.target_position = max_cast_to
					lasers_end.global_position = global_position + max_cast_to
				else:
					lasers_end.global_position = raycast.global_position + max_cast_to
		
	

