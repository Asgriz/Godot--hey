extends Node2D



func _on_enterlvl_2_pressed():
	get_tree().change_scene_to_file("res://world_2.tscn")
	$lvl2mainmusic.stop


func _on_returnlvl_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	


func _on_quit_pressed():
	get_tree().quit()
