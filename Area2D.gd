extends Area2D
#Deathfall
var health = 10


func _on_body_entered(body):
	if body.name == "Player":
		body.health <= 0
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
	
#Respawns player if contacted with object
#queue_free() marks the node for removal
#engine deletes it during the next processing cycle. 
#gives access to selected nodes and functions
