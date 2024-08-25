extends Node2D
@onready var label = $Label
@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(timer.time_left)


func _on_timer_timeout():
	pass # Replace with function body.
