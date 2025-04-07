# node for domino on Domino Level
class_name Domino
extends Node2D

@export var top_num: int = 0
@export var bottom_num: int = 0
@export var top_element: String = ""
@export var bottom_element: String = ""
@export var placed: bool = false

var original_pos: Vector2 = Vector2.ZERO
var og_scale: float = 1.3
var hover_scale: float = og_scale + 0.05
var selected: bool = false

# Reference to world node to minimize get_parent() calls
var _world: Node = null


func _ready() -> void:
	_world = get_parent()
	if not placed:
		add_to_group("dominos")
	original_pos = position


func init(bottom: int, top: int, bottom_elm: String, top_elm: String, initial: bool) -> void:
	bottom_num = bottom
	top_num = top
	bottom_element = bottom_elm if bottom_elm else ""
	top_element = top_elm if top_elm else ""

	if initial:
		original_pos = position

	$Label.text = bottom_element + "\n" + str(bottom_num) + " | " + str(top_num) + "\n" + top_element


func _on_Area2D_mouse_entered() -> void:
	$Sprite.scale = Vector2(hover_scale, hover_scale)


func _on_Area2D_mouse_exited() -> void:
	$Sprite.scale = Vector2(og_scale, og_scale)


func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if not placed:
			if not _world.is_domino_selected(self):
				if _world.select_domino(self):
					selected = true
				else:
					await get_tree().create_timer(0.05).timeout
					_world.clear_selected_domino()
					selected = false


func _physics_process(_delta: float) -> void:
	if selected and not placed:
		var mouse_pos: Vector2 = get_global_mouse_position()
		position.x = 2 * mouse_pos.x
		position.y = 2 * mouse_pos.y
	else:
		position = original_pos
