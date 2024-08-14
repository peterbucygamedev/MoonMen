extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "p3Speed = " + str(GameManager.player3Speed) + "\np3Damage= " + str(GameManager.player3Damage) + "\np3Points = " + str(moon_station.player3Points)
