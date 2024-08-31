extends Node
var player = preload("res://Scenes/player.tscn")
var bullet = preload("res://Scenes/bullet.tscn")
const MOON_SLAYER_SECRET = preload("res://Scenes/moon_slayer_secret.tscn")

var devices := []
@onready var spawn = $spawn
@onready var point_light_2d = $Area2D/Sprite2D/PointLight2D
@onready var area_2d = $Area2D
var loadLevel := false
var playersInArea := []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	point_light_2d.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	devices = Input.get_connected_joypads()
	#print (devices)
	
	if area_2d.has_overlapping_bodies():
		point_light_2d.show()
	else:
		point_light_2d.hide()
		
	print(loadLevel)
		
		
	
		
	if Input.is_joy_button_pressed(0, 0) and GameManager.allowDevice0:
		var p0 = player.instantiate()
		p0.playerNumber = 0
		add_child(p0)
		p0.transform = $spawn.transform
		GameManager.allowDevice0 = false
		p0.set_owner($".")
		GameManager.numberOfPlayers += 1
		p0.startingTransform = $spawn.transform
		p0.lives = 1000
		
	if Input.is_joy_button_pressed(1, 0) and GameManager.allowDevice1:
		var p1 = player.instantiate()
		p1.playerNumber = 1
		add_child(p1)
		p1.transform = $spawn.transform
		GameManager.allowDevice1 = false
		p1.set_owner($".")
		GameManager.numberOfPlayers += 1
		p1.startingTransform = $spawn.transform
		p1.lives = 1000
		
	if Input.is_joy_button_pressed(2, 0) and GameManager.allowDevice2:
		var p2 = player.instantiate()
		p2.playerNumber = 2
		add_child(p2)
		p2.transform = $spawn.transform
		GameManager.allowDevice2 = false
		p2.set_owner($".")
		GameManager.numberOfPlayers += 1
		p2.startingTransform = $spawn.transform
		p2.lives = 1000
		
	if Input.is_joy_button_pressed(3, 0) and GameManager.allowDevice4:
		var p3 = player.instantiate()
		p3.playerNumber = 3
		add_child(p3)
		p3.transform = $spawn.transform
		GameManager.allowDevice3 = false
		p3.set_owner($".")
		GameManager.numberOfPlayers += 1
		p3.startingTransform = $spawn.transform
		p3.lives = 1000
		
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
	if GameManager.numberOfPlayers >= 1:
		GameManager.allowDevice0 = true
	else:
		GameManager.allowDevice0 = false
	
	if GameManager.numberOfPlayers >= 2:
		GameManager.allowDevice1 = true
	else:
		GameManager.allowDevice1 = false
		
	if GameManager.numberOfPlayers >= 3:
		GameManager.allowDevice2 = true
	else:
		GameManager.allowDevice2 = false
	
	if GameManager.numberOfPlayers >= 4:
		GameManager.allowDevice3 = true
	else:
		GameManager.allowDevice3 = false
	
	if loadLevel:
		get_tree().change_scene_to_file("res://Scenes/moon_slayer_secret.tscn")


func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		loadLevel = true
		playersInArea.append(body)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("players"):
		playersInArea.erase(body)
		if playersInArea.size() <= 0:
			loadLevel = false
	pass # Replace with function body.
