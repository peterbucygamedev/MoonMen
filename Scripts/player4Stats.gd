extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "player4 speed = " + str(GameManager.player4Speed) + "\nplayer4 damage= " + str(GameManager.player4Damage) + "\nplayer4 points = " + str(moon_station.player4Points)
