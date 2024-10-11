extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#variable to manipulate when game is paused
var is_paused = false setget set_is_paused

#open and close pause menu using the escape button
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		self.is_paused = !is_paused

#
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

#closes the pause menu
func _on_ResumeBtn_pressed():
	self.is_paused = false
	

#returns to main menu // NEEDS TO BE FIXED, DOESN'T WORK AS OF RIGHT NOW
func _on_MainBtn_pressed():
	#get_tree().change_scene("res://Scenes/Quit_Scene.tscn")
	var homeScn = load("res://Scenes/GAME_START.tscn")
	var homeInst = homeScn.instance()
	self.is_paused = false
	add_child(homeInst)

#quits to desktop
func _on_QuitBtn_pressed():
	get_tree().quit()
