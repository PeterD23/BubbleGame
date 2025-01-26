extends CharacterBody3D

@onready var goddess := $Goddess

var rng = RandomNumberGenerator.new()
var bubble = preload("res://bad_bubble.tscn")
var timecounter = 0
var bubblepool = []
var poolcounter = 0
var poolsize = 400

func _process(delta):
	timecounter += delta
	if timecounter >= 0.15:
		if bubblepool.size() < poolsize:
			var badbubble = bubble.instantiate()
			#badbubble.position = goddess.gwlobal_position
			badbubble.position.z += 1
			badbubble.position.x += randf_range(-10, 10)
			badbubble.linear_velocity = Vector3(0, randf_range(0.2, -5), randf_range(-1, -25))
			add_child(badbubble)
			bubblepool.push_back(badbubble)	
		if bubblepool.size() >= poolsize:
			print("movingbubble")
			bubblepool[poolcounter].position = get_parent().global_position
			bubblepool[poolcounter].position.z += 1
			bubblepool[poolcounter].position.x += randf_range(-10, 10)
			bubblepool[poolcounter].linear_velocity = Vector3(0, randf_range(0.2, -5), randf_range(-1, -25))
			poolcounter += 1
			if poolcounter >= poolsize:
				poolcounter = 0
		timecounter = 0
