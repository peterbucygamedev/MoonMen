extends Control
const MOON_SLAYER = preload("res://Scenes/moon_slayer.tscn")
var player = preload("res://Scenes/player.tscn")
var getPlayerNumber = 0
@onready var respawn_timer = $respawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.allowDevice0:
		var p0 = player.instantiate()
		p0.playerNumber = 0
		add_child(p0)
		p0.transform = $spawn.transform
		GameManager.allowDevice0 = false
		p0.set_owner($".")
		p0.startingTransform = $spawn.transform
	
		
	if GameManager.allowDevice1:
		var p1 = player.instantiate()
		p1.playerNumber = 1
		add_child(p1)
		p1.transform = $spawn2.transform
		GameManager.allowDevice1 = false
		p1.set_owner($".")
		p1.startingTransform = $spawn2.transform

		
	if GameManager.allowDevice2:
		var p2 = player.instantiate()
		p2.playerNumber = 2
		add_child(p2)
		p2.transform = $spawn3.transform
		GameManager.allowDevice2 = false
		p2.set_owner($".")
		p2.startingTransform = $spawn3.transform

		
	if GameManager.allowDevice3:
		var p3 = player.instantiate()
		p3.playerNumber = 3
		add_child(p3)
		p3.transform = $spawn4.transform
		GameManager.allowDevice3 = false
		p3.set_owner($".")
		p3.startingTransform = $spawn4.transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(GameManager.numberOfPlayers)
	print(GameManager.allowDevice0)
	print(GameManager.allowDevice1)
	print(GameManager.allowDevice2)
	print(GameManager.allowDevice3)
	
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		"""if numberOfPlayers >= 0:
			numberOfPlayers += 1
		if numberOfPlayers >= 4:"""
		get_tree().change_scene_to_file("res://Scenes/moon_slayer.tscn")

func _on_area_2d_body_exited(body):
	pass


func _on_respawn_timer_timeout():
	pass
