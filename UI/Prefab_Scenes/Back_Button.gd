extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_mouse_entered():
	# Change label outline color to reddish
	$TextureButton/MarginContainer/Label.add_color_override("font_outline_color", Color(0, 0, 0, 1))

func _on_TextureButton_mouse_exited():
	# Change label outline back to default
	pass
