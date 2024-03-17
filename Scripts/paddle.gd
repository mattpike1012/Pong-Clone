extends StaticBody2D

@export var speed = 400
@export var movement_up_key: String
@export var movement_down_key: String

var screen_size
var p_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	p_size = $ColorRect.get_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(movement_up_key):
		velocity = Vector2.UP
	if Input.is_action_pressed(movement_down_key):
		velocity = Vector2.DOWN

	position += (velocity * speed) * delta
	var startRange = (p_size.y / 2)
	var endRange = (screen_size.y) - p_size.y / 2
	position.y = clamp(position.y, startRange, endRange)
