extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: Node

@onready var spawn_timer: Timer = $SpawnTimer

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = difficulty_manager.get_enemy_health()
	add_child(new_enemy)
	spawn_timer.wait_time = difficulty_manager.get_spawn_time()
	print(new_enemy.health)


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	spawn_timer.stop()
