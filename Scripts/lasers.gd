extends Node2D
const LASER = preload("res://Scenes/abilities/laser.tscn")
var laserArray := []
var bounces = 2
var totalLasers := 0
var lastLaser = null
var currentLaser = null
var objectCollided = null

func _ready():
	laserArray.append(LASER.instantiate())
	add_child(laserArray[totalLasers])
	laserArray[totalLasers].rotation = 0
	totalLasers = laserArray.size()
	lastLaser = laserArray[totalLasers - 1]
	
func _process(delta):
	lastLaser = laserArray[totalLasers - 1]
	
	if laserArray.size() < bounces:
		if lastLaser.is_colliding():
			bounces += 1
			laserArray.append(LASER.instantiate())
			#print("total lasers ", totalLasers, "laser array", laserArray.size())
			add_child(laserArray[totalLasers])
			var currentLaser = laserArray[totalLasers]
			var objectCollided = lastLaser.target_position.normalized()
			currentLaser.global_position = lastLaser.get_collision_point()
			currentLaser.global_rotation = objectCollided.bounce(lastLaser.get_collision_normal()).angle()
			totalLasers += 1
		
		if !lastLaser.is_colliding():
			pass
		

		
	
	
