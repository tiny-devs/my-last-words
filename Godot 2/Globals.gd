extends Node

var is_mobile = false

func _ready():
	is_mobile = JavaScript.eval("/Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile/.test(navigator.userAgent)", true)
	if (!is_mobile):
		is_mobile = false
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(0.1))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear2db(0.5))
