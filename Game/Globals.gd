extends Node

var is_mobile = false
var player_is_in_the_safe_zone = false

func _ready():
	Signals.connect("player_enters_safe_zone", self, "_on_player_enters_safe_zone")
	Signals.connect("player_leaves_the_safe_zone", self, "_on_player_leaves_the_safe_zone")
	
	is_mobile = JavaScript.eval("/Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile/.test(navigator.userAgent)", true)
	if (!is_mobile):
		is_mobile = false
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(0.1))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear2db(0.5))
	
func _on_player_enters_safe_zone():
	player_is_in_the_safe_zone = true
	
func _on_player_leaves_the_safe_zone():
	player_is_in_the_safe_zone = false
	

