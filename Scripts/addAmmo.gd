extends Area2D
@onready var add_ammo = $".."

func _on_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0:
			body.p1MaxAmmo += 10
			body.p1Ammo = body.p1MaxAmmo
			
		if body.playerNumber == 1:
			body.p2MaxAmmo += 10
			body.p2Ammo = body.p2MaxAmmo
			
		if body.playerNumber == 2:
			body.p3MaxAmmo += 10
			body.p3Ammo = body.p3MaxAmmo
			
		if body.playerNumber == 3:
			body.p4MaxAmmo += 10
			body.p4Ammo = body.p4MaxAmmo
		add_ammo.queue_free()
