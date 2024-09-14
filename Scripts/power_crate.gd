extends RigidBody2D
var counter = 0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var detontate_timer = $detontateTimer
@onready var power_crate_detonation = $powerCrateDetonation
@onready var reset_timer = $resetTimer
@onready var power_crate_collider = $powerCrateCollider
@onready var explosion_area = $explosionArea
@onready var explosion_collider = $explosionArea/explosionCollider



var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	power_crate_detonation.emitting = false
	explosion_collider.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(counter)
	if counter == 0:
		animated_sprite_2d.play("0")
	if counter == 1:
		animated_sprite_2d.play("1")
	if counter == 2:
		animated_sprite_2d.play("2")
	if counter == 3:
		animated_sprite_2d.play("3")
	if counter == 4:
		animated_sprite_2d.play("4")
	if counter == 5:
		animated_sprite_2d.play("5")
	if counter == 6:
		animated_sprite_2d.play("6")
	if counter >= 7:
		animated_sprite_2d.play("detonate")
		if detontate_timer.is_stopped() and reset_timer.is_stopped():
			detontate_timer.start()
			reset_timer.start()
			
	print(counter)

func _on_area_2d_body_entered(body):
	counter += 1
	
func _on_detontate_timer_timeout():
	#Engine.time_scale = 1
	#power_crate_collider.disabled = true
	#animated_sprite_2d.hide()
	explosion_collider.disabled = false
	explosion_area.explode()
	power_crate_detonation.restart()
	power_crate_detonation.emitting = true
	#cause physics explosion
	#process_mode = Node.PROCESS_MODE_DISABLED
	
func _on_reset_timer_timeout():
	#queue_free()
	counter = 0
	power_crate_detonation.emitting = false
	explosion_collider.disabled = true

func _on_explosion_area_body_entered(body):
	if body is RigidBody2D:
			print("found rigidBody")
			var force = (body.global_position - global_position).normalized()
			force *= 200
			body.apply_central_impulse(force)
			
	if body.is_in_group("players"):
		print("found player")
		body.health -= 10
		body.health_bar.show()
		if body.health_bar_timer.is_stopped():
			body.health_bar_timer.start()
