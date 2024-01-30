extends Node

var xr_interface: XRInterface


func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")


func _input(event):
	# Przechwytywanie myszki w celu sterowania kamerą
	if (
			event.is_action_pressed("ui_cancel")
			and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
		):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if (
			event.is_action_pressed("capture_mouse")
			and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE
	):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
