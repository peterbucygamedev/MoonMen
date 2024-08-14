extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "p2Speed = " + str(GameManager.player2Speed) + "\np2Damage= " + str(GameManager.player2Damage) + "\np2Points = " + str(moon_station.player2Points)
