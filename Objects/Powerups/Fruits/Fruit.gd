extends Area2D
class_name Fruit

var point = 5


func _ready():
	$AnimatedSprite.play("default")
	randomize()

func picked():
	queue_free()
	

func _on_Fruit_body_entered(body: Node2D):

	if body.is_in_group("players"):
		picked()



