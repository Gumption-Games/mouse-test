class_name Bowl extends Area2D

onready var top : Area2D = $Top # Equivalent to Line 4
onready var right : Area2D = get_node("Right")
onready var bottom : Area2D = $Bottom
onready var left : Area2D = $Left

onready var areas := [top, right, bottom, left]
var last = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Top_mouse_entered():
	on_area_entered()

func _on_Right_mouse_entered():
	on_area_entered()

func _on_Bottom_mouse_entered():
	on_area_entered()

func _on_Left_mouse_entered():
	on_area_entered()

func on_area_entered():
	print("Entered")
	#if last == null:
	#	last = entered_node