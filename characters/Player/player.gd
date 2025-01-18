extends CharacterBody2D

@export var speed:int = 400
var prev_position:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input() -> void:
	var direction:Vector2 = Input.get_vector("left","right","up","down")
	velocity = direction * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
	move_and_slide()
	if (position != prev_position):
		prev_position = position
		print_debug(position)
