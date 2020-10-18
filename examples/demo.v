module main

import os
import viup

fn main() {
	viup.open(os.args)

	menu := viup.menu([
		viup.sub_menu("&File", viup.menu([
			viup.menu_item("&Exit", "exit")
		])),
		viup.sub_menu("&Edit", viup.menu([
			viup.menu_item("C&ut", "cut"),
			viup.menu_item("&Copy", "copy"),
			viup.menu_item("&Paste", "paste")
		])),
		viup.sub_menu("&Help", viup.menu([
			viup.menu_item("&Documentation", "documentation"),
			viup.menu_sep()
			viup.menu_item("&About", "about")
		]))
	])

	label := viup.label("Hello from IUP", "expand=horizontal")
	button := viup
		.button("Get Window Position", "")
		.callbacks(viup.ActionFunc(button_clicked), viup.MouseButtonFunc(mouse_event))

	link := viup.link("https://www.google.com", "Google.com")
	progress := viup.progress("marquee=yes", "expand=horizontal")
	spin := viup.spin_box(viup.text("spin", "expand=horizontal"))

	toggle1 := viup.toggle("Toggle 1", "action1")
	toggle2 := viup.toggle("Toggle 2", "action2")

	slider := viup.slider("horizontal", "expand=horizontal", "showticks=yes", "step=5", "tickspos=reverse")

	colors := viup.color_browser()

	picker := viup.date_picker("order=MDY")

	//multiline := viup.multiline("multiline")


	hbox := viup.hbox([
		viup.vbox([
			viup.frame(
				viup.vbox([
					label,
					button,
					viup.fill()
				]),
				"title=Basic Controls",
				"margin=10x10"
			)
		], "expand=vertical", "gap=10")
		viup.vbox([
			viup.frame(
				viup.vbox([
					spin,
					slider,
					progress,
					viup.fill()
				]),
				"title=Numbers",
				"margin=10x10"
			)
		], "gap=10")
	], "margin=10x10")

	scroll := viup.scroll(hbox)

	dialog := viup.dialog(scroll, "title=Hello World 2")
	dialog.set_menu("app_menu", menu)

	dialog.show_xy(viup.Pos.center, viup.Pos.center)
	//dialog.callback(viup.KeyFunc(key_event))

	/*button.set_data("window", dialog)
	button.set_data("label", label)
	button.callbacks(viup.ActionFunc(button_clicked), viup.MouseButtonFunc(mouse_event))*/

	viup.main_loop()
	viup.close()
}

fn button_clicked(control &viup.Control) viup.FuncResult {
	window := &viup.Control(control.get_data("window"))
	label  := &viup.Control(control.get_data("label"))
	label.set_attr("title", "Window Size: ${window.current_width}x${window.current_height}")
	return .ignore
}

fn key_event(control &viup.Control, key viup.Key) viup.FuncResult {
	num := int(key)
	println("Key Pressed $key - $num")

	if viup.is_shift(key) {
		println("shifted")
	}

	if viup.is_ctrl(key) {
		ckey := viup.get_key(key)
		num2 := int(ckey)
		println("ctrl $ckey - $num2")
	}

	return .ignore
}

fn mouse_event(control &viup.Control, button viup.MouseButton, pressed bool, x int, y int, status charptr) {
	println("Mouse event: $button, $pressed, $x, $y")
}