extends Node2D
var player1Points = 4
var player2Points = 4
var player3Points = 4
var player4Points = 4
var player1StartingSpeed
var player2StartingSpeed
var player3StartingSpeed
var player4StartingSpeed
var player1StartingDamage
var player2StartingDamage
var player3StartingDamage
var player4StartingDamage
@onready var next_level = $Label/nextLevel
var statsUpdated = false
var numberOfPlayers = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player1StartingSpeed = GameManager.player1Speed
	player2StartingSpeed = GameManager.player2Speed
	player3StartingSpeed = GameManager.player3Speed
	player4StartingSpeed = GameManager.player4Speed
	player1StartingDamage = GameManager.player1Damage
	player2StartingDamage = GameManager.player2Damage
	player3StartingDamage = GameManager.player3Damage
	player4StartingDamage = GameManager.player4Damage

func _process(delta):
	#0print(numberOfPlayers)
	pass


func _on_add_speed_area_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0 and player1Points > 0:
				GameManager.player1Speed += 200
				player1Points -= 1

		if body.playerNumber == 1 and player2Points > 0:
				GameManager.player2Speed += 200
				player2Points -= 1
			
		if body.playerNumber == 2 and player3Points > 0:
				GameManager.player3Speed += 200
				player3Points -= 1
			
		if body.playerNumber == 3 and player4Points > 0:
				GameManager.player4Speed += 200
				player4Points -= 1
			


func _on_add_damage_area_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0 and player1Points > 0:
				GameManager.player1Damage += 1
				player1Points -= 1

		if body.playerNumber == 1 and player2Points > 0:
				GameManager.player2Damage += 1
				player2Points -= 1
			
		if body.playerNumber == 2 and player3Points > 0:
				GameManager.player3Damage += 1
				player3Points -= 1
			
		if body.playerNumber == 3 and player4Points > 0:
				GameManager.player4Damage += 1
				player4Points -= 1
		
func _on_subtract_speed_area_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0 and player1Points < 4:
			if GameManager.player1Speed > player1StartingSpeed:
				GameManager.player1Speed -= 200
				player1Points += 1

		if body.playerNumber == 1 and player2Points < 4:
			if GameManager.player2Speed > player2StartingSpeed:
				GameManager.player2Speed -= 200
				player2Points += 1
			
		if body.playerNumber == 2 and player3Points < 4:
			if GameManager.player3Speed > player3StartingSpeed:
				GameManager.player3Speed -= 200
				player3Points += 1
			
		if body.playerNumber == 3 and player4Points < 4:
			if GameManager.player4Speed > player4StartingSpeed:
				GameManager.player4Speed -= 200
				player4Points += 1


func _on_subtract_damage_area_body_entered(body):
	if body.is_in_group("players"):
		if body.Input.is_joy_button_pressed(body.playerNumber, 0):
			if body.playerNumber == 0 and player1Points < 4:
				if GameManager.player1Damage > player1StartingDamage:
					GameManager.player1Damage -= 1
					player1Points += 1

		
		if body.playerNumber == 1 and player2Points < 4:
			if GameManager.player2Damage > player2StartingDamage:
				GameManager.player2Damage -= 1
				player2Points += 1
			
		if body.playerNumber == 2 and player3Points < 4:
			if GameManager.player3Damage > player3StartingDamage:
				GameManager.player3Damage -= 1
				player3Points += 1
			
		if body.playerNumber == 3 and player4Points < 4:
			if GameManager.player4Damage > player4StartingDamage:
				GameManager.player4Damage -= 1
				player4Points += 1


func _on_next_level_body_entered(body):
	if body.is_in_group("players"):
		"""if numberOfPlayers >= 0:
			numberOfPlayers += 1
		if numberOfPlayers >= 4:"""
		get_tree().change_scene_to_file("res://Scenes/moon_level.tscn")


func _on_next_level_body_exited(body):
	if body.is_in_group("players"):
		numberOfPlayers -= 1
