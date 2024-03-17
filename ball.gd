extends RigidBody2D

@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	var velocity = Vector2.ZERO
	var random_velocity = [-1, 1]
	velocity.x = random_velocity.pick_random()
	velocity.y = random_velocity.pick_random()
	
	add_constant_force(velocity * 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += linear_velocity
