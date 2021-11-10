extends KinematicBody

var mouse_sensitivity = 0.3
var direction:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	# print("is this happening?")
	pass # Replace with function body.
	

func _physics_process(delta):
	# print("is this happening?")
	var aim = $"Head/Camera".get_camera_transform().basis
	if Input.is_action_pressed("ui_up"):
		direction -= aim.z
	if Input.is_action_pressed("ui_down"):
		direction += aim.z
	if Input.is_action_pressed("ui_left"):
		direction -= aim.x
	if Input.is_action_pressed("ui_right"):
		direction += aim.x

	direction = direction.normalized()
	direction.y = -9.8 * delta
	
	var target = direction * 6.0
	move_and_slide(target)

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_y(deg2rad(-event.relative.x) * mouse_sensitivity)
		$Head/Camera.rotate_x(deg2rad(-event.relative.y) * mouse_sensitivity) 
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
