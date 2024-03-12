extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu_Scene.visible = false
	$Title_Scene.visible = true
	$Parallax1.visible = true
	$Quit_Scene.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




### Title Screen Functions ###

var input_flag = false

func handleChangeToMenuScene():
	if input_flag == true:
		return
	
	input_flag = true
	# Play animation
	$Title_Scene/Title_Container/AnimationPlayer.play("Transition")
	yield($Title_Scene/Title_Container/AnimationPlayer, "animation_finished")
	# Set title scene to invisible when finished
	$Title_Scene.visible = false
	$Menu_Scene.visible = true
	$Menu_Scene/Menu_Container/AnimationPlayer.play("fall into place")
	


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			handleChangeToMenuScene()
	elif event is InputEventKey:
		handleChangeToMenuScene()
	elif event is InputEventScreenTouch:
		handleChangeToMenuScene()


########## Quit Scene Functions ##########

func _on_Quit_Scene_visibility_changed():
	if $Quit_Scene.visible == true:
		$Quit_Scene/MarginContainer/VBoxContainer/HBoxContainer/AnimationPlayer.play("rise into place")
	else:
		
