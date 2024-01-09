extends ParallaxBackground


var scrolling_speed = 100

func _process(delta): #goesforever #delta goes each frame
	scroll_offset.x -= scrolling_speed * delta
