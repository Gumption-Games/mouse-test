class_name Swipe extends CanvasItem

signal swipe

var swipe_start = null
var minimum_drag : float = 100.0

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		swipe_start = get_global_mouse_position()
	if event.is_action_released("click"):
		_calculate_swipe(get_global_mouse_position())
        
func _calculate_swipe(swipe_end):
	if swipe_start == null:
		return
	var swipe : Vector2 = swipe_end - swipe_start
	print(swipe)
	if abs(swipe.x) > minimum_drag and abs(swipe.x) > abs(swipe.y):
		if swipe.x > 0.0:
			emit_signal("swipe", "right")
		else:
			emit_signal("swipe", "left")
	elif abs(swipe.y) > minimum_drag and abs(swipe.y) > abs(swipe.x):
		if swipe.y > 0.0: 
			emit_signal("swipe", "down")
		else:
			emit_signal("swipe", "up")

