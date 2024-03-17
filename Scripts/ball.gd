extends RigidBody2D

@export var speed = 500

var dir: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var velocity = Vector2.ZERO
	var random_velocity = [-1, 1]
	velocity.x = random_velocity.pick_random()
	velocity.y = random_velocity.pick_random()
	
	dir = velocity

func _physics_process(delta):
	var collision = move_and_collide(dir * delta * speed)
	var collider
	if collision:
		collider = collision.get_collider()
		dir = dir.bounce(collision.get_normal())