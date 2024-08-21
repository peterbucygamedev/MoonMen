extends Control
var numberOfPlayers = 0
const MOON_SLAYER = preload("res://Scenes/moon_slayer.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(numberOfPlayers)


func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		"""if numberOfPlayers >= 0:
			numberOfPlayers += 1
		if numberOfPlayers >= 4:"""
		get_tree().change_scene_to_file("res://Scenes/moon_slayer.tscn")

func _on_area_2d_body_exited(body):
	numberOfPlayers -= 1
