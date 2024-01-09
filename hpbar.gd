extends ProgressBar

var health = 10



func update():
	get_node("../../Player/Player").health
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	"HP:" + str(get_node("../../Player/Player").health)
	
