extends Node

var log_file = "user://game_log.txt"

# Function to write logs to a file
func log_message(message: String, level: String = "INFO") -> void:
	var file = File.new()
	if file.open(log_file, File.WRITE) == OK:
		file.seek_end()  # Append instead of overwriting
		var timestamp = OS.get_time()
		file.store_line("[%02d:%02d:%02d] [%s] %s" % [timestamp.hour, timestamp.minute, timestamp.second, level, message])
		file.close()
	
	# Print to Godot console as well
	print("[%s] %s" % [level, message])

# Example helper functions
func log_debug(msg: String) -> void:
	log_message(msg, "DEBUG")

func log_warning(msg: String) -> void:
	log_message(msg, "WARNING")
	push_warning(msg)

func log_error(msg: String) -> void:
	log_message(msg, "ERROR")
	push_error(msg)
