extends StaticBody2D
@onready var energy_sprite = $energyShieldCollider/energySprite
@onready var shield_timer = $shieldTimer
var shieldEnabled = true
var shieldNumber = 0

var health := 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 3:
		energy_sprite.play("shield")
	elif health == 2:
		energy_sprite.play("shield2")
	elif health == 1:
		energy_sprite.play("shield3")
	elif health <= 0:
		if shield_timer.is_stopped():
			shield_timer.start()
		shieldEnabled = false
		
	
func _on_shield_timer_timeout():
	health = 3
	shieldEnabled = true
	
