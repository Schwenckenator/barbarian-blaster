class_name TurretManager

extends Node3D


@export var turret: PackedScene
@export var enemy_path: Path3D

## Builds a new turret at the specified position
func build_turret(pos: Vector3) -> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = pos
	new_turret.enemy_path = enemy_path
