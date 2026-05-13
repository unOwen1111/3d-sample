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
	var dir := DirAccess.open(stage_folder_path)
	if dir == null:
		push_error("フォルダを開けません: " + stage_folder_path)
		return

	dir.list_dir_begin()
	var file_name := dir.get_next()

	while file_name != "":
		if file_name.get_extension() == "csv":
			stage_files.append(stage_folder_path.path_join(file_name))

		file_name = dir.get_next()

	dir.list_dir_end()
