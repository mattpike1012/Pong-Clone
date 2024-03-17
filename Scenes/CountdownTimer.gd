extends Node2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left = timer.time_left
	label.text = str(round(time_left))
