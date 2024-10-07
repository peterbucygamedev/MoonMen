extends RigidBody2D
var speed = 20
@onready var start_fade_timer = $"../startFadeTimer"
@onready var fade_increment_timer = $"../fadeIncrementTimer"


func _physics_process(delta: float) -> void:

	apply_central_force(Vector2(speed, 0))
	# Check for input and create a movement vector
	"""if Input.is_action_pressed("ui_up"):  # W
		apply_central_force(Vector2(0,-speed))
		
	if Input.is_action_pressed("ui_down"):  # S
		apply_central_force(Vector2(0,speed))
		
	if Input.is_action_pressed("ui_left"):  # A
		apply_central_force(Vector2(-speed,0))
		
	if Input.is_action_pressed("ui_right"):  # D
		apply_central_force(Vector2(speed,0))"""


func _on_start_fade_timer_timeout():
	pass # Replace with function body.


func _on_fade_increment_timer_timeout():
	pass # Replace with function body.
