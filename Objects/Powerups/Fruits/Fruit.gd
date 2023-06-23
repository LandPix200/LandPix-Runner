extends Area2D
class_name Fruit

var point = 5


func _ready():
	$AnimatedSprite.play("default")
	randomize()

func picked():
	$Tween.interpolate_property(
		self, "position", position, 
		position + Vector2(-randi() % -50, -randi() % -50), 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.interpolate_property(
		self, "modulate", modulate, 
		Color.transparent, 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	$Tween.start()
	

func _on_Fruit_body_entered(body: Node2D):

	if body.is_in_group("players"):
		picked()


func _on_Tween_tween_all_completed():
	queue_free()
