extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "p1Speed = " + str(GameManager.player1Speed) + "\np1Damage= " + str(GameManager.player1Damage) + "\np1Points = " + str(moon_station.player1Points)
