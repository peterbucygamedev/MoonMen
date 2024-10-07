extends RayCast2D
@onready var line_2d = $Line2D
@onready var casting_particles = $castingParticles
@onready var collision_particles = $collisionParticles
@onready var sprite_2d = $Line2D/Sprite2D	
@onready var laser = $"."

var cast_point = null
var direction = Vector2(0,0)

var is_casting: bool = true:
	set(value):
		is_casting = value
		casting_particles.emitting = is_casting
		if is_casting:
			appear()
		else:
			collision_particles.emitting = false
			disappear()
		set_physics_process(is_casting)
		
# Called when the node enters the scene tree for the first time.
func _ready():
	is_casting = true
	direction = laser.target_position.normalized()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#set the target position for where laser starts
	cast_point = target_position
	force_raycast_update()
	
	#if collding is true, the emit the collision particles
	if is_casting:
		collision_particles.emitting = is_colliding()
		
	else:
		collision_particles.emitting = false
	
	#print("is colliding ", is_colliding())
	if is_colliding():
		#find the collisoin point and set cast point to it
		cast_point = to_local(get_collision_point())
		#adding collision particles rotation
		collision_particles.global_rotation = get_collision_normal().angle()
		#adding collision particles position
		collision_particles.position = cast_point
		
		var collision_normal = laser.get_collision_normal()


	if not is_colliding():
		pass
		
	line_2d.points[1] = cast_point
	force_raycast_update()

func appear() -> void:
	#idk
	var tween = create_tween()
	#i think this is the shape of the line
	tween.tween_property(line_2d, "width", 7, 0.1)
	
	
func disappear() -> void:
	var tween = create_tween()
	#the line when laser is complete
	tween.tween_property(line_2d, "width", 0, 0.1)
	
	
	



