class_name Menu
extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Lobby.hide()
	$Checklist/CanvasLayer.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gotolobby_pressed():
	$MenuLayout.hide()
	$Checklist/CanvasLayer.hide()
	$Lobby.show()
	$Lobby/LevelSelect.hide()
	




func _on_Checklist_pressed():
	$Lobby.hide()
	$Checklist/CanvasLayer.show()


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
