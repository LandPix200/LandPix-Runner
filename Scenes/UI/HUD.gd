extends CanvasLayer

signal toLeft()
signal toRight()
signal jump()

onready var left_btn: TouchScreenButton = $Left
onready var right_btn: TouchScreenButton = $Right
onready var jump_btn: TouchScreenButton = $Jump

func _ready():
	pass
		
	




func _on_Jump_pressed():
	emit_signal("jump")
