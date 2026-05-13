extends Node3D


var debug_mode = false
var grass_texture := preload("res://assets/grass.png")
var stone_floor_texture := preload("res://assets/stone_floor.png")
@onready var mesh = $Floor/MeshInstance3D
var current_texture

func change_texture():
	debug_mode = !debug_mode
	if debug_mode:
		current_texture = grass_texture
	else:
		current_texture = stone_floor_texture
	
	var material := StandardMaterial3D.new()
	material.albedo_texture = current_texture
	mesh.set_surface_override_material(0, material)
