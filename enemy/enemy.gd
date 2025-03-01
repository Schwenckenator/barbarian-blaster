extends PathFollow3D

@export var speed: float = 2.5
@export var max_health: int = 50
@export var bounty := 15

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

## Current health of enemy
var health: int:
	get:
		return health
	set(value):
		if value < health:
			animation_player.play("take_damage")
		health = value
		if health <= 0:
			# enemy has died
			bank.gold += bounty
			queue_free()

## Called once after script loads
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1:
		base.take_damage(1)
		queue_free()
