extends TileMap

@export var cols = 10
@export var rows = 10
@export var numOfMines = 10
<<<<<<< HEAD

@export var main_source_id = 0
@export var closed_tile_atlas_pos = Vector2i(0, 0)
@export var opened_tile_atlas_pos = Vector2i(6, 0)


@export var soil_layer_node: TileMap

#const opened_tile_atlas_pos = Vector2i(6, 0)
#const main_source_id = 14

=======
@export var soil_layer_node: TileMap

const opened_tile_atlas_pos = Vector2i(6, 0)
const main_source_id = 14
>>>>>>> parent of 4793f05 (Revert "BUTTONSSS")

const covered_tile_atlas_pos = Vector2i(0,0)
const flag_tile_atlas_pos = Vector2i(5,0)

var revealed_cells = []
var flagged_cells = []
#Raynee:
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())
<<<<<<< HEAD

			print(clicked_cell_coord)
			set_cell(0, clicked_cell_coord, main_source_id, opened_tile_atlas_pos)

=======
>>>>>>> parent of 4793f05 (Revert "BUTTONSSS")

			#print(clicked_cell_coord)
			#set_cell(0, clicked_cell_coord, main_source_id, opened_tile_atlas_pos)
			
			if is_inside_bounds(clicked_cell_coord):
				if not clicked_cell_coord in flagged_cells:
					flood_fill(clicked_cell_coord)
			
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())
			
			if is_inside_bounds(clicked_cell_coord) and not clicked_cell_coord in revealed_cells:
				toggle_flag(clicked_cell_coord)
<<<<<<< HEAD

=======
>>>>>>> parent of 4793f05 (Revert "BUTTONSSS")
#hihihi
func flood_fill(cell: Vector2i):
	if not is_inside_bounds(cell) or cell in flagged_cells:		return
		
	if cell in revealed_cells:
		return
		
	revealed_cells.append(cell)
	set_cell(0, cell, -1)
	
	if is_mine(cell):
		return

	if get_neighbor_mine_count(cell) > 0:
		return
		
	for x in range(-1, 2):
		for y in range(-1, 2):
			if x == 0 and y == 0:
				continue
				
			var neighbor = Vector2i(cell.x + x, cell.y + y)
			flood_fill(neighbor)

func is_inside_bounds(cell: Vector2i) -> bool:
	return cell.x >= 0 and cell.x < cols and cell.y >= 0 and cell.y < rows

func is_mine(cell: Vector2i) -> bool:
	if not soil_layer_node:
		return false
	var atlas = soil_layer_node.get_cell_atlas_coords(0, cell)
	return atlas == Vector2i(2, 0)

func get_neighbor_mine_count(cell: Vector2i) -> int:
	if not soil_layer_node:
		return 0
	var atlas = soil_layer_node.get_cell_atlas_coords(0, cell)
	if atlas == Vector2i(0, 1): return 1
	if atlas == Vector2i(1, 1): return 2
	if atlas == Vector2i(2, 1): return 3
	if atlas == Vector2i(3, 1): return 4
	if atlas == Vector2i(4, 1): return 5
	if atlas == Vector2i(5, 1): return 6
	if atlas == Vector2i(6, 1): return 7
	if atlas == Vector2i(1, 0): return 8
	return 0

func toggle_flag(cell: Vector2i):
	if cell in flagged_cells:
		flagged_cells.erase(cell)
		set_cell(0, cell, main_source_id, covered_tile_atlas_pos)
	else:
		flagged_cells.append(cell)
		set_cell(0, cell, main_source_id, flag_tile_atlas_pos)
