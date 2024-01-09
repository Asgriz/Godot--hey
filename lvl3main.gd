extends Node2D


func _on_enterlvl_3_pressed():
	#TP TO WORLD 3
	get_tree().change_scene_to_file("res://world_3.tscn")
	$AudioStreamPlayer.play()


func _on_returntolvl_2_pressed():
	get_tree().change_scene_to_file("res://world_2.tscn")
	


func _on_returntolvl_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	


func _on_quit_pressed():
	get_tree().quit()
