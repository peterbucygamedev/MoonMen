extends Control
var player = preload("res://Scenes/player.tscn")
var bullet = preload("res://Scenes/bullet.tscn")
var devices := []
@onready var spawn = $spawn



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	devices = Input.get_connected_joypads()
	#print (devices)
	
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

func _on_start_button_up():
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
		
		
