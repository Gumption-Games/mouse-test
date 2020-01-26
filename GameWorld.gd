class_name GameWorld extends Node2D

var held_object = null

func _ready():
	for node in get_tree().get_nodes_in_group("pickable"):
		node.connect("clicked", self, "_on_pickable_clicked")

func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			print(Input.get_last_mouse_speed())
			var clamped : Vector2 = Vector2(
				clamp(Input.get_last_mouse_speed().x, -100, 100),
				clamp(Input.get_last_mouse_speed().y, -100, 100)
			)
			held_object.drop(clamped)
			held_object = null