extends CharacterBody2D

const SPEED = 350.0
const JUMP_VELOCITY = -750.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "run"
	else:
		sprite_2d.animation = "idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()

	var _isLeft = velocity.x < 0
	if Input.is_action_just_pressed('left'):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed('right'):
		sprite_2d.flip_h = false

func coinup():
	$Coin.play()
	
