extends StaticBody2D
@onready var right = $right
@onready var left = $left

var direction = 1
var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if right.is_colliding():
		direction = -1

	if left.is_colliding():
		direction = 1
	
	print("right colliding", right.is_colliding())
	print("left colliding", left.is_colliding())
		
	position.x += direction * speed * delta
