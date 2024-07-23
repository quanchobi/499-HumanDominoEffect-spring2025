extends Control

export var next_scene: PackedScene

signal trigger_animation(anim_name)
signal pan_stopped

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
### var speed = 100
var speed = 500
var direction = Vector2(-1, 0)
var is_transition_ready = false

var narration_text = ["Test test test test test test test test test test test test test test"]
var narration_count = 1

onready var parallax = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("trigger_animation", "Screen_Unwipe") # Replace with function body.
	
	$Narration.text = narration_text[0]
	$Narration/TextAnimationPlayer.play("Reveal", -1, 2)

func _process(delta):
	if parallax.scroll_offset.x >= -6125:
		parallax.scroll_offset += direction * speed * delta
	else:
		emit_signal("pan_stopped")

func _on_CavepanTimer_timeout():
	emit_signal("trigger_animation", "Screen_Wipe") 
	
func _on_TextAnimationPlayer_animation_finished(anim_name: String) -> void:
	if narration_count < len(narration_text):
		$Narration.text = narration_text[narration_count]
		$Narration/TextAnimationPlayer.play("Reveal")
		narration_count += 1

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name == "Screen_Wipe"):
		get_parent().change_level(next_scene)
