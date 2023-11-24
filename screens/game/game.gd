extends Node2D

@export var spike_scene:PackedScene
@onready var marker_upper = $MarkerUpper
@onready var marker_lower = $MarkerLower
@onready var spike_holder = $SpikeHolder
@onready var spawn_spikes_timer = $SpawnSpikesTimer
@onready var engine_player = $EnginePlayer
@onready var game_overplayer = $GameOverplayer
@onready var score_player = $ScorePlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManagement.on_game_over.connect(on_game_over)
	GameManagement.on_player_score.connect(on_player_score)
	spawn_spikes_timer.wait_time = GameManagement.get_spawn_time()
	spawn_spikes_timer.start()
	spawn_spikes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawn_spikes():
	var x_position = marker_lower.position.x
	var y_position = randf_range(marker_upper.position.y, marker_lower.position.y)
	var new_spikes = spike_scene.instantiate()
	new_spikes.position = Vector2(x_position, y_position)
	spike_holder.add_child(new_spikes)
	
func stop_spikes():
	spawn_spikes_timer.stop()
	for spikes in spike_holder.get_children():
		spikes.set_process(false)
	

func on_game_over():
	engine_player.stop()
	game_overplayer.play()
	stop_spikes()
	
func _on_spawn_spikes_timer_timeout():
	spawn_spikes()
	
func on_player_score():
	score_player.play()
	
