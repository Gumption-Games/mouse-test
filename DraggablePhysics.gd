class_name DraggablePhysics extends RigidBody2D

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
				self.mode = RigidBody2D.MODE_STATIC
        # Stop dragging if the button is released.
		if dragging and !event.pressed:
			dragging = false
			self.mode = RigidBody2D.MODE_RIGID
			self.apply_central_impulse(Input.get_last_mouse_speed())

	if event is InputEventMouseMotion and dragging:
        # While dragging, move the sprite with the mouse.
		self.position = event.position