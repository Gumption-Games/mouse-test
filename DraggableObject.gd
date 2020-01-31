extends Area2D

export var enable : bool = false

var dragging : bool = false

# Called when input occurs AND mouse is within object's CollisionShape2D
func _on_DraggableObject_input_event(viewport, event, shape_idx):
	if not enable:
		self.hide()
		return
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT):
		dragging = event.pressed

# Taken from:
# https://godotengine.org/qa/41946/drag-and-drop-a-sprite-is-there-a-built-in-function-for-a-node
# 2020-01-30
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and dragging:
		position = get_global_mouse_position()