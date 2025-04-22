extends Control

onready var log_display = $Panel/RichTextLabel  # Adjust based on your scene tree
var max_logs = 10
var logs = []
var is_visible = false  # Hidden by default

func _ready():
	# Hide initially
	self.hide()
	
	# Connect to LogManager
	LogManager.connect("log_updated", self, "_on_log_updated")
	
	# Capture F1 key to toggle visibility
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("toggle_debug_console"):
		is_visible = !is_visible
		if is_visible:
			self.show()
		else:
			self.hide()

func _on_log_updated(message: String):
	add_log(message)

func add_log(message: String):
	logs.append(message)
	if logs.size() > max_logs:
		logs.pop_front()
	
	# Update UI
	log_display.bbcode_text = "\n".join(logs)
