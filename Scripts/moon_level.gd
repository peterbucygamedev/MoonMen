extends Node

@onready var player = $player
@onready var player_2 = $player2
var GAME_MANAGER = preload("res://Scenes/game_manager.tscn")
const MARS = preload("res://Scenes/mars.tscn")
@onready var level_2 = $"level 2"

# Called when the node enters the scene tree for the first time.
func _ready():
	#level_2.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if GameManager.deaths >= 4:
	#	level_2.show()
	pass


func _on_next_level_area_body_entered(body):
	#if GameManager.deaths >= 4:
	get_tree().change_scene_to_file("res://Scenes/mars.tscn")
