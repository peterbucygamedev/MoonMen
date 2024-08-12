extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "player2 speed = " + str(GameManager.player2Speed) + "\nplayer2 damage= " + str(GameManager.player2Damage) + "\nplayer2 points = " + str(moon_station.player2Points)
