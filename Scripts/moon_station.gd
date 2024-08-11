extends Node2D
const MAIN_MENU = preload("res://Scenes/main_menu.tscn")
var player1Points = 4
var player2Points = 4
var player3Points = 4
var player4Points = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("player1speed = ", GameManager.player1Speed)
	#print("player2speed = ", GameManager.player2Speed)
	#print("player3speed = ", GameManager.player3Speed)
	#print("player4speed = ", GameManager.player4Speed)
	#print("player1speed = ", GameManager.player1Damage)
	#print("player2speed = ", GameManager.player2Damage)
	#print("player3speed = ", GameManager.player3Damage)
	#print("player4speed = ", GameManager.player4Damage)
	pass


func _on_add_speed_area_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0 and player1Points > 0:
			if body.select == true:
				GameManager.player1Speed += 100
				player1Points -= 1

		
		if body.playerNumber == 1 and player2Points > 0:
			GameManager.player2Speed += 100
			player2Points -= 1
			
		if body.playerNumber == 2 and player3Points > 0:
			GameManager.player3Speed += 100
			player3Points -= 1
			
		if body.playerNumber == 3 and player4Points > 0:
			GameManager.player4Speed += 100
			player4Points -= 1
			

	


func _on_add_damage_area_body_entered(body):
	if body.is_in_group("players"):
		if body.playerNumber == 0 and player1Points > 0:
			GameManager.player1Damage += 100
			player1Points -= 1

		
		if body.playerNumber == 1 and player2Points > 0:
			GameManager.player1Damage += 100
			player2Points -= 1
			
		if body.playerNumber == 2 and player3Points > 0:
			GameManager.player1Damage += 100
			player3Points -= 1
			
		if body.playerNumber == 3 and player4Points > 0:
			GameManager.player1Damage += 100
			player4Points -= 1



func _on_next_level_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
