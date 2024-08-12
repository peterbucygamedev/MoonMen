extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "player1 speed = " + str(GameManager.player1Speed) + "\nplayer1 damage= " + str(GameManager.player1Damage) + "\nplayer1 points = " + str(moon_station.player1Points)
