extends CharacterBody2D

@export var speed: float = 300.0
@export var tilt_amount = 10.0
@export var tilt_speed = 10.0

var screen_size
var tilt_direction = 1

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):

	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	
	var direction = Vector2(direction_x, direction_y)
	
	if direction.length() > 0:
		direction = direction.normalized()
		
		
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		elif velocity.x < 0:
			$Sprite2D.flip_h = true
			
		$Sprite2D.rotation_degrees = sin(Time.get_ticks_msec() / 1000.0 * tilt_speed) * tilt_amount
	else:
		$Sprite2D.rotation_degrees = lerp($Sprite2D.rotation_degrees, 0.0, delta * 5.0)
	
	velocity = direction * speed
	
	move_and_slide()
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
