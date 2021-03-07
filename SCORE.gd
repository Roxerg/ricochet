extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0
var timer;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout2") 
	timer.set_wait_time(1)
	
	add_child(timer) #to process
	timer.start() #to start


func _on_timer_timeout2():
   pointeroo()



func pointeroo():
	score += 1
	self.text = str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
