extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var parallax_backgrounds = [
	"res://Scenes/Parallax_Scenes/Parallax1.tscn",
	"res://Scenes/Parallax_Scenes/Parallax2.tscn",
	"res://Scenes/Parallax_Scenes/Parallax3.tscn"
]


var foreGroundScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Seed the randomizer
	randomize()
	# Select random element from list
	var rand_index = randi() % parallax_backgrounds.size()
	var bg_path = parallax_backgrounds[rand_index]
	

	# Load an instance of scene as a child of GAME_START
	var bg_scene = load(bg_path)
	var bg_instance = bg_scene.instance()
	add_child(bg_instance)
	
	
	
	if gamestate.title_screen_click_flag == false:
		loadForegroundScene("res://Scenes/Title_Scene.tscn")
	else:
		loadForegroundScene("res://Scenes/Menu_Scene.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func loadForegroundScene(path_to_scene):
	# Clear the current foreGroundScene and prepare the next
	if foreGroundScene:
		foreGroundScene.queue_free()
		
	var scene = load(path_to_scene)
	foreGroundScene = scene.instance()
	add_child(foreGroundScene)



		
