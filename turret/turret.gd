extends Node3D

@export var projectile: PackedScene
@export var turret_range:= 10.0

@onready var barrel: Node3D = $TurretBase/TurretTop/TurretBarrel
@onready var turret_top: Node3D = $TurretBase/TurretTop

var enemy_path: Path3D
var target: PathFollow3D

func _physics_process(_delta: float) -> void:
	target = find_best_target()
	if target:
		turret_top.look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if !target:
		return

	var shot: Node3D = projectile.instantiate()
	add_child(shot)
	shot.global_position = barrel.global_position
	shot.direction = turret_top.global_basis.z

	# Prevent projectiles from dropping down
	shot.direction.y = 0

func find_best_target() -> PathFollow3D:
	var best_target: PathFollow3D = null
	var best_progress:= 0

	for enemy in enemy_path.get_children():
		if enemy is not PathFollow3D:
			continue

		# If enemy is out of range (sqr compare is faster than using square roots)
		if enemy.global_position.distance_squared_to(global_position) > turret_range * turret_range:
			continue

		if enemy.progress > best_progress:
			# new best enemy found
			best_target = enemy
			best_progress = enemy.progress

	return best_target
