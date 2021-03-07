extends KinematicBody2D

var speed = 200
var rotation_speed = 1.5

var velocity = Vector2.ZERO
var rotation_dir = 0

var timetime = 2

var gameover = false

var bois = []

var timer;
var boolet = preload("res://boolet.tscn")
var game_over = preload("res://gameover.tscn")

func _ready():
	
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.set_wait_time(2)
	
	add_child(timer) #to process
	timer.start() #to start


func get_input():
	
	velocity = Vector2()  # The player's movement vector.
	
	if Input.is_action_pressed("up") and not gameover:
		velocity.y -= 1
	if Input.is_action_pressed("down") and not gameover:
		velocity.y += 1
	if Input.is_action_pressed("left") and not gameover:
		velocity.x -= 1
	if Input.is_action_pressed("right") and not gameover:
		velocity.x += 1
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		
	velocity = velocity.normalized() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if not gameover:
		var mouse = get_global_mouse_position()
		self.look_at(mouse)
	
	get_input()
	#velocity = move_and_slide(velocity)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var gm = game_over.instance()
		for x in bois:
			x.velocity = Vector2(0,0)
		timer.stop()
		gameover = true
		get_parent().get_node("Scory").timer.stop()
		get_owner().add_child(gm)
		
	


func _on_timer_timeout():
   shoot_boolet()
   if (timetime > 0.1):
	   timetime -= 0.01
   timer.set_wait_time(timetime)




func shoot_boolet():
	var b = boolet.instance()
	var direction = (get_global_mouse_position() - self.global_position).normalized()
	
	b.position = self.position + direction * 30
	get_owner().add_child(b)
	
	bois.append(b)
	
	b.direction = direction 
	b.velocity = direction * 200
	
