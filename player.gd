extends CharacterBody2D

var jumlah_koin = 0

const tile_size: Vector2 = Vector2(8, 8)
var sprite_node_poss_tween: Tween

func _physics_process(delta: float) -> void:
	if !sprite_node_poss_tween or !sprite_node_poss_tween.is_running():
		if Input.is_action_just_pressed("ui_up") and !$up.is_colliding():
			_move(Vector2(0, -1))
		if Input.is_action_just_pressed("ui_down") and !$down.is_colliding():
			_move(Vector2(0, 1))
		if Input.is_action_just_pressed("ui_left") and !$left.is_colliding():
			_move(Vector2(-1, 0))
		if Input.is_action_just_pressed("ui_right") and !$right.is_colliding():
			_move(Vector2(1, 0))
	
func _move(dir : Vector2):
	global_position += dir *tile_size
	$Sprite2D.global_position -= dir * tile_size
	
	if sprite_node_poss_tween:
		sprite_node_poss_tween.kill()
	sprite_node_poss_tween = create_tween()
	sprite_node_poss_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_poss_tween.tween_property($Sprite2D, "global_position", global_position, 0.185)
	
func ambil_koin():
	jumlah_koin += 1
	print("Koin terkumpul: ", jumlah_koin)
	get_tree().call_group("spawner", "koin_diambil")
	get_tree().call_group("hud", "set_koin", jumlah_koin)
	
