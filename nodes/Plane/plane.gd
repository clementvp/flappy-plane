extends CharacterBody2D
@onready var animation_player = $AnimationPlayer
@onready var plane_sprite = $AnimatedSprite2D
@onready var explosion_sprite = $ExplosionSprite

var dead = false

func get_input():
	if Input.is_action_just_pressed("Fly"):
		animation_player.play('boost')
		velocity.y = GameManagement.get_plane_boost()
		

func die():
	if dead:
		return
	dead = true
	explosion_sprite.play()

	plane_sprite.hide()
	plane_sprite.stop()
	
	set_physics_process(false)
	GameManagement.on_game_over.emit()

func _physics_process(delta):
	velocity.y += GameManagement.get_plane_gravity() * delta
	get_input()
	if is_on_floor():
		die()
	if is_on_ceiling():
		die()
	move_and_slide()

