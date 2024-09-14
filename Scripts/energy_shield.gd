extends StaticBody2D
@onready var energy_sprite = $energyShieldCollider/energySprite
@onready var shield_timer = $shieldTimer
@onready var damage_shield_timer = $damageShieldTimer


var shieldEnabled = true
var shieldNumber = 0
var health : float = 20
var maxHealth : float = 20
var damageShield := true

@onready var shield = $shield
@onready var shield_2 = $shield2
@onready var shield_3 = $shield3

# Called when the node enters the scene tree for the first time.
func _ready():
	shield.show()
	shield_2.hide()
	shield_3.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	"""if ((health/maxHealth) * 100)  < 20:
		#energy_sprite.play("shield")
		pass
	elif health == 2:
		#energy_sprite.play("shield2")
		pass
	elif health == 1:
		#energy_sprite.play("shield3")
		pass
	elif health <= 0:
		if shield_timer.is_stopped():
			shield_timer.start()
		shieldEnabled = false"""
	var percentage : float = ((health/maxHealth) * 100)
	print("percentage = ", percentage)
	if percentage >= 70:
		shield.show()
		shield_2.hide()
		shield_3.hide()
		
	elif percentage < 70 and percentage > 40:
		shield.hide()
		shield_2.show()
		shield_3.hide()
		
	elif percentage <= 40:
		shield.hide()
		shield_2.hide()
		shield_3.show()
		
	if health < maxHealth:
		if shield_timer.is_stopped():
			shield_timer.start()
			
	if health <= 0:
		shieldEnabled = false
		
	
func _on_shield_timer_timeout():
	health = maxHealth
	shieldEnabled = true
	


func _on_damage_shield_timer_timeout():
	damageShield = true
