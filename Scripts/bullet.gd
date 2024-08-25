extends RigidBody2D
var speed = 750
var damage = 1
var bulletNumber = 0
@onready var timer = $Timer
@onready var teleport_timer = $teleportTimer



# Called when the node enters the scene tree for the first time.
func _ready():
	set_continuous_collision_detection_mode(1)
	set_inertia(10000)
	gravity_scale = 0.1
	center_of_mass_mode = 1
	center_of_mass = Vector2(0, 0.1)
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_area_2d_body_entered(body):
	if body.is_in_group("ground"):
		queue_free()
	if body.is_in_group("players"):
		print("hit player")
		body.health -= damage
		body.health_bar.show()
		if body.health_bar_timer.is_stopped():
			body.health_bar_timer.start()
		queue_free()
	if body.is_in_group("shield"):
		print("hit shield")
		body.health -= damage



func _on_timer_timeout():
	queue_free()
	
func _process(delta):
	#print(linear_velocity)
	pass







	

