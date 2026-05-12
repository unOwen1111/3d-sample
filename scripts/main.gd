extends Node3D


var floor_only_scene = preload("res://scenes/floor_only.tscn")
var floor_and_wall_scene = preload("res://scenes/floor_and_wall.tscn")
var floor_and_player_scene = preload("res://scenes/floor_and_player.tscn")
var floor_and_goal_scene = preload("res://scenes/floor_and_goal.tscn")

func _ready() -> void:
	create_maze()

func create_maze() -> void:
	for y in range(Global.maze.size()):
		for x in range(Global.maze[y].size()):
			var position = Vector3(x * Global.CELL_SIZE, 0, y * Global.CELL_SIZE)

			match Global.maze[y][x]:
				Global.BlockPattern.FLOOR_ONLY:
					var floor_only = floor_only_scene.instantiate()
					floor_only.position = position
					add_child(floor_only)
				Global.BlockPattern.FLOOR_AND_WALL:
					var floor_and_wall = floor_and_wall_scene.instantiate()
					floor_and_wall.position = position
					add_child(floor_and_wall)
				Global.BlockPattern.FLOOR_AND_PLAYER:
					var floor_and_player = floor_and_player_scene.instantiate()
					floor_and_player.position = position
					add_child(floor_and_player)
				Global.BlockPattern.FLOOR_AND_GOAL:
					var floor_and_goal = floor_and_goal_scene.instantiate()
					floor_and_goal.position = position
					add_child(floor_and_goal)
