extends ParallaxBackground

@export var scrolling_speed = 10

func _ready():
	GameManagement.on_game_over.connect(_on_game_over)

func _process(delta):
	scroll_base_offset.x -= scrolling_speed

func _on_game_over():
	set_process(false)
