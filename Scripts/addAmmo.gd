extends Area2D
@onready var add_ammo = $".."

func _on_body_entered(body):
	if body.is_in_group("players"):
		body.ammo += 10
		body.maxAmmo += 10
	add_ammo.queue_free()
