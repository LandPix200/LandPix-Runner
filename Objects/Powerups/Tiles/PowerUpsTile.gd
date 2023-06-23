extends TileMap


const fruit = preload("res://Objects/Powerups/Fruits/Fruit.tscn")

func _ready():
	var cells = get_used_cells()
	for cell in cells:
		var f = fruit.instance()
		add_child(f)
		f.global_position = cell * cell_size
	
	tile_set = null
	
	
