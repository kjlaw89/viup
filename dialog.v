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

struct Dialog {
	Control
}

// color_dialog opens a color picker with optional palette
pub fn color_dialog(handle string, attrs ...string) &Dialog {
	dialog := &Dialog(C.IupColorDlg())
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)

	return dialog
}

// debug shows a layout dialog that can be used to
// inspect the provided Dialog's layout
// Note: This is intended for developers
pub fn (control &Control) debug() &Dialog {
	dialog := &Dialog(C.IupLayoutDialog(control))
	return dialog.show()
}

// debug_props shows a properites dialog that can be used to
// inspect the provided control's various properties
// Note: This is intended for developers
pub fn (control &Control) debug_props() &Dialog {
	dialog := &Dialog(C.IupElementPropertiesDialog(C.NULL, control))
	return dialog.show()
}

// dialog creates a standard Window or Modal dialog control
pub fn dialog(child &Control, handle string, attrs ...string) &Dialog {
	dialog := &Dialog(C.IupDialog(child))
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// file_dialog creates a file chooser dialog that can be used to
// open or save files. If "dialogtype" is not provided, defaults to "open"
pub fn file_dialog(handle string, attrs ...string) &Dialog {
	dialog := &Dialog(C.IupFileDlg())
	dialog.set_handle(handle)
	dialog.set_attr('dialogtype', 'open')
	dialog.set_attrs(...attrs)
	return dialog
}

// font_dialog opens a font picker dialog
pub fn font_dialog(handle string, attrs ...string) &Dialog {
	dialog := &Dialog(C.IupFontDlg())
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// message_dialog opens customizable message modal box
pub fn message_dialog(attrs ...string) &Dialog {
	dialog := &Dialog(C.IupMessageDlg())
	dialog.set_attrs(...attrs)
	return dialog
}

// popup displays the dialog as a modal at `x`, `y` position
pub fn (dialog &Dialog) popup(x int, y int) &Dialog {
	C.IupPopup(dialog, x, y)
	return dialog
}

// set_menu sets the provided menu to this control
pub fn (dialog &Dialog) set_menu(name string, menu &Control) &Dialog {
	set_handle(name, menu)
	dialog.set_attr('menu', name)
	return dialog
}

// show shows the dialog (not as a modal), typically
// centered on the opening dialog control
pub fn (dialog &Dialog) show() &Dialog {
	C.IupShow(dialog)
	return dialog
}

// show_xy shows the dialog the the provided X/Y coordinates
// Note: Only to be used with dialogs
pub fn (dialog &Dialog) show_xy(x int, y int) &Dialog {
	C.IupShowXY(dialog, x, y)
	return dialog
}
