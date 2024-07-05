extends PathFollow3D

@export var speed: float = 2.5

@onready var base = get_tree().get_first_node_in_group("base")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1:
		base.take_damage(1)
		queue_free()
