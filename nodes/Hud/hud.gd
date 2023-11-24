extends Control

@onready var label = $MarginContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManagement.on_player_score.connect(player_score)


func player_score():
	label.text = str(GameManagement.get_score())
