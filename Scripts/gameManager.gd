extends Node

var player1Speed = 100
var player1Damage = 10
var player1Health = 100
var player1Ammo = 100
var player2Speed = 100
var player2Damage = 10
var player2Health = 100
var player2Ammo = 100
var player3Speed = 100
var player3Damage = 10
var player3Health = 100
var player3Ammo = 100
var player4Speed = 100
var player4Damage = 10
var player4Health = 100
var player4Ammo = 100
var deaths = 0
var nextLevel = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		var devices = Input.get_connected_joypads()
		#print(devices)
		
		if deaths >= devices.size() -1:
			nextLevel = true
			#print("yay")
			
		#print(deaths)
		#print(devices.size())
		
