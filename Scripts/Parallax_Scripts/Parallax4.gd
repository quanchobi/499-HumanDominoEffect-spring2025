extends Control

export var next_scene: PackedScene

signal trigger_animation(anim_name)
signal pan_stopped

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
### var speed = 100
var speed = 1000
var direction = Vector2(-1, 0)
var is_transition_ready = false

onready var parallax = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("trigger_animation", "Screen_Unwipe") # Replace with function body.

func _process(delta):
	if parallax.scroll_offset.x >= -6100:
		parallax.scroll_offset += direction * speed * delta
	else:
		emit_signal("pan_stopped")

func _on_CavepanTimer_timeout():
	emit_signal("trigger_animation", "Screen_Wipe") 

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "Screen_Wipe"):
		get_parent().change_level(next_scene)
