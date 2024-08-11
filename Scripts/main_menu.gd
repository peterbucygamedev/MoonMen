extends Control
const MOON_LEVEL = preload("res://Scenes/moon_level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/moon_level.tscn")


func _on_area_2d_body_entered(body):
	if GameManager.nextLevel:
		get_tree().change_scene_to_file("res://Scenes/moon_level.tscn")

