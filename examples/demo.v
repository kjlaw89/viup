module main

import os
import viup

fn main() {
	viup.open(os.args)

	menu := viup.menu([
		viup.sub_menu("&File", viup.menu([
			viup.menu_item("E&xit", "", "name=MenuExit").callback(viup.ActionFunc(menu_clicked))
		])),
		viup.sub_menu("&Edit", viup.menu([
			viup.menu_item("C&ut", "", "name=MenuCut").callback(viup.ActionFunc(menu_clicked)),
			viup.menu_item("&Copy", "", "name=MenuCopy").callback(viup.ActionFunc(menu_clicked)),
			viup.menu_item("&Paste", "", "name=MenuPaste").callback(viup.ActionFunc(menu_clicked))
		])),
		viup.sub_menu("&Help", viup.menu([
			viup.menu_item("&Documentation", "", "name=MenuDocumentation").callback(viup.ActionFunc(menu_clicked)),
			viup.menu_sep()
			viup.menu_item("&About", "", "name=MenuAbout").callback(viup.ActionFunc(menu_clicked))
		]))
	])

    // Layout design
	// ----------------- hbox ------------------
	// ------vbox------- ---------vbox----------
	// |---frame "BC"--| |----frame "Numbers"--|  "BC" - "Basic Controls"
	// | button        | | spin                |
	// | toggle        | | slider ('value')    |
	// | text          | | progress            |
	// | label         | |---------------------|
	// | divider       | |----frame "Lists"----|
	// | date_picker   | | dropdown            |
	// | color_browser | | editable-dropdown   |
	// | fill          | | radio-group         |
	// |               | |---------------------|
	// |               | | tab-group           |
	// |---------------| |---------------------|

	hbox := viup.hbox([
		viup.vbox([
			viup.frame(
				viup.vbox([
					viup.button("Button", "").callback(viup.MouseButtonFunc(mouse_event))
					viup.toggle("Checkbox", "action1")
					viup.label("Label")
					viup.link("https://www.vlang.io", "V Programming Language")
					viup.divider()
					viup.date_picker("order=MMMDY", "expand=horizontal")
					viup.color_browser()
					viup.fill()
				]),
				"title=Basic Controls",
				"margin=10x10"
			)
		], "expand=vertical", "gap=10")
		viup.vbox([
			viup.frame(
				viup.vbox([
					viup
						.text("", "expand=horizontal", "spin=yes", "spinmax=100", "value=50")
						.set_handle("spin1")
						.callback(viup.ValueChangedFunc(numbers_changed))
					viup
						.slider("horizontal", "expand=horizontal", "max=100", "showticks=yes", "step=5", "tickspos=reverse", "value=50")
						.set_handle("slider1")
						.callback(viup.ValueChangedFunc(numbers_changed))
					viup.progress("expand=horizontal", "max=100", "value=50").set_handle("progress1")
					viup.fill()
				]),
				"title=Numbers",
				"margin=10x10",
				"minsize=400x"
			)
		], "gap=10")
	], "margin=10x10")

	dialog := viup.dialog(viup.scroll(hbox), "title=Control Sampler")
	dialog.set_menu("app_menu", menu)
	dialog.show_xy(viup.Pos.center, viup.Pos.center)
	dialog.callback(viup.KeyFunc(key_event))

	viup.main_loop()
	viup.close()
}

fn menu_clicked(control &viup.Control) viup.FuncResult {
	name := control.get_attr("name")
	match name {
		"MenuExit" { return .close }
		else   { println("Menu $name") }
	}

	return .cont
}

fn numbers_changed(control &viup.Control) viup.FuncResult {
	value := control.get_attr("value")
	viup.get_handle("spin1").set_attr("value", value.int().str())
	viup.get_handle("slider1").set_attr("value", value)
	viup.get_handle("progress1").set_attr("value", value)

	return .cont
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

	return .default
}

fn mouse_event(control &viup.Control, button viup.MouseButton, pressed bool, x int, y int, status charptr) {
	println("Mouse event: $button, $pressed, $x, $y")
}