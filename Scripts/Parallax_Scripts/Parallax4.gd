extends Control

export var next_scene: PackedScene

signal pan_stopped

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
### var speed = 100
var speed = 500
var direction = Vector2(-1, 0)
var is_transition_ready = false

onready var parallax = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if parallax.scroll_offset.x >= -6100:
		parallax.scroll_offset += direction * speed * delta
	#elif (!is_transition_ready):
	else:
		emit_signal("pan_stopped")
	#else:
		#get_parent().change_level(next_scene)

func _on_CavepanTimer_timeout():
	#is_transition_ready = true
	
	get_parent().change_level(next_scene)
