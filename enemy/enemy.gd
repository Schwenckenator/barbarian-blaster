extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50

## Current health of enemy
var health: int:
	get:
		return health
	set(value):
		health = value
		if health <= 0:
			# enemy has died
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")

## Called once after script loads
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1:
		base.take_damage(1)
		queue_free()
