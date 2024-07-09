extends MarginContainer

@export var starting_gold := 150

@onready var gold_label := $GoldLabel

var gold: int:
	get:
		return gold
	set(value): 
		gold = max(value, 0)
		gold_label.text = "Gold: " + str(gold)

func _ready() -> void:
	gold = starting_gold
		

