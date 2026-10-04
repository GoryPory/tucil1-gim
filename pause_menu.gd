extends CanvasLayer

const SCENE_MENU := "res://mainMenu.tscn"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS   
	visible = false
	$VBoxContainer/BtnLanjut.pressed.connect(_tutup)
	$VBoxContainer/BtnMenuUtama.pressed.connect(_ke_menu)

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):  
		if get_tree().paused:
			_tutup()
		else:
			_buka()
		get_viewport().set_input_as_handled()

func _buka():
	get_tree().paused = true
	visible = true
	$VBoxContainer/BtnLanjut.grab_focus()

func _tutup():
	get_tree().paused = false
	visible = false

func _ke_menu():
	get_tree().paused = false   
	get_tree().change_scene_to_file(SCENE_MENU)
