module main

import os
import viup

fn main() {
	viup.open(os.args)

	viup.file_dialog("title=Open file...").set_handle("open_dialog")
	viup.file_dialog("title=Save file...", "dialogtype=save").set_handle("save_dialog")

	menu_event := viup.ActionFunc(menu_clicked)
	menu := viup.menu([
		viup.sub_menu("&File", viup.menu([
			viup.menu_item("&Open File...", "", "name=MenuOpen").callback(menu_event)
			viup.menu_item("&Save File...", "", "name=MenuSave").callback(menu_event)
			viup.menu_sep()
			viup.menu_item("E&xit", "", "name=MenuExit").callback(menu_event)
		])),
		viup.sub_menu("&Edit", viup.menu([
			viup.menu_item("C&ut", "", "name=MenuCut").callback(menu_event),
			viup.menu_item("&Copy", "", "name=MenuCopy").callback(menu_event),
			viup.menu_item("&Paste", "", "name=MenuPaste").callback(menu_event)
		])),
		viup.sub_menu("&Help", viup.menu([
			viup.menu_item("&Documentation", "", "name=MenuDocumentation").callback(menu_event),
			viup.menu_sep()
			viup.menu_item("&About", "", "name=MenuAbout").callback(menu_event)
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

	hbox :=
	viup.hbox([
		viup.vbox([
			viup.frame(
				viup.vbox([
					viup.button("Button", "", "expand=horizontal").callback(viup.ActionFunc(button_clicked))
					viup.toggle("Checkbox", "action1")
					viup.text("", "expand=horizontal")
					viup.label("Label")
					viup.link("https://www.vlang.io", "Link")
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
				"minsize=400x",
			)
			viup.frame(
				viup.vbox([
					viup.list(
						"",
						"1=Item 1",
						"2=Item 2",
						"3=Item 3",
						"4=Item 4",
						"dropdown=yes",
						"expand=horizontal",
						"value=1"
					)
					viup.list(
						"",
						"1=Item 1",
						"2=Item 2",
						"3=Item 3",
						"4=Item 4",
						"dropdown=yes",
						"editbox=yes",
						"expand=horizontal",
					)
					viup.radio_group(
						viup.vbox([
							viup.toggle("Radio 1", "")
							viup.toggle("Radio 2", "")
							viup.toggle("Radio 3", "")
						])
					)
				]),
				"title=Lists",
				"margin=10x10"
			)
			viup.tabs([
				viup.hbox([viup.label("In tab 1"), viup.fill()], "tabtitle=Tab 1")
				viup.hbox([viup.label("In tab 2")], "tabtitle=Tab 2")
				viup.hbox([viup.label("In tab 3")], "tabtitle=Tab 3")
			])
		], "gap=10")
	], "margin=10x10")

	dialog := viup.dialog(viup.scroll(hbox), "title=Kitchen Sink")
	dialog.set_menu("app_menu", menu)
	dialog.show_xy(viup.Pos.center, viup.Pos.center)

	viup.main_loop()
	viup.close()
}

fn menu_clicked(control &viup.Control) viup.FuncResult {
	name := control.get_attr("name")
	match name {
		"MenuOpen" {
			dialog := viup.get_handle("open_dialog")
			dialog.popup(viup.Pos.current, viup.Pos.current)

			if dialog.get_int("status") == 0 {
				value := dialog.get_attr("value")
				viup
					.message_dialog("title=File Opened", "value=The file '$value' was opened.", "dialogtype=information")
					.popup(viup.Pos.current, viup.Pos.current)
					.destroy()
			}
		}
		"MenuSave" {
			dialog := viup.get_handle("save_dialog")
			dialog.popup(viup.Pos.current, viup.Pos.current)

			if dialog.get_int("status") != -1 {
				value := dialog.get_attr("value")
				viup
					.message_dialog(
						"buttons=OKCANCEL",
						"dialogtype=warning",
						"title=File Save",
						"value=The file '$value' was not actually saved, but this is where you would do it.",
					)
					.popup(viup.Pos.current, viup.Pos.current)
					.destroy()
			}
		}
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