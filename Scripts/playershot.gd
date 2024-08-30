extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y -= 5
	reparent(get_parent().get_parent())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= 3
