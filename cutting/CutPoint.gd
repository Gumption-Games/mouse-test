class_name CutPoint extends Area2D

var cut := false

func _ready():
	$CutSprite.hide()
	$UncutSprite.show()

func _process(delta):
	if cut and $CutSprite.visible==false:
		$CutSprite.show()
		$UncutSprite.hide()