module main

import os
import viup

fn main() {
	viup.open(os.args)

	label := viup.label("Hello from IUP", "expand=horizontal")
	button := viup.button("Get Window Position", "")
	button.callback(viup.ActionFunc(button_clicked))
	button.callback(viup.MouseButtonFunc(mouse_event))

	calendar := viup.calendar()

	dialog := viup.dialog(viup.vbox([label, button, calendar], "margin=15x15"), "title=Hello World 2", "rastersize=640x480")
	dialog.show_xy(viup.Pos.center, viup.Pos.center)
	button.set_data("window", dialog)
	button.set_data("label", label)

	println("Window position: $dialog.current_width, $dialog.current_height")

	viup.main_loop()
	viup.close()
}

fn button_clicked(control &viup.Control) int {
	window := &viup.Control(control.get_data("window"))
	label  := &viup.Control(control.get_data("label"))
	label.set_attr("title", "Window Size: ${window.current_width}x${window.current_height}")
	return 1
}

fn mouse_event(control &viup.Control, button viup.MouseButton, pressed bool, x, y int, status charptr) {
	println("Mouse event: $button, $pressed, $x, $y")
}