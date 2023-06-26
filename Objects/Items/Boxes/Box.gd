extends StaticBody2D

export var tap_up_and_down_to_break = false

func _ready() -> void:
	pass


func break_it(body: Node2D):
	if not tap_up_and_down_to_break and body.position.y < position.y:
		return
	$AnimatedSprite.play("break")
	yield($AnimatedSprite, "animation_finished")
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("players"):
		break_it(body)
