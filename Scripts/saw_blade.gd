extends RigidBody2D
var speed = 750
var damage = 1
var bulletNumber = 0
@onready var timer = $Timer
@onready var saw_blade = $"."
var stick = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_continuous_collision_detection_mode(1)
	set_inertia(30)
	gravity_scale = 1
	center_of_mass_mode = 1
	center_of_mass = Vector2(0, 0.1)
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if stick:
		freeze = true
		#print("sticking")
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("ground") or body.is_in_group("tiles"):
		stick = true
		
	if body.is_in_group("power_crate"):
		reparent(body)
		stick = true
		
		#body.angular_velocity = Vector2(0, 0)
	if body.is_in_group("players"):
		#print("hit player")
		body.health -= damage
		body.health_bar.show()
		if body.health_bar_timer.is_stopped():
			body.health_bar_timer.start()
		

func _on_timer_timeout():
	queue_free()
