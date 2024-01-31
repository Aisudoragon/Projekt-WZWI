extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Ułożenie klocków losowo wokół pierwszego elementu
	var puzel := "Piece"
	for i in 8:
		$Path3D/PathFollow3D.set_progress_ratio(randf())
		var obiekt := puzel + str(i + 3)
		get_node(obiekt).set_position($Path3D/PathFollow3D.get_position())
		get_node(obiekt).set_rotation(Vector3(
				randf_range(0, 6.28),
				randf_range(0, 6.28),
				randf_range(0, 6.28)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# TODO ODLEGŁOŚĆ 0.03 - 0.04
	# Teleportuj klocek na stół po spadnięciu na podłogę
	var puzel := "Piece"
	var cel := "Pedestal/Piece"
	for i in 10:
		var obiekt := puzel + str(i + 1)
		if get_node(obiekt).global_position.y <= 0.25:
			get_node(obiekt).set_position(Vector3(
					randf_range(-0.5, 0.5), 0.0, randf_range(-0.5, 0.5)))
		
		var marker := cel + str(i + 1)
		if get_node(obiekt).get_global_position().distance_to(get_node(marker).get_global_position()) <= 0.4:
			print("ELEMENT NA MIEJSCU")
