extends RigidBody2D
var speed = 2000
var damage = 1
var bulletNumber = 0
@onready var timer = $Timer
@onready var teleport_timer = $teleportTimer
@onready var area_2d = $Area2D
@onready var area_timer = $areaTimer
@onready var point_light_2d = $PointLight2D
var tracker = 0
var ammoCost = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_continuous_collision_detection_mode(1)
	"""set_inertia(200)
	gravity_scale = 1
	center_of_mass_mode = 1
	center_of_mass = Vector2(0, 0)"""
	area_2d.get_node("CollisionShape2D").disabled = true
	timer.start()
	area_timer.start()
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
		queue_free()

func _on_timer_timeout():
	queue_free()
	
func _process(delta):
	#print(linear_velocity)
	point_light_2d.color
	pass
	
func _on_area_timer_timeout():
	area_2d.get_node("CollisionShape2D").disabled = false


func _on_area_2d_area_entered(area):
	if area.is_in_group("teleport"):
		if timer.is_stopped():
			timer.start()
