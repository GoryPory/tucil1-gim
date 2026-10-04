extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("ambil_koin"):
		body.ambil_koin()
		queue_free()
