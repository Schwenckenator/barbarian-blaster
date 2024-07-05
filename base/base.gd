extends Node3D

## Maximum health of the base
@export var max_health: int = 5

## Label displaying current health of base
@onready var health_label: Label3D = $HealthLabel

## Current health of base
var health: int:
	set(value):
		health = value
		health_label.text = str(value) + "/" + str(max_health)
		var red = Color.RED
		var white = Color.WHITE
		var color = red.lerp(white, float(health) / float(max_health))

		health_label.modulate = color
		if health <= 0:
			# Base has died
			get_tree().reload_current_scene()
	get:
		return health

## Called once after script loads
func _ready() -> void:
	health = max_health


## Deal damage to the base
func take_damage(value: int) -> void:
	print("damage dealt to base", value)
	health -= value
