module viup

fn C.IupDialog(voidptr) voidptr

fn C.IupShowXY(voidptr, int, int)

pub fn dialog(child &Control, attrs ...string) &Control {
	dialog := &Control(C.IupDialog(child))
	dialog.set_attrs(attrs)
	return dialog
}

pub fn (control &Control) set_menu(name string, menu &Control) {
	set_handle(name, menu)
	control.set_attr("menu", name)
}

// show_xy shows the dialog the the provided X/Y coordinates
// Note: Only to be used with dialogs
pub fn (control &Control) show_xy(x int, y int) {
	C.IupShowXY(control, x, y)
}
