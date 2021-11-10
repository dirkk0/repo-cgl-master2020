extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 35
export var mouse_sensitivity = 0.3

var velocity:Vector3

var crate_state = false
var landing : bool = true


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	var direction:Vector3
	var aim = $Head/Camera.get_camera_transform().basis
	if Input.is_action_pressed("ui_w"):
		direction -= aim.z
	if Input.is_action_pressed("ui_s"):
		direction += aim.z
	if Input.is_action_pressed("ui_a"):
		direction -= aim.x
	if Input.is_action_pressed("ui_d"):
		direction += aim.x

	if Input.is_action_just_pressed("ui_f"):
		crate_state = not crate_state
		var a = get_node("../crate")
		print(333, is_on_floor(), a.sleeping)
		print(a.name)
		if crate_state:
			a.gravity_scale = 0.0
			a.global_transform.origin = $"Head/anchor".global_transform.origin
			$CollisionShape2.disabled = false
		else:
			a.gravity_scale = 1.0
			$CollisionShape2.disabled = true




	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		print(222, is_on_floor())
		velocity.y += jump_power


	if is_on_floor():
		if landing:
			# $LandSound.play()
			print("ouch ", velocity.y)
			landing = false
			if velocity.y < -12.0:
				print("dead")
				get_tree().quit()
	else:
		if !landing:
			landing = true
	

	if crate_state:
		var a = get_node("../crate")
		a.global_transform.origin = $"Head/anchor".global_transform.origin
		move_and_slide(velocity, Vector3.UP)
	else:
		pass
		move_and_slide(velocity, Vector3.UP, false, 4, PI/4, false)


func _input(event):
	if event is InputEventMouseMotion:
		self.rotate_y(deg2rad(-event.relative.x) * mouse_sensitivity)
		# $Head.rotate_y(deg2rad(-event.relative.x) * mouse_sensitivity)
		$Head/Camera.rotate_x(deg2rad(-event.relative.y) *mouse_sensitivity)
#	if event.is_action_pressed("ui_f"):
#		crate_state = not crate_state
#		var a = get_node("../crate")
#		print(a.name)
#		if crate_state:
#			a.gravity_scale = 0.0
#			a.global_transform.origin = Vector3(2, 2, 2)
#		else:
#			a.gravity_scale = 1.0
		
