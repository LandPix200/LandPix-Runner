extends TileMap


const fruit = preload("res://Objects/Powerups/Fruits/Fruit.tscn")
const box1 = preload("res://Objects/Items/Boxes/Box.tscn")

enum {
	POMME = 0,
	BOX1 = 1
}

func _ready():
	var cells = get_used_cells()
	for cell in cells:
		var cell_type = get_cell(cell.x, cell.y)
		var f = null
		
		if cell_type == POMME:
			f = fruit.instance()
			
		if cell_type == BOX1:
			f = box1.instance()
			
			
		if not f == null:
			add_child(f)
			f.global_position = cell * cell_size + Vector2(16, 16)
	
	tile_set = null
	
	
