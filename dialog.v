module viup

fn C.IupDialog(voidptr) voidptr

fn C.IupShowXY(voidptr, int, int)

pub fn dialog(child &Control, attrs ...string) &Control {
	dialog := &Control(C.IupDialog(child))
	dialog.apply_attrs(attrs)
	return dialog
}

pub fn (control &Control) show_xy(x int, y int) {
	/*
	if control.@type != "dialog" {
		return
	}
	*/
	C.IupShowXY(control, x, y)
}
