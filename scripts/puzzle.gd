extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tekst := "Piece"
	for i in 9:
		$Path3D/PathFollow3D.set_progress_ratio(randf())
		var obiekt := tekst + str(i + 2)
		get_node(obiekt).set_position($Path3D/PathFollow3D.get_position())
		get_node(obiekt).set_rotation(Vector3(
				randf_range(0, 6.28),
				randf_range(0, 6.28),
				randf_range(0, 6.28)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
