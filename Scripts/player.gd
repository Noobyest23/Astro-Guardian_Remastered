extends CharacterBody2D

@export var move_speed = 5
@onready var sprite = $Playersprite
@onready var boostSprite = $booster_sprite
@onready var shootsound = $AudioStreamPlayer2D

func _process(delta):
	var move_x = Input.get_axis("Move Left", "Move Right")
	var move_y = Input.get_axis("Move Up", "Move Down")
	
	velocity.x = move_x * move_speed
	velocity.y = move_y * move_speed
	
	if move_x > 0:
		sprite.animation = "right"
		boostSprite.animation = "right"
	elif move_x < 0:
		boostSprite.animation = "left"
		sprite.animation = "left"
	else:
		boostSprite.animation = "default"
		sprite.animation = "default"
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("Shoot"):
		const BULLET = preload("res://Scenes/playershot.tscn")
		var new_bullet = BULLET.instantiate()
		add_child(new_bullet)
		shootsound.play()
