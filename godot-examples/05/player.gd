
extends KinematicBody

export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 35
export var mouse_sensitivity = 0.3

var velocity:Vector3

onready var cam = $Head/Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	var direction:Vector3 = Vector3.ZERO
	var aim = cam.get_camera_transform().basis
	if Input.is_action_pressed("ui_w"):
		direction -= aim.z
	if Input.is_action_pressed("ui_s"):
		direction += aim.z
	if Input.is_action_pressed("ui_a"):
		direction -= aim.x
	if Input.is_action_pressed("ui_d"):
		direction += aim.x
	if Input.is_action_just_pressed("ui_e"):
		print("eeeeee")
		var r = $Head/Camera/RayCast
		var hit_object = r.get_collider()
		print(r.get_collision_point(), r.is_colliding())
		if hit_object:
			# var p = b.get_parent().get_parent()
			var owner = hit_object.get_owner()
			print(owner.name)
			if owner.has_method("activate"):
				owner.activate()


	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y += jump_power

	move_and_slide(velocity, Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		self.rotate_y(deg2rad(-event.relative.x) * mouse_sensitivity)
		# $Head.rotate_y(deg2rad(-event.relative.x) * mouse_sensitivity)
		cam.rotate_x(deg2rad(-event.relative.y) *mouse_sensitivity)
		cam.rotation.x = clamp(cam.rotation.x, -PI*0.5, PI*0.5)
