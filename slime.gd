extends CharacterBody2D
var SPEED = 30
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Player
var chase = false
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
func _physics_process(delta):
	#gravity for yeti
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation !="Death":
			get_node("AnimatedSprite2D").play("Walk")
		Player = get_parent().get_parent().find_child("Player")
		
		var direction = (Player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation !="Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()
	
func _on_player_detection_body_entered(body):
		if body.name == "Player":
			chase = true
 


func _on_player_detection_body_shape_exited(body):
	if body.name == "Player":
			chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()
func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.health -=4
		death()		
#func _on_player_detection_body_exited(body):
	#if body.name == "Player":
		#chase = true
		
func death():
		chase = false
		get_node("AnimatedSprite2D").play("Death")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()



func _on_player_death_body_shape_exited(_body):
	death()

		
	
func _on_fireball_collision_body_entered(_body):
	death()

func hurt():
	death()
