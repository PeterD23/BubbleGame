extends Node3D

@onready var particle_emitter := $UnaliveBubbles
@onready var armature := $Armature

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unalive():
	set_physics_process(false)
	armature.queue_free()
	particle_emitter.set_emitting(true)
