extends VehicleBody3D

var max_rpm = 500
var max_torque = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("back", "forward")  
	var rpm = abs($rear_left.get_rpm())
	$rear_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = abs($rear_right.get_rpm())
	$rear_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
