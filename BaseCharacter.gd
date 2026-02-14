extends CharacterBody2D
class_name BaseCharacter

@export var tilt_amount = 10.0
@export var tilt_speed = 10.0

func _physics_process(delta):
	apply_tilt_effect(delta)

func apply_tilt_effect(delta):
	if velocity.length() > 0:
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		elif velocity.x < 0:
			$Sprite2D.flip_h = true
			
		$Sprite2D.rotation_degrees = sin(Time.get_ticks_msec() / 1000.0 * tilt_speed) * tilt_amount
	else:
		$Sprite2D.rotation_degrees = lerp($Sprite2D.rotation_degrees, 0.0, delta * 5.0)
