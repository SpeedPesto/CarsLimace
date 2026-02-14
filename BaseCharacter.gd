extends CharacterBody2D
class_name BaseCharacter

@export var tilt_amount = 5.0
@export var tilt_speed = 10.0
@export var bounce_amount = 3.0
@export var bounce_speed = 10.0

func _physics_process(delta):
	apply_tilt_effect(delta)

func apply_tilt_effect(delta):
	if velocity.length() > 0:
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		elif velocity.x < 0:
			$Sprite2D.flip_h = true
		
		$Sprite2D.rotation_degrees = sin(Time.get_ticks_msec() / 1000.0 * tilt_speed) * tilt_amount
		$Sprite2D.position.y = -abs(sin(Time.get_ticks_msec() / 1000.0 * bounce_speed)) * bounce_amount
	else:
		# Remettre à zéro quand immobile
		$Sprite2D.rotation_degrees = lerp($Sprite2D.rotation_degrees, 0.0, delta * 5.0)
		$Sprite2D.position.y = lerp($Sprite2D.position.y, 0.0, delta * 5.0)
