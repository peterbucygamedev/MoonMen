extends RigidBody2D
var counter = 0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var detontate_timer = $detontateTimer
@onready var power_crate_detonation = $powerCrateDetonation
@onready var destroy_timer = $destroyTimer
@onready var power_crate_collider = $powerCrateCollider
@onready var explosion_area = $explosionArea

# Called when the node enters the scene tree for the first time.
func _ready():
	power_crate_detonation.emitting = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(counter)
	if counter == 1:
		animated_sprite_2d.play("1")
	elif counter == 2:
		animated_sprite_2d.play("2")
	elif counter == 3:
		animated_sprite_2d.play("3")
	elif counter == 4:
		animated_sprite_2d.play("4")
	elif counter == 5:
		animated_sprite_2d.play("5")
	elif counter == 6:
		animated_sprite_2d.play("6")
	elif counter == 7:
		animated_sprite_2d.play("detonate")
		if detontate_timer.is_stopped() and destroy_timer.is_stopped():
			detontate_timer.start()
			destroy_timer.start()

func _on_area_2d_body_entered(body):
	counter += 1

	
func _on_detontate_timer_timeout():
	#Engine.time_scale = 1
	power_crate_collider.disabled = true
	animated_sprite_2d.hide()
	power_crate_detonation.restart()
	power_crate_detonation.emitting = true
	explosion_area.explode()
	#cause physics explosion
	#process_mode = Node.PROCESS_MODE_DISABLED
	
func _on_destroy_timer_timeout():
	#print("destroy")
	queue_free()
	

