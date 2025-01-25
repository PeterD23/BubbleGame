extends Camera3D

@onready var neck := $playercamera

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#func _input(event):
	#if event is InputEventMouseMotion:
		#if Input.MOUSE_MODE_CAPTURED:
			#rotate_y(-event.relative.x*0.005)
			#rotate_x(-event.relative.y*0.005)
	#if event is InputEventMouseButton:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#if event is InputEventMouseButton and Input.MOUSE_MODE_CAPTURED:
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

#var rot_x = 0
#var rot_y = 0
#
#func _input(event):
	#if event is InputEventMouseMotion and event.button_mask & 1:
		## modify accumulated mouse rotation
		#rot_x += event.relative.x * 0.005
		#rot_y += event.relative.y * 0.005
		#transform.basis = Basis() # reset rotation
		#rotate_object_local(Vector3(0, 1, 0), rot_x) # first rotate in Y
		#rotate_object_local(Vector3(1, 0, 0), rot_y) # then rotate in X
		#
