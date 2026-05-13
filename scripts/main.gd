extends Node3D

var maze = []
@export var stage_no: int
var floor_only_scene = preload("res://scenes/floor_only.tscn")
var floor_and_wall_scene = preload("res://scenes/floor_and_wall.tscn")
var floor_and_player_scene = preload("res://scenes/floor_and_player.tscn")
var floor_and_goal_scene = preload("res://scenes/floor_and_goal.tscn")
var debug_block_scene = preload("res://scenes/debug_block.tscn")

@onready var cleaar_screen: Control = $CanvasLayer/ClearScreen
@onready var blocks: Node3D = $Blocks

func _ready() -> void:
	load_maze_from_csv(Global.stage_files[stage_no])
	create_maze()


func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_P):
		get_tree().call_group("debug_blocks", "change_texture")

func load_maze_from_csv(path: String) -> void:
	
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		$CanvasLayer/ClearScreen/GoalLabel.text = "CSVを開けません: " + path
		push_error("CSVを開けません: " + path)
		return

	while not file.eof_reached():
		var line := file.get_line()
		var row := []
		var values := line.split(",")

		for value in values:
			row.append(value.to_int())
		maze.append(row)


func create_maze() -> void:
	for y in range(maze.size()):
		for x in range(maze[y].size()):
			var cell_position = Vector3(x * Global.CELL_SIZE, 0, y * Global.CELL_SIZE)

			match maze[y][x]:
				Global.BlockPattern.FLOOR_ONLY:
					var floor_only = floor_only_scene.instantiate()
					floor_only.position = cell_position
					blocks.add_child(floor_only)
				Global.BlockPattern.FLOOR_AND_WALL:
					var floor_and_wall = floor_and_wall_scene.instantiate()
					floor_and_wall.position = cell_position
					blocks.add_child(floor_and_wall)
				Global.BlockPattern.FLOOR_AND_PLAYER:
					var floor_and_player = floor_and_player_scene.instantiate()
					floor_and_player.position = cell_position
					blocks.add_child(floor_and_player)
				Global.BlockPattern.FLOOR_AND_GOAL:
					var floor_and_goal = floor_and_goal_scene.instantiate()
					floor_and_goal.position = cell_position
					blocks.add_child(floor_and_goal)
				Global.BlockPattern.DEBUG_BLOCK:
					var debug_block = debug_block_scene.instantiate()
					debug_block.position = cell_position
					blocks.add_child(debug_block)
					
func show_cleaar_screen() -> void:
	cleaar_screen.visible = true

func _on_stage_select_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/stage_select.tscn")
