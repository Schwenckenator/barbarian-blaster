extends Area3D

@export var speed := 30.0
@export var damage := 25

var direction := Vector3.FORWARD

## Physics process
func _physics_process(delta: float) -> void:
	position += direction * speed * delta


## Lifetime timer timed out
func _on_life_timer_timeout() -> void:
	queue_free()
	



func _on_area_entered(area:Area3D) -> void:
	if area.is_in_group("enemy"):
		var enemy = area.get_parent()
		enemy.health -= damage
		queue_free()

