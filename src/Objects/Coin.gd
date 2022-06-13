extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 75


func _on_body_entered(_body):
	picked()

func picked():
	PlayerData.score += score
	anim_player.play("fade_out")
