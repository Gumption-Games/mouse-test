class_name DrawingPencil extends Line2D

export var enable :bool = false

var dragging :bool = false

func _input(event):
	if not enable:
		self.hide()
		return
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if !dragging and event.pressed:
			dragging = true
			self.clear_points()
			print("Clear points")
		
        # Stop dragging if the button is released.
		if dragging and !event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
		add_point(event.position)
		print("Add point ", event.position)
		$Sprite.position = event.position