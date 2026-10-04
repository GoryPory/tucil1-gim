extends Label

func _ready():
	add_to_group("hud")
	text = "Koin: 0"

func set_koin(jumlah: int):
	text = "Koin: %d" % jumlah
