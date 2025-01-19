extends Camera2D

@export var zoom_amt:float = 0.2
@export var zoom_max:float = 10.0
@export var zoom_min:float = 6.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input():
	var mod: float = 0.0
	
	if Input.is_action_pressed("zoomin"):
		mod = zoom_amt
	elif Input.is_action_pressed("zoomout"):
		mod = -zoom_amt
	
	if mod != 0.0:
		var temp: float = clamp(self.zoom.x + mod, zoom_min, zoom_max)
		var zoom_vector: Vector2 = Vector2(temp,temp)
		self.zoom = zoom_vector
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
