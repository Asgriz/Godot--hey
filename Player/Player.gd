extends CharacterBody2D

var health = 10
const SPEED = 260.0
const JUMP_VELOCITY = -400.0
var fireballOnCD = false
const Fireball = preload("res://fireballtest.tscn")


#const declares that the value can not be changed during activation
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $AnimationPlayer
@onready var FireCD = $Timer

#Delta = repeat
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY	
		anim.play("Jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	print(direction)
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
			
		
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
		if velocity.y == 0:
			anim.play("Idle")
		if velocity.y > 0:
			anim.play("Fall")
	move_and_slide()
	fire()

func fire():
	if fireballOnCD == false:
		if Input.is_action_just_pressed("attack"):
			FireCD.start()
			var direction = 1 if not $AnimatedSprite2D.flip_h else -1 
			var f = Fireball.instantiate()
			f.direction = direction
			get_parent().add_child(f)
			f.position.y = position.y
			f.position.x = position.x + 25 * direction
			fireballOnCD = true

	if health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
	


	



func _on_timer_timeout():
	fireballOnCD = false
