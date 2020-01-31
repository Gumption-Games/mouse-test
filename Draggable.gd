class_name Draggable extends Sprite

export var enable : bool = false

var dragging : bool = false
var click_radius : int = 40  # Size of the sprite

func _input(event):
	if not enable:
		self.hide()
		return
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if (event.position - self.position).length() < click_radius:
            # Start dragging if the click is on the sprite.
			if !dragging and event.pressed:
				dragging = true
        # Stop dragging if the button is released.
		if dragging and !event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
        # While dragging, move the sprite with the mouse.
		self.position = event.position