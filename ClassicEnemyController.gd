extends BaseCharacter

var target
@export var speed = 50.0

func _ready():
	target = get_node("../Player")

func _process(delta):
	var direction = (target.position - position).normalized()
	
	velocity = direction * speed
	move_and_slide()
