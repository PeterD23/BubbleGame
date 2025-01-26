extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Collision detection code
#PLAYER MUST BE ADDED TO GROUP "Player" FOR THIS TO WORK!! (character added currently)
func _on_body_entered(body):
	print("Check 1 - Collision")
	if body.is_in_group("Player"):
		print("Check 2")
		#body.game_over
		get_tree().quit()
