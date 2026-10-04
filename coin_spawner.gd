extends Node2D

@export var coin_scene: PackedScene
@export var player: Node2D
@export var grid_size: int = 8
@export var grid_cols: int = 18
@export var grid_rows: int = 8

var koin_aktif: Node2D = null

func _ready():
	add_to_group("spawner")
	spawn_coin()

func koin_diambil():
	print("koin diambil -> spawn baru")
	if is_instance_valid(koin_aktif):
		koin_aktif.queue_free()   
	koin_aktif = null
	spawn_coin.call_deferred()

func spawn_coin():
	if is_instance_valid(koin_aktif):
		return

	var player_cell := Vector2i(-1, -1)
	if is_instance_valid(player):
		player_cell = Vector2i((to_local(player.global_position) / grid_size).floor())

	var sel_kosong: Array[Vector2i] = []
	for x in range(1, grid_cols):
		for y in range(1, grid_rows):
			var s := Vector2i(x, y)
			if s != player_cell:
				sel_kosong.append(s)

	var sel: Vector2i = sel_kosong.pick_random()
	koin_aktif = coin_scene.instantiate()
	koin_aktif.z_index = 10
	koin_aktif.position = Vector2(sel) * grid_size
	add_child(koin_aktif)
	print("koin di sel ", sel, " | global ", koin_aktif.global_position)
	
