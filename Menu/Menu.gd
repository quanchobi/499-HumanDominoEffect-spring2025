class_name Menu
extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func is_left_click(input_event):
	if input_event is InputEventMouseButton and input_event.button_index == 0:
		return true
	else:
		return false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Lobby.visible = false
	$Checklist/CanvasLayer.visible = false
	$Lobby/Players.visible = false
	
	$Menu_Container.visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gotolobby_pressed():
	$MenuLayout.visible = false
	$Checklist/CanvasLayer.visible = false
	$Lobby.visible = true
	$Lobby/LevelSelect.visible = false
	




func _on_Checklist_pressed():
	$Lobby.visible = false
	$Checklist/CanvasLayer.visible = true


func _on_remove_item_pressed():
	pass # Replace with function body.





func _on_Return_pressed():
	$Lobby.hide()
	$Lobby/Players.hide()
	$Lobby/Connect.show()
	$Lobby/LevelSelect.hide()
	$Checklist/CanvasLayer.hide()
	$MenuLayout.show()
	pass # Replace with function body.






# New title screen code as of 2/14/2024 onward...
####################################################



func _on_AnimationPlayer_animation_finished(anim_name):
	$Title_Container.visible = false
	


func _on_Play_Button_gui_input(event):
	pass # Replace with function body.
