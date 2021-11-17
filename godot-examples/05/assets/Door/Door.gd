extends Spatial

export var active = true
export var speed = 1.0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.playback_speed = speed



func _on_Area_body_entered(body):
	pass
	if active: $AnimationPlayer.play("a1")


func _on_Area_body_exited(body):
	pass # Replace with function body.
	if active: $AnimationPlayer.play_backwards("a1")

func play(s):
	$AnimationPlayer.play(s)
