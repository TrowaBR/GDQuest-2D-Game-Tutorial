extends Control

onready var totals_label: Label = get_node("TotalsLabel")

func _ready():
	totals_label.text = totals_label.text % [PlayerData.score, PlayerData.deaths]
