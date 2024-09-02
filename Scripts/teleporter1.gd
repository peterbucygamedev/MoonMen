extends Area2D
@onready var t_2_marker_2d = $"../teleporter2/t2Marker2D"


func _on_body_entered(body):
	if body.is_in_group("players") and body.velocity.y >= 0:
		body.position = Vector2(t_2_marker_2d.global_position.x, t_2_marker_2d.global_position.y)
