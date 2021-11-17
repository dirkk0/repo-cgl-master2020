extends Spatial

# export var is_puzzle = false
export(NodePath) var solve_this = ""
export var txt = ""
export var num = -1

var done = false

func _ready():
	pass # Replace with function body.


func activate():
	print(123)
	if not done:
		var node = get_node(solve_this)
		node.play("a1")
		# Global.Hud.set_info(txt)
#		var ap = get_node("../AudioStreamPlayer")
#		match num:
#			0:
#				ap.stream=Global.audio0
#				ap.play()
#			1:
#				ap.stream=Global.audio1
#				ap.play()
#			2:
#				ap.stream=Global.audio2
#				ap.play()
#			3:
#				ap.stream=Global.audio3
#				ap.play()
#			4:
#				ap.stream=Global.audio4
#				ap.play()
		done = true
