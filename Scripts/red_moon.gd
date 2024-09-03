extends Node

var player = preload("res://Scenes/player.tscn")
var bullet = preload("res://Scenes/bullet.tscn")

var devices := []
var loadLevel := false
var playersInArea := []
@onready var spawn = $spawns/spawn
@onready var spawn_2 = $spawns/spawn2
@onready var spawn_3 = $spawns/spawn3
@onready var spawn_4 = $spawns/spawn4
@onready var area_light = $Area2D/areaLight
@onready var player_light = $Area2D/areaLight/playerLight
const BLUE_MOON = preload("res://Scenes/blue_moon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	area_light.hide()
	player_light.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.numberOfPlayers <= 1:
		area_light.show()
		
	if GameManager.numberOfPlayers > 1:
		area_light.hide()
		
	"""print(GameManager.allowDevice0)
	print(GameManager.allowDevice1)
	print(GameManager.allowDevice2)
	print(GameManager.allowDevice3)"""
	devices = Input.get_connected_joypads()
	#print (devices)
	
		
	print("loadLevel = ", loadLevel)
		
		
	if Input.is_joy_button_pressed(0, 0) and GameManager.allowDevice0:
		var p0 = player.instantiate()
		p0.playerNumber = 0
		add_child(p0)
		p0.transform = spawn.transform
		p0.set_owner($".")
		p0.startingTransform = spawn.transform
		p0.lives = 3
		GameManager.allowDevice0 = false
		GameManager.numberOfPlayers += 1
		
	if Input.is_joy_button_pressed(1, 0) and GameManager.allowDevice1:
		var p1 = player.instantiate()
		p1.playerNumber = 1
		add_child(p1)
		p1.transform = spawn_2.transform
		p1.set_owner($".")
		p1.startingTransform = spawn_2.transform
		p1.lives = 3
		GameManager.allowDevice1 = false
		GameManager.numberOfPlayers += 1
		
	if Input.is_joy_button_pressed(2, 0) and GameManager.allowDevice2:
		var p2 = player.instantiate()
		p2.playerNumber = 2
		add_child(p2)
		p2.transform = spawn_3.transform
		p2.set_owner($".")
		p2.startingTransform = spawn_3.transform
		p2.lives = 3
		GameManager.allowDevice2 = false
		GameManager.numberOfPlayers += 1
		
	if Input.is_joy_button_pressed(3, 0) and GameManager.allowDevice3:
		var p3 = player.instantiate()
		p3.playerNumber = 3
		add_child(p3)
		p3.transform = spawn_4.transform
		p3.set_owner($".")
		p3.startingTransform = spawn_4.transform
		p3.lives = 3
		GameManager.allowDevice3 = false
		GameManager.numberOfPlayers += 1
		
	print(GameManager.numberOfPlayers)
	
	if Input.is_joy_button_pressed(0, 6):
		load_level()
		
	if Input.is_joy_button_pressed(1, 6):
		load_level()
		
	if Input.is_joy_button_pressed(2, 6):
		load_level()
		
	if Input.is_joy_button_pressed(3, 6):
		load_level()
		
	
func load_level():
	print("start button pressed")
	if loadLevel and GameManager.numberOfPlayers <= 1:
		print("loadLevel")
		GameManager.allowDevice0 = true
		GameManager.allowDevice1 = true
		GameManager.allowDevice2 = true
		GameManager.allowDevice3 = true
		get_tree().change_scene_to_file("res://Scenes/blue_moon.tscn")
		GameManager.numberOfPlayers = 0


func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		loadLevel = true
		playersInArea.append(body)
		player_light.show()

func _on_area_2d_body_exited(body):
	if body.is_in_group("players"):
		playersInArea.erase(body)
		if playersInArea.size() <= 0:
			loadLevel = false
			player_light.hide()
