extends Control


func _ready() -> void:
	pass


func _on_playBtn_button_up() -> void:
	var __ = get_tree().change_scene("res://Scenes/Levels/Level.tscn")
