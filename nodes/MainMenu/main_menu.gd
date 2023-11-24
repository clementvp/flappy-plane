extends Control

@onready var high_score = $MarginContainer/HBoxContainer/HighScore

# Called when the node enters the scene tree for the first time.
func _ready():
	high_score.text = str(GameManagement.get_high_score())
	


