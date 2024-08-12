extends RigidBody2D
var speed = 750
var damage = 10
var bulletNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_continuous_collision_detection_mode(1)
	set_inertia(30)
	gravity_scale = 1
	center_of_mass_mode = 1
	center_of_mass = Vector2(0, 0.1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(bulletNumber)
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("ground"):
		queue_free()
	if body.is_in_group("players"):
		
		#print("hit player")
		body.health -= damage
		queue_free()
