extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_point(Vector2(10,10))
	add_point(Vector2(100,10))
	add_point(Vector2(100,-100))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
