extends Sprite2D

@export var spritesheet:Texture2D

var head_dict:Dictionary
var body_dict:Dictionary
var legs_dict:Dictionary

var image_size:int = 32

func _ready() -> void:
	print(Color.WHITE)
	print(Color.BLACK)
	print(Color.TRANSPARENT)
	init_textures()
	texture = generate_texture()

func init_textures() -> void: #initialize npc texture options
	var texture_size:Vector2i = spritesheet.get_size()
	var texture_image:Image = spritesheet.get_image()
	#var new_texture:Image = texture_image
	var num_variations:int = texture_size.x/image_size
	
	for i:int in num_variations:
		head_dict[i] = Image.create_empty(image_size,image_size, false, Image.FORMAT_RGBA8)
		body_dict[i] = Image.create_empty(image_size,image_size, false, Image.FORMAT_RGBA8)
		legs_dict[i] = Image.create_empty(image_size,image_size, false, Image.FORMAT_RGBA8)
	
	
	#for i:int in num_variations:
	for x:int in texture_size.x:
		var active_dict:Dictionary
		var i:int = x/image_size
		var mod_x:int = x % image_size
		for y:int in texture_size.y:
			if y <= 10:
				active_dict = head_dict
			elif y <= 21:
				active_dict = body_dict
			else:
				active_dict = legs_dict
			
			var pixel:Color = texture_image.get_pixel(x,y)
			if pixel == Color.BLACK:
				continue
				#active_dict[i].set_pixel(mod_x,y, Color.TRANSPARENT)
			elif pixel == Color.WHITE:
				active_dict[i].set_pixel(mod_x,y, Color.WHITE)
	return

func generate_texture() -> Texture2D:
	if head_dict.size() <= 0:
		return null
	var rng:RandomNumberGenerator = RandomNumberGenerator.new()
	
	var head_image:Image = head_dict[rng.randi_range(0, 5)] #TODO change to head_dict.size()
	var body_image:Image = body_dict[rng.randi_range(0, 5)]
	var legs_image:Image = legs_dict[rng.randi_range(0, 5)]
	
	#return ImageTexture.create_from_image(legs_image)
	
	var new_image:Image = Image.create_empty(image_size,image_size, false, Image.FORMAT_RGBA8)
	
	for x:int in image_size:
		var active_image:Image
		for y:int in image_size:
				if y <= 10:
					active_image = head_image
				elif y <= 21:
					active_image = body_image
				else:
					active_image = legs_image
				if active_image.get_pixel(x,y) == Color.WHITE:
					new_image.set_pixel(x,y, Color.WHITE)
	
	return ImageTexture.create_from_image(new_image)

func _process(_delta: float) -> void:
	pass
