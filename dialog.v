module viup

fn C.IupElementPropertiesDialog(voidptr, voidptr) voidptr

fn C.IupColorDlg() voidptr

fn C.IupDialog(voidptr) voidptr

fn C.IupFileDlg() voidptr

fn C.IupFontDlg() voidptr

fn C.IupMessageDlg() voidptr

fn C.IupLayoutDialog(voidptr) voidptr

fn C.IupPopup(voidptr) int

fn C.IupShow(voidptr) int

fn C.IupShowXY(voidptr, int, int)

// color_dialog opens a color picker with optional palette
pub fn color_dialog(attrs ...string) &Control {
	dialog := &Control(C.IupColorDlg())
	dialog.set_attrs(attrs)

	return dialog
}

// debug shows a layout dialog that can be used to
// inspect the provided Dialog's layout
// Note: This is intended for developers
pub fn (control &Control) debug() &Control {
	dialog := &Control(C.IupLayoutDialog(control))
	return dialog.show()
}

// debug_props shows a properites dialog that can be used to
// inspect the provided control's various properties
// Note: This is intended for developers
pub fn (control &Control) debug_props() &Control {
	dialog := &Control(C.IupElementPropertiesDialog(C.NULL, control))
	return dialog.show()
}

// dialog creates a standard Window or Modal dialog control
pub fn dialog(child &Control, attrs ...string) &Control {
	dialog := &Control(C.IupDialog(child))
	dialog.set_attrs(attrs)
	return dialog
}

// file_dialog creates a file chooser dialog that can be used to
// open or save files. If "dialogtype" is not provided, defaults to "open"
pub fn file_dialog(attrs ...string) &Control {
	dialog := &Control(C.IupFileDlg())
	dialog.set_attr("dialogtype", "open")
	dialog.set_attrs(attrs)
	return dialog
}

// font_dialog opens a font picker dialog
pub fn font_dialog(attrs ...string) &Control {
	dialog := &Control(C.IupFontDlg())
	dialog.set_attrs(attrs)
	return dialog
}

// message_dialog opens customizable message modal box
pub fn message_dialog(attrs ...string) &Control {
	dialog := &Control(C.IupMessageDlg())
	dialog.set_attrs(attrs)
	return dialog
}

// popup displays the dialog as a modal at `x`, `y` position
pub fn (control &Control) popup(x int, y int) &Control {
	C.IupPopup(control, x, y)
	return control
}

// set_menu sets the provided menu to this control
pub fn (control &Control) set_menu(name string, menu &Control) &Control {
	set_handle(name, menu)
	return control.set_attr("menu", name)
}

// show shows the dialog (not as a modal), typically
// centered on the opening dialog control
pub fn (control &Control) show() &Control {
	C.IupShow(control)
	return control
}

// show_xy shows the dialog the the provided X/Y coordinates
// Note: Only to be used with dialogs
pub fn (control &Control) show_xy(x int, y int) &Control {
	C.IupShowXY(control, x, y)
	return control
}
