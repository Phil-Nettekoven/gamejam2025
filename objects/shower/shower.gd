extends Node2D

@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	sprite.play("shower")

func _on_animated_sprite_2d_animation_finished() -> void:
	sprite.play("default")
