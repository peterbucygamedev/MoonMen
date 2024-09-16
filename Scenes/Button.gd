extends Button
@onready var pause = $"../../.."
var focused := false

func _process(delta):
	if focused == false:
		grab_focus()
		focused = true

func _on_pressed():
	focused = false
	pause.is_paused = false
	get_tree().paused = pause.is_paused


