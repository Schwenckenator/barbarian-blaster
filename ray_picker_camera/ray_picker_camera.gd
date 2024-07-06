extends Camera3D

@export var grid_map: GridMap
@export var turret_manager: TurretManager

@onready var raycast: RayCast3D= $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()

	raycast.target_position = project_local_ray_normal(mouse_position) * 100.0
	raycast.force_raycast_update()

	# Guards
	if not raycast.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		return

	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

	if not Input.is_action_pressed("click"):
		return
		
	var collider = raycast.get_collider()
	if  collider is not GridMap:
		return


	var collision_pont = raycast.get_collision_point()
	var cell = grid_map.local_to_map(collision_pont)

	if grid_map.get_cell_item(cell) == 0:
		grid_map.set_cell_item(cell, 1)
		var tile_pos = grid_map.map_to_local(cell)
		turret_manager.build_turret(tile_pos)
	
