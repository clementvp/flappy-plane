extends Control

@onready var game_overlabel = $MarginContainer/GameOverlabel
@onready var press_space_label = $MarginContainer/PressSpaceLabel
@onready var timer = $Timer

var can_press_space = false
# Called when the node enters the scene tree for the first time.
func _ready():
	GameManagement.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_press_space and Input.is_action_just_pressed("Fly"):
		GameManagement.load_main_scene()


func _on_timer_timeout():
	game_overlabel.hide()
	press_space_label.show()
	can_press_space = true
	

func on_game_over():
	show()
	timer.start()
