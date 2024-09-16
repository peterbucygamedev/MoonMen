extends VBoxContainer
@onready var resume = $resume
@onready var exit = $exit

func _ready():
	exit.grab_focus()
