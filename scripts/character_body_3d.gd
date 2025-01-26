extends CharacterBody3D


const SPEED = 20.0
const JUMP_VELOCITY = 10.5

@onready var camera := $camerapoint
@onready var bubble_man := $"camerapoint/BubbleMan"
@onready var particle_emitter := $"camerapoint/UnaliveBubbles"
@onready var footsteps := $"camerapoint/BubbleMan/Footsteps"
@onready var jump := $"camerapoint/BubbleMan/Jump"
@onready var unalived := $"Unalive"
@onready var pop := $"Pop"

var timer:Timer

func _process(delta):
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play(0.26)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if not footsteps.is_playing() and is_on_floor():
			footsteps.play()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseMotion:
		if Input.MOUSE_MODE_CAPTURED:
			rotate_y(-event.relative.x*0.005)
			camera.rotate_x(-event.relative.y*0.005)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(20))
	if event is InputEventKey and event.is_action_pressed("lock_mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	
func _on_timer_timeout():
	get_tree().quit()
	
func unalive():
	if not bubble_man.is_visible():
		return
	pop.play()
	unalived.play()
	bubble_man.set_visible(false)
	particle_emitter.set_emitting(true)
	start_timer()
	
func start_timer():
	timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(1.0)
	set_physics_process(false)
	timer.set_one_shot(true)
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
