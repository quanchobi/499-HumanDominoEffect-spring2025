extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var input_flag = false

func handleChangeToMenuScene():
	if input_flag == true:
		return
	
	input_flag = true
	# Play animation
	$Title_Container/AnimationPlayer.play("Transition")
	yield($Title_Container/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Scenes/Menu_Scene.tscn")
	

	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			handleChangeToMenuScene()
	elif event is InputEventKey:
		handleChangeToMenuScene()
	elif event is InputEventScreenTouch:
		handleChangeToMenuScene()



