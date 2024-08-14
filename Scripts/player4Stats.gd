extends Label
@onready var moon_station = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "p4Speed = " + str(GameManager.player4Speed) + "\np4Damage= " + str(GameManager.player4Damage) + "\np4Points = " + str(moon_station.player4Points)
