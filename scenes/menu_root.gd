extends Control


var menu_origin_position := Vector2.ZERO
var menu_origin_size := Vector2.ZERO

var current_menu : MarginContainer = null
var menu_stack : Array = []
var menu_transition_time : float = 1

@onready var main_menu  : MarginContainer = $MainMenu
@onready var settings_menu  : MarginContainer = $Settings

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_origin_position = Vector2(0, 0)
	menu_origin_size = get_viewport_rect().size
	current_menu = main_menu
	

func move_to_menu(next_menu_id: String) -> void:
	var target_menu : MarginContainer = get_menu_from_id(next_menu_id)
	var tween : Tween = create_tween()
	tween.parallel().tween_property(target_menu, "global_position", menu_origin_position, menu_transition_time)
	tween.parallel().tween_property(current_menu, "global_position", Vector2(-menu_origin_size.x, 0), menu_transition_time)
	menu_stack.append(current_menu)
	current_menu = target_menu

func get_menu_from_id(menu_id: String) -> Control:
	match menu_id:
		"main":
			return main_menu
		"settings":
			return settings_menu
		_:
			return main_menu

func _on_back_pressed() -> void:
	move_to_menu("main")


func _on_settings_pressed() -> void:
	move_to_menu("settings")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
