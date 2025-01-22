extends Sprite2D

var head_dict:Dictionary
var body_dict:Dictionary
var legs_dict:Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var texture_size:Vector2i = texture.get_size()
	var texture_image:Image = texture.get_image()
	
	var new_texture:Image = texture_image
	
	for x:int in texture_size.x:
		for y:int in texture_size.y:
			if [10,21,32].has(x):continue
			
			#print(texture_image.get_pixel(x,y))
			if texture_image.get_pixel(x,y) == Color(0,0,0,1):
				new_texture.set_pixel(x,y,Color.GREEN_YELLOW)

	texture = ImageTexture.create_from_image(new_texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
