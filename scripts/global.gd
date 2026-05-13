extends Node


enum BlockPattern {
	FLOOR_ONLY,
	FLOOR_AND_WALL,
	FLOOR_AND_PLAYER,
	FLOOR_AND_GOAL,
	DEBUG_BLOCK
}

const CELL_SIZE = 1

var stage_files := []
var stage_folder_path = "res://stage"

func _ready() -> void:
	load_stage_files()


func load_stage_files() -> void:
	for i in range(30):
		stage_files.append("res://stage/stage_%s.txt" % str(i).pad_zeros(2))
