extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 300
const GRAVITY = 0
const JUMPFORCE = -900
var points = 0

# moving
func _physics_process(_delta):
	if Input.is_action_pressed("jump"):
		# if not is_on_floor -> eingebaut in Godot oder in smolpudie definiert?
		velocity.x = SPEED
		$player.play("jump")
	else:
		$player.play("run")
		
	# falling speeds up over time
	velocity.y = velocity.y + GRAVITY
		
	# is_on_floor has no direction, needs Vector2.UP as direction
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		
		
	# velo = return value of move_and_slide, .UP as floor direction to enable jumping
	velocity = move_and_slide(velocity,Vector2.UP)
	
	# slow down from velo.x to 0
	velocity.x = lerp(velocity.x,0,0.1)

# when body enters fallzone, respawn at start.  
# warning-ignore:unused_argument
func _on_Fallzone_body_entered(body):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://start.tscn")
