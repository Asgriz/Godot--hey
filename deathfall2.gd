extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		body.health <= 0
		queue_free()
		get_tree().change_scene_to_file("res://lvl_2_main.tscn")
	
