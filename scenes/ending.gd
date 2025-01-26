extends Area3D

@onready var goddess := $"/root/Node3D/Goddess"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		goddess.apply_force(Vector3(0,0,100))
		goddess.get_node("Camera").set_current(true)
		var animationPlayer = goddess.get_node("AnimationPlayer")
		var anim : Animation= animationPlayer.get_animation("MaddestFlap")
		anim.loop_mode =(Animation.LOOP_LINEAR)
		animationPlayer.play("MaddestFlap")
		pass # Replace with function body.
