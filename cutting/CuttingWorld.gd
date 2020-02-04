extends Node2D

var CutPointScene := load("res://cutting/CutPoint.tscn")

onready var ingredient_pos : Vector2 = $Ingredient.position
onready var ingredient_size : Vector2 = $Ingredient.get_rect().size
onready var topleft := Vector2(
	ingredient_pos.x-ingredient_size.x/2, 
	ingredient_pos.y-ingredient_size.y/2
)
onready var hitarea := $HitArea
onready var hitshape := $HitArea/CollisionShape2D


export var hit_area_width := 25
export var hit_area_speed : float = 2.0
var elapsed : float = 0.0
var finished := false

func _ready():
	# Create the Cut Points
	for i in range(topleft.x+ingredient_size.x/4, topleft.x+ingredient_size.x, ingredient_size.x/4):
		var cutpoint = CutPointScene.instance()
		add_child(cutpoint)
		cutpoint.position = Vector2(i, ingredient_pos.y)
	
	# Initialize the HitArea and its collision shape
	hitarea.position = Vector2(topleft.x, ingredient_pos.y)
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(hit_area_width, ingredient_size.y/2)
	hitshape.set_shape(shape)

func _process(delta):
	if finished:
		return
	# Check to see if we're done
	finished = true
	for child in get_children():
		if child is CutPoint:
			if child.cut==false:
				finished = false
				break
	
	# Move the HitArea on a sine wave
	elapsed += hit_area_speed * delta
	#print(elapsed, " ", sin(elapsed)+1)
	hitarea.position.x = topleft.x + ((sin(elapsed)+1) * ingredient_size.x/2)
	update()

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			# Cut!
			var hits = hitarea.get_overlapping_areas()
			if hits: # if we got a cut
				hits[0].cut = true
			
		# Here's something cool:
		# InputEventMouseButton has a property called "factor"
		# which corresponds to how *much* the button is held.
		# We could use this to cut using the scroll wheel.

func _draw():
	# Drawing simple shapes using CanvasItem methods
	draw_rect(Rect2(
		hitarea.position-hitshape.shape.extents, 
		hitshape.shape.extents*2), 
		Color(Color.red), 
		true
	)