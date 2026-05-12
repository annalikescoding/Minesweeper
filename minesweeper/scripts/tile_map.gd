extends TileMap

#Raynee:
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())

			print(clicked_cell_coord)
			set_cell(0, clicked_cell_coord, -1)
