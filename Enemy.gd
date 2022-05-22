extends Node2D

var speed = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	#spawn enemies on right side of visible screen
	$Floorchecker.position.x = $CollisionShape2D.shape.get_extents().x
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#wert anpassen, kann evtl. falschrum sein
	move_local_x(speed)
	pass
