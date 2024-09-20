extends Area2D
@onready var add_damage = $".."

func _on_body_entered(body):
		if body.is_in_group("players"):
			body.damage += 1
		add_damage.queue_free()
