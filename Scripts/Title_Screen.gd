class_name Title_Screen
extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var input_flag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label/AnimationPlayer.play("Text shine")
	
	

func _input(event):
	# Spin the logo into place and show the main menu
	if event is InputEventKey or event is InputEventScreenTouch or event is InputEventMouseButton and !input_flag:
		$TitleBox2/Title/AnimationPlayer.play("spin into place")
		$Label/AnimationPlayer.play("fade out")
		input_flag = true



func _on_AnimationPlayer_animation_finished(anim_name):
	# Switch to lobby screen when animation has finished
	pass
