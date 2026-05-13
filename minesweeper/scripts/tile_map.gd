extends TileMap
@export var cols = 10
@export var rows = 10
@export var numOfMines = 10

const opened_tile_atlas_pos = Vector2i(6, 0)
const main_source_id = 0

#Raynee:
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())

			print(clicked_cell_coord)
			set_cell(0, clicked_cell_coord, main_source_id, opened_tile_atlas_pos)
#hihihi
