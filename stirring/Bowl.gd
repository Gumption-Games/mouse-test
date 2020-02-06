class_name Bowl extends Area2D

onready var top : Area2D = $Top # Equivalent to Line 4
onready var right : Area2D = get_node("Right")
onready var bottom : Area2D = $Bottom
onready var left : Area2D = $Left

onready var areas := [top, right, bottom, left]

var loop = []
const k = 4
var max_value = pow(2, k) - 1
enum {TOP=1, RIGHT=2, BOTTOM=4, LEFT=8} 
const clockwise = [[1, 2, 4, 8], [2, 4, 8, 1], [4, 8, 1, 2], [8, 1, 2, 4]]
const counter_clockwise = [[1, 8, 4, 2], [8, 4, 2, 1], [4, 2, 1, 8], [2, 1, 8, 4]]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Top_mouse_entered():
	on_area_entered(TOP)

func _on_Right_mouse_entered():
	on_area_entered(RIGHT)

func _on_Bottom_mouse_entered():
	on_area_entered(BOTTOM)

func _on_Left_mouse_entered():
	on_area_entered(LEFT)

func _sum(array):
	var sum = 0
	for i in array:
		sum += i
	return sum

func _clockwise(array):
	for combo in clockwise:
		if combo == array:
			print("Clockwise")
			
func _counter_clockwise(array):
	for combo in counter_clockwise:
		if combo == array:
			print("Counter Clockwise")

func on_area_entered(pos):
	loop.append(pos)
	if loop.size() == k:
		if _sum(loop) == max_value:
			_clockwise(loop)
			_counter_clockwise(loop) 
			loop.clear()
		else:
			loop.clear()