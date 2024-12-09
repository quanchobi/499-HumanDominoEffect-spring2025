# # # Koi Pond Venn Diagram Scene # # #
## next_scene = DominoWorld.tscn



extends Node2D

export var next_scene: PackedScene

var choices = [] + curriculum.choices
var choice_ind = 0

var yellow_selected = false
var blue_selected = false
var red_selected = false

var players_ready = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # hide the mouse cursor so that the rock is the cursor
	$Choice.text = choices[choice_ind][1]
	var random_rock = randi() % 3 + 1 # pick a random yellow rock to start with
	$Stone/stone.animation = "y"+str(random_rock) # update animation based off number
	
	MusicController.playMusic(ReferenceManager.get_reference("pond.ogg"))




## This function handles when the user selects an area of venn diagram selection ##
func handle_choice(area):
	if choice_ind == 7 and choices[choice_ind][0] == area: # if the user has completed all basic choices, move on to advanced choices
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$Popup.visible = true
		$Health.text = "Health"
		$Liberty.text = "Liberty"
		$Happiness.text = "Happiness"
	
	if choice_ind == len(choices) - 1: # if we're at the end of the choice list, tell host we're done
		if not get_tree().is_network_server():
			# Tell server we are ready to start.
			rpc_id(1, "ready_to_start", get_tree().get_network_unique_id())
		else:
			ready_to_start(get_tree().get_network_unique_id())
	elif choices[choice_ind][0] == area: # correct choice
		choice_ind += 1
		$Choice.text = choices[choice_ind][1]
		$Indicator.text = "Correct!"
		$Correct_num.text = str(int($Correct_num.text) + 1)
		change_stone(choices[choice_ind][0])
		$CorrectSound.playing = true
	else: # incorrect choice
		$Indicator.text = "Try again!"
		$IncorrectSound.playing = true



## this function is responsible for updating the rock sprite ##
## this is done by updating the current animation of $Stone/stone ##
## added by Brandon Kellems on October 8, 2024 ##
func change_stone(area):
	$Stone/stone.rotation_degrees = randi() % 360 + 1 # update rotations to add another layer of variation
	$Stone/stone.animation = area
	if area == "r": # if the rock type is red
		var random_rock = randi() % 4 + 1 # "randi() % 4 generates a number 0-3, we want 1-4 so +1 to this
		$Stone/stone.animation = "r"+str(random_rock) # update the animation to play the correct one based on random rock
	elif area == "b": # blue
		var random_rock = randi() % 3 + 1 
		$Stone/stone.animation = "b"+str(random_rock)
	elif area == "y": # yellow
		var random_rock = randi() % 3 + 1 
		$Stone/stone.animation = "y"+str(random_rock)
	elif area == "yb": # yellow blue
		var random_rock = randi() % 2 + 1 
		$Stone/stone.animation = "yb"+str(random_rock)
	elif area == "yr": # yellow red
		var random_rock = randi() % 2 + 1 
		$Stone/stone.animation = "yr"+str(random_rock)
	elif area == "br": # blue red
		var random_rock = randi() % 1 + 1 
		$Stone/stone.animation = "br"+str(random_rock)
	elif area == "ybr": # yellow blue red
		var random_rock = randi() % 2 + 1 
		$Stone/stone.animation = "ybr"+str(random_rock)




## handle different venn diagram section clicks ##
func _on_y_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not blue_selected and not red_selected:
		handle_choice("y")

func _on_b_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not yellow_selected and not red_selected:
		handle_choice("b")

func _on_r_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not yellow_selected and not blue_selected:
		handle_choice("r")
		
func _on_yb_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not red_selected:
		handle_choice("yb")

func _on_yr_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not blue_selected:
		handle_choice("yr")

func _on_br_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not yellow_selected:
		handle_choice("br")

func _on_ybr_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		handle_choice("ybr")




## These functions make circles bigger / smaller with mouse hovering ##
func _on_y_area_mouse_entered() -> void:
	$y_ring.scale = Vector2(1.4, 1.4)
	yellow_selected = true

func _on_y_area_mouse_exited() -> void:
	$y_ring.scale = Vector2(1.35, 1.35)
	yellow_selected = false

func _on_b_area_mouse_entered() -> void:
	$b_ring.scale = Vector2(1.4, 1.4)
	blue_selected = true

func _on_b_area_mouse_exited() -> void:
	$b_ring.scale = Vector2(1.35, 1.35)
	blue_selected = false

func _on_r_area_mouse_entered() -> void:
	$r_ring.scale = Vector2(1.4, 1.4)
	red_selected = true

func _on_r_area_mouse_exited() -> void:
	$r_ring.scale = Vector2(1.35, 1.35)
	red_selected = false



## This function "closes" the pop-up ##
func _on_Button_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Popup.visible = false



remote func start_game():
	get_parent().change_level(next_scene)

remote func ready_to_start(id):
	assert(get_tree().is_network_server())

	if not id in players_ready:
		players_ready.append(id)

	if players_ready.size() == gamestate.players.size():
		for p in gamestate.players:
			rpc_id(p, "start_game")
		start_game()





