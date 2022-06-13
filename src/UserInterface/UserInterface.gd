extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score_label: Label = get_node("ScoreLabel")
onready var pause_title: Label = get_node("PauseOverlay/Title")

var paused = false setget set_paused

const DIED_MESSAGE: = "You died"


func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()


func _on_PlayerData_player_died():
	self.paused = true
	pause_title.text = DIED_MESSAGE


func _unhandled_input(event):
	if event.is_action_pressed("pause") and not is_dead():
		self.paused = not paused
		scene_tree.set_input_as_handled()


func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func update_interface():
	score_label.text = "Score: %s" % PlayerData.score

func is_dead():
	return pause_title.text == DIED_MESSAGE
