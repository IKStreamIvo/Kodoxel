extends RigidBody

export(float) var moveSpeed = 200
export(NodePath) var CameraPath

var cam
#const GRAVITY = -9.8 * 3
#var onGround = false

var velocity = Vector3()
var direction = Vector3()

func _ready():
	cam = get_node(CameraPath).get_child(0)

func _physics_process(delta):
	direction = Vector3()
	var aim = cam.get_global_transform().basis
	if Input.is_action_pressed("move_forward"):
		direction -= aim.z
	if Input.is_action_pressed("move_backward"):
		direction += aim.z
	if Input.is_action_pressed("move_right"):
		direction += aim.x
	if Input.is_action_pressed("move_left"):
		direction -= aim.x
	direction = direction.normalized() * moveSpeed * delta

	velocity.x = direction.x
	velocity.z = direction.z

	set_axis_velocity(velocity)