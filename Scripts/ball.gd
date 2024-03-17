extends RigidBody2D

@export var speed = 500
@export var acceleration = 50

var dir: Vector2
var spawn_position: Vector2
var initial_speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_position = position
	initial_speed = speed

func _physics_process(delta):
	var collision = move_and_collide(dir * delta * speed)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider.name.contains("Paddle"):
			speed += acceleration
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())
	
func reset_ball():
	position = spawn_position
	var velocity = Vector2.ZERO
	var random_velocity = [-1, 1]
	velocity.x = random_velocity.pick_random()
	velocity.y = random_velocity.pick_random()
	
	speed = initial_speed
	dir = velocity

func new_direction(collider: Object):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	new_dir.x = -1 if dir.x > 0 else 1
	new_dir.y = (dist / (collider.p_size.y / 2)) * 0.6
	return new_dir.normalized()
