extends Area3D

@onready var goddess := $"../Goddess"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		goddess.position = Vector3(7, 77, 266)
		goddess.stop_bubbles()
