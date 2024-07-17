extends ColorRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal trigger_animation(anim_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("trigger_animation", "Screen_Unwipe")  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
