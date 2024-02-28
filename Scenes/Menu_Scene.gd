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


func change_scene_with_animation(target_scene):
	# Play transition
	$Menu_Container/AnimationPlayer.play("transition_out")

	# Wait for transition to finish.
	yield($Menu_Container/AnimationPlayer, "animation_finished")
	
	# Change scene to 'target_scene'
	get_tree().change_scene(target_scene)


func _on_Quit_Button_pressed():
	# Load Quit Scene on Quit Button Pressed
	change_scene_with_animation("res://Scenes/Quit_Scene.tscn")


func _on_Play_Button_pressed():
	# Load lobby scene (for now) on Play Button pressed
	change_scene_with_animation("res://multiplayer/lobby.tscn")
