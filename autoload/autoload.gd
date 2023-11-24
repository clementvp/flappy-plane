extends Node

signal on_game_over
signal on_player_score

@export var PLANE_GRAVITY = 600
@export var PLANE_BOOST = -320
@export var SPIKES_SPEED = 130
@export var SPAWN_TIME = 2

var game_scene: PackedScene = preload("res://screens/game/game.tscn")
var main_scene: PackedScene = preload("res://screens/main/main.tscn")

var PLANE_GROUP = "plane"

var score = 0
var high_score = 0

func set_score(score_value):
	score = score_value
	if score_value > high_score:
		high_score = score_value

func get_score():
	return score

func get_high_score():
	return high_score
	
func increment_score():
	set_score(score+1)

func get_plane_gravity():
	return PLANE_GRAVITY
	
func get_plane_boost():
	return PLANE_BOOST

func get_spikes_speed():
	return SPIKES_SPEED

func get_spawn_time():
	return SPAWN_TIME
	
func load_game_scene():
	score = 0
	get_tree().change_scene_to_packed(game_scene)
	
func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)
	
