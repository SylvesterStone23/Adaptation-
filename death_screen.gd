
extends CanvasLayer


func _ready():
	hide()

func show_death_screen():
	show()
	# Optional: Pauses the game so enemies stop moving
	get_tree().paused = true

func _on_button_pressed():
	# 1. Unpause the game first so the scene can reload properly!
	get_tree().paused = false
	
	# 2. Reloads the current scene from scratch
	get_tree().reload_current_scene()
