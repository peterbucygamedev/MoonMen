extends Button
const MOON_SLAYER = preload("res://Scenes/levels/moon_slayer.tscn")
func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels/moon_slayer.tscn")
