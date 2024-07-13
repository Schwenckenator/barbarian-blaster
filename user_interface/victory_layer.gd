extends CanvasLayer

@onready var star_1 = %Star1
@onready var star_2 = %Star2
@onready var star_3 = %Star3

@onready var health_label = %HealthLabel
@onready var gold_label = %GoldLabel

@export var star_3_gold_threshold := 500

func retry() -> void:
	get_tree().reload_current_scene()

func quit_game() -> void:
	get_tree().quit()

func victory() -> void:
	# display victory screen
	visible = true

	# Earn second star
	var base = get_tree().get_first_node_in_group("base")
	if base.health == base.max_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true

	# Earn third star
	var bank = get_tree().get_first_node_in_group("bank")
	if bank.gold > star_3_gold_threshold:
		star_3.modulate = Color.WHITE
		gold_label.visible = true
