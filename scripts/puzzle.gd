extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Ułożenie klocków losowo wokół pierwszego elementu
	for i in 7:
		$Path3D/PathFollow3D.set_progress_ratio(randf())
		var obiekt := get_node("Piece" + str(i + 1))
		obiekt.set_position($Path3D/PathFollow3D.get_position())
		obiekt.set_rotation(Vector3(
				randf_range(0, 6.28),
				randf_range(0, 6.28),
				randf_range(0, 6.28)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Teleportuj klocek na stół po spadnięciu na podłogę
	for i in 7:
		var obiekt := get_node("Piece" + str(i + 1))
		if obiekt.global_position.y <= 0.25:
			obiekt.set_position(Vector3(
					randf_range(-0.5, 0.5), 0.0, randf_range(-0.5, 0.5)))
		
		# UUmieść klocek na miejscu po zbliżeniu go an miejsce
		var marker := get_node("Pedestal/Piece" + str(i + 1))
		if (
				obiekt.get_global_position().distance_to(
						marker.get_global_position()) <= 0.02
				and obiekt.is_freeze_enabled() == not true
				and obiekt.rotation.x - marker.rotation.x <= 0.05
				and obiekt.rotation.x - marker.rotation.x >= -0.05
				and obiekt.rotation.y - marker.rotation.y <= 0.05
				and obiekt.rotation.y - marker.rotation.y >= -0.05
				and obiekt.rotation.z - marker.rotation.z <= 0.05
				and obiekt.rotation.z - marker.rotation.z >= -0.05
		):
			print("ELEMENT NA MIEJSCU")
			obiekt.set_freeze_enabled(true)
			obiekt.set_rotation(Vector3.ZERO)
			obiekt.set_global_position(marker.get_global_position())
