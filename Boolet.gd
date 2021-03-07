extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
var direction = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	print(rotation)
	pass # Replace with function body.

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("EEEE")
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		move_and_collide(reflect)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
