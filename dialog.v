module viup

fn C.IupElementPropertiesDialog(voidptr, &IHandle) &IHandle

fn C.IupColorDlg() &IHandle

fn C.IupDialog(&IHandle) &IHandle

fn C.IupFileDlg() &IHandle

fn C.IupFontDlg() &IHandle

fn C.IupMessageDlg() &IHandle

fn C.IupLayoutDialog(&IHandle) &IHandle

fn C.IupPopup(&IHandle, x int, y int) int

fn C.IupShow(&IHandle) int

fn C.IupShowXY(&IHandle, int, int)

// color_dialog opens a color picker with optional palette
pub fn color_dialog(handle string, attrs ...string) &IHandle {
	dialog := C.IupColorDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)

	return dialog
}

// debug shows a layout dialog that can be used to
// inspect the provided Dialog's layout
// Note: This is intended for developers
pub fn (control &IHandle) debug() &IHandle {
	dialog := C.IupLayoutDialog(control)
	return dialog.show()
}

// debug_props shows a properites dialog that can be used to
// inspect the provided control's various properties
// Note: This is intended for developers
pub fn (control &IHandle) debug_props() &IHandle {
	dialog := C.IupElementPropertiesDialog(C.NULL, control)
	return dialog.show()
}

// dialog creates a standard Window or Modal dialog control
pub fn dialog(child &IHandle, handle string, attrs ...string) &IHandle {
	dialog := C.IupDialog(child)
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// file_dialog creates a file chooser dialog that can be used to
// open or save files. If "dialogtype" is not provided, defaults to "open"
pub fn file_dialog(handle string, attrs ...string) &IHandle {
	dialog := C.IupFileDlg()
	dialog.set_handle(handle)
	dialog.set_attr('dialogtype', 'open')
	dialog.set_attrs(...attrs)
	return dialog
}

// font_dialog opens a font picker dialog
pub fn font_dialog(handle string, attrs ...string) &IHandle {
	dialog := C.IupFontDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// message_dialog opens customizable message modal box
pub fn message_dialog(attrs ...string) &IHandle {
	dialog := C.IupMessageDlg()
	dialog.set_attrs(...attrs)
	return dialog
}

// popup displays the dialog as a modal at `x`, `y` position
pub fn (dialog &IHandle) popup(x int, y int) &IHandle {
	C.IupPopup(dialog, x, y)
	return dialog
}

// set_menu sets the provided menu to this control
pub fn (dialog &IHandle) set_menu(name string, menu &IHandle) &IHandle {
	set_handle(name, menu)
	dialog.set_attr('menu', name)
	return dialog
}

// show shows the dialog (not as a modal), typically
// centered on the opening dialog control
pub fn (dialog &IHandle) show() &IHandle {
	C.IupShow(dialog)
	return dialog
}

// show_xy shows the dialog the the provided X/Y coordinates
// Note: Only to be used with dialogs
pub fn (dialog &IHandle) show_xy(x int, y int) &IHandle {
	C.IupShowXY(dialog, x, y)
	return dialog
}
