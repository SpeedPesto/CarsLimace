extends Node2D

@export var snake: PackedScene
@export var spawn_interval = 2.0
var screen_size
var spawn_timer = 0.0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	spawn_timer += delta
	
	if spawn_timer >= spawn_interval:
		spawn_enemy()
		spawn_timer = 0.0

func spawn_enemy():
	if snake == null:
		return
		
	var enemy = snake.instantiate()
	
	enemy.position = Vector2(
		randf_range(0, screen_size.x),
		randf_range(0, screen_size.y)
	)
	
	add_child(enemy)
