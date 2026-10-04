extends Control

const SCENE_GAME := "res://main_Scene.tscn"

func _ready():
	$VBoxContainer/BtnMain.pressed.connect(_on_main)
	$VBoxContainer/BtnKeluar.pressed.connect(_on_keluar)
	$VBoxContainer/BtnMain.grab_focus()

func _on_main():
	get_tree().change_scene_to_file(SCENE_GAME)

func _on_keluar():
	get_tree().quit()
