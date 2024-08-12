extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "player3 speed = " + str(GameManager.player3Speed) + "\nplayer3 damage= " + str(GameManager.player3Damage) + "\nplayer3 points = " + str(moon_station.player3Points)
