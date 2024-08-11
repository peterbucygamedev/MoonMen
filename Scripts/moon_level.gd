extends Node
const MOON_STATION = preload("res://Scenes/moon_station.tscn")
@onready var player = $player
@onready var player_2 = $player2
var GAME_MANAGER = preload("res://Scenes/game_manager.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_next_level_area_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/moon_station.tscn")


func _on_next_level_pressed():
	get_tree().change_scene_to_file("res://Scenes/moon_station.tscn")
