extends TileMap
@export var columns = 10
@export var rows = 10
@export var numOfMines = 10

#Uses Atlas Coordinates from TileMap,
#source by https://www.youtube.com/watch?v=vEyDbROrw0Q
const main_source_id = 14
const opened_tile_atlas_pos = Vector2i(6, 0)
const bombed_tile_atlas_pos = Vector2i(2, 0)
const clicked_bombed_tile_atlas_pos = Vector2i(3, 0)

#Raynee:
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())

			print(clicked_cell_coord)
			set_cell(0, clicked_cell_coord, main_source_id, opened_tile_atlas_pos)
#hihihi

#Anna
func add_mines():
	for i in numOfMines:
		var mineCoordinates = Vector2i(randi_range(0, 10), randi_range(0, 10))
