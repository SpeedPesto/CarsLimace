extends BaseCharacter

@export var speed: float = 300.0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	super._physics_process(delta)
	
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	
	var direction = Vector2(direction_x, direction_y)
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	velocity = direction * speed
	
	move_and_slide()
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
