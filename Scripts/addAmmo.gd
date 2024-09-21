extends Area2D
@onready var add_ammo = $".."
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"
@onready var collision_shape_2d = $CollisionShape2D
var addAmount := 10

func _on_body_entered(body):
	if body.is_in_group("players"):
		body.ammo += addAmount
		body.maxAmmo += addAmount
		body.ammo_bar.max_value += addAmount
		
			
		body.power_up_effect.show()
		body.power_up_effect_2.show()
		if body.power_up.is_stopped():
			body.power_up.start()
		body.power_up_sfx.play()

		add_ammo.queue_free()
