extends Area2D
@onready var add_ammo = $".."
@onready var audio_stream_player_2d = $"../AudioStreamPlayer2D"
@onready var collision_shape_2d = $CollisionShape2D


func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0:
			body.p1MaxAmmo += 10
			body.p1Ammo = body.p1MaxAmmo
			body.ammo_bar.max_value += 10
			
		if body.playerNumber == 1:
			body.p2MaxAmmo += 10
			body.p2Ammo = body.p2MaxAmmo
			body.ammo_bar.max_value += 10
			
		if body.playerNumber == 2:
			body.p3MaxAmmo += 10
			body.p3Ammo = body.p3MaxAmmo
			body.ammo_bar.max_value += 10
			
		if body.playerNumber == 3:
			body.p4MaxAmmo += 10
			body.p4Ammo = body.p4MaxAmmo
			body.ammo_bar.max_value += 10
			
		body.power_up_effect.show()
		body.power_up_effect_2.show()
		if body.power_up.is_stopped():
			body.power_up.start()
		body.power_up_sfx.play()

		add_ammo.queue_free()
