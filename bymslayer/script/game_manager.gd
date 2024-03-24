extends Node

@onready var audio_stream_player_2d = $"../sceneobject/AudioStreamPlayer2D"
@onready var points_label = %pointsLabel

func _ready():
	audio_stream_player_2d.playing = true

var points = 0

func add_point():
	points += 1
	print(points)
	points_label.text = "Points:" + str(points)
