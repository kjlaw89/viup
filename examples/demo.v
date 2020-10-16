module main

import os
import viup

fn main() {
	viup.open(os.args)

	label := viup.label("Hello from IUP", "expand=horizontal")
	button := viup.button("Get Window Position", "")
	link := viup.link("https://www.google.com", "Google.com")
	progress := viup.progress("marquee=yes")
	spin := viup.spin_box(viup.text("spin"))

	toggle1 := viup.toggle("Toggle 1", "action1")
	toggle2 := viup.toggle("Toggle 2", "action2")

	slider := viup.slider("horizontal")

	colors := viup.color_browser()

	picker := viup.date_picker("order=MDY")

	multiline := viup.multiline("multiline")

	dialog := viup.dialog(
		viup.vbox([label, button, link, progress, spin, toggle1, toggle2, slider, colors, picker, multiline]), "title=Hello World 2", "rastersize=640x480"
	)

	dialog.show_xy(viup.Pos.center, viup.Pos.center)
	button.set_data("window", dialog)
	button.set_data("label", label)
	button.callbacks(viup.ActionFunc(button_clicked), viup.MouseButtonFunc(mouse_event))

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

fn mouse_event(control &viup.Control, button viup.MouseButton, pressed bool, x int, y int, status charptr) {
	println("Mouse event: $button, $pressed, $x, $y")
}