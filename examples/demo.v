module main

import os
import viup

fn main() {
	viup.open(os.args)

	label := viup.label("Hello from IUP")
	button := viup.button("VIUP Button!", "")
	button.watch("ACTION", button_action)

	dialog := viup.dialog(viup.vbox([label, button], "margin=15x15"), "title=Hello World 2", "rastersize=640x480")
	dialog.show_xy(viup.Pos.center, viup.Pos.center)

	viup.main_loop()
	viup.close()
}

fn button_action(control voidptr) int {
	println("action")
	return 1
}