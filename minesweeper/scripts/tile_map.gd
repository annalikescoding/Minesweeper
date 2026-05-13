extends TileMap
@export var cols = 10
@export var rows = 10
@export var numOfMines = 10

###Uses Atlas Coordinates from TileMap,
###source by https://www.youtube.com/watch?v=vEyDbROrw0Q
const main_source_id = 14
const opened_tile_atlas_pos = Vector2i(6, 0)
const bombed_tile_atlas_pos = Vector2i(2, 0)
const clicked_bombed_tile_atlas_pos = Vector2i(3, 0)
const one_tile_atlas_pos = Vector2i(0, 1)
const two_tile_atlas_pos = Vector2i(1, 1)
const three_tile_atlas_pos = Vector2i(2, 1)
const four_tile_atlas_pos = Vector2i(3, 1)
const five_tile_atlas_pos = Vector2i(4, 1)
const six_tile_atlas_pos = Vector2i(5, 1)
const seven_tile_atlas_pos = Vector2i(6, 1)
const eight_tile_atlas_pos = Vector2i(1, 0)

func _ready():
	newGame()
	print(safeCells())
	print()
	print(adjacentCells())
	
func newGame():
	addMines()
	addNumbers()

#Raynee:
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell_coord = local_to_map(get_local_mouse_position())

			print(clicked_cell_coord)
			set_cell(0, clicked_cell_coord, main_source_id, opened_tile_atlas_pos)
#hihihi

#Anna
func addMines():
	for i in numOfMines:
		var mineCoordinates = Vector2i(randi_range(0, cols - 1), randi_range(0, rows - 1))
		set_cell(0, mineCoordinates, main_source_id, bombed_tile_atlas_pos)

func isMine(x, y):
	return get_cell_atlas_coords(0, Vector2i(x, y)) == Vector2i(2, 0) #Google Gemini Search

func safeCells():
	@warning_ignore("shadowed_variable")
	var safeCells = []
	for x in (cols):
		for y in (rows):
			if not isMine(x, y):
				safeCells.append(Vector2i(x, y))
	return safeCells

func adjacentCells():
	@warning_ignore("shadowed_variable")
	var adjacentCells = []
	
	for x in (cols):
		for y in (rows):
			if y != 0:
				if isMine(x, y - 1):
					adjacentCells.append(Vector2i(x, y))
			if y != rows - 1:
				if isMine(x, y + 1):
					adjacentCells.append(Vector2i(x, y))
			if x != cols - 1:
				if isMine(x + 1, y):
					adjacentCells.append(Vector2i(x, y))
			if x != 0:
				if isMine(x - 1, y):
					adjacentCells.append(Vector2i(x, y))
			if x != 0 && y != 0:
				if isMine(x - 1, y - 1):
					adjacentCells.append(Vector2i(x, y))
			if x != cols - 1 && y != 0:
				if isMine(x + 1, y - 1):
					adjacentCells.append(Vector2i(x, y))
			if x != 0 && y != rows - 1:
				if isMine(x - 1, y + 1):
					adjacentCells.append(Vector2i(x, y))
			if x != cols - 1 && y != rows - 1:
				if isMine(x + 1, y + 1):
					adjacentCells.append(Vector2i(x, y))
	return adjacentCells

func addNumbers():
	var adjList = adjacentCells()
	adjList.sort()
	
	var prevCell = adjList.get(0)
	var mineCount = 0
	
	for cell in adjList:
		if cell == prevCell:
			mineCount += 1
		else:
			setNumCell(prevCell, mineCount)
			prevCell = cell
			mineCount = 1
		setNumCell(prevCell, mineCount)

func setNumCell(cell, mineCount):
	if not isMine(cell.x, cell.y):
		if mineCount == 1:
			set_cell(0, cell, main_source_id, one_tile_atlas_pos)
		else: if mineCount == 2:
			set_cell(0, cell, main_source_id, two_tile_atlas_pos)
		else: if mineCount == 3:
			set_cell(0, cell, main_source_id, three_tile_atlas_pos)
		else: if mineCount == 4:
			set_cell(0, cell, main_source_id, four_tile_atlas_pos)
		else: if mineCount == 5:
			set_cell(0, cell, main_source_id, five_tile_atlas_pos)
		else: if mineCount == 6:
			set_cell(0, cell, main_source_id, six_tile_atlas_pos)
		else: if mineCount == 7:
			set_cell(0, cell, main_source_id, seven_tile_atlas_pos)
		else: if mineCount == 8:
			set_cell(0, cell, main_source_id, eight_tile_atlas_pos)
