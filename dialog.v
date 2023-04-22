module viup

fn C.IupElementPropertiesDialog(voidptr, &Ihandle) &Ihandle
fn C.IupColorDlg() &Ihandle
fn C.IupDialog(&Ihandle) &Ihandle
fn C.IupFileDlg() &Ihandle
fn C.IupFontDlg() &Ihandle
fn C.IupMessage(charptr, charptr)
fn C.IupMessageDlg() &Ihandle
fn C.IupLayoutDialog(&Ihandle) &Ihandle
fn C.IupPopup(&Ihandle, x int, y int) int
fn C.IupProgressDlg() &Ihandle
fn C.IupShow(&Ihandle) int
fn C.IupShowXY(&Ihandle, int, int)

// color_dialog opens a color picker with optional palette
pub fn color_dialog(handle string, attrs ...string) &Ihandle {
	dialog := C.IupColorDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)

	return dialog
}

// debug shows a layout dialog that can be used to
// inspect the provided Dialog's layout
// Note: This is intended for developers
pub fn (control &Ihandle) debug() &Ihandle {
	dialog := C.IupLayoutDialog(control)
	return dialog.show()
}

// debug_props shows a properites dialog that can be used to
// inspect the provided control's various properties
// Note: This is intended for developers
pub fn (control &Ihandle) debug_props() &Ihandle {
	dialog := C.IupElementPropertiesDialog(C.NULL, control)
	return dialog.show()
}

// dialog creates a standard Window or Modal dialog control
pub fn dialog(child &Ihandle, handle string, attrs ...string) &Ihandle {
	dialog := C.IupDialog(child)
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// file_dialog creates a file chooser dialog that can be used to
// open or save files. If "dialogtype" is not provided, defaults to "open"
pub fn file_dialog(handle string, attrs ...string) &Ihandle {
	dialog := C.IupFileDlg()
	dialog.set_handle(handle)
	dialog.set_attr('dialogtype', 'open')
	dialog.set_attrs(...attrs)
	return dialog
}

// font_dialog opens a font picker dialog
pub fn font_dialog(handle string, attrs ...string) &Ihandle {
	dialog := C.IupFontDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// message shows a modal dialog containing a `message` with `title`
pub fn message(title string, message string) {
	C.IupMessage(title.str, message.str)
}

// message_dialog opens customizable message modal box
pub fn message_dialog(attrs ...string) &Ihandle {
	dialog := C.IupMessageDlg()
	dialog.set_attrs(...attrs)
	return dialog
}

// popup displays the dialog as a modal at `x`, `y` position
pub fn (dialog &Ihandle) popup(x int, y int) &Ihandle {
	C.IupPopup(dialog, x, y)
	return unsafe { dialog }
}

// progress_dialog creates a progress dialog
pub fn progress_dialog(handle string, attrs ...string) &Ihandle {
	dialog := C.IupProgressDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return unsafe { dialog }
}

// set_menu sets the provided menu to this control
pub fn (dialog &Ihandle) set_menu(name string, menu &Ihandle) &Ihandle {
	set_handle(name, menu)
	dialog.set_attr('menu', name)
	return unsafe { dialog }
}

// show shows the dialog (not as a modal), typically
// centered on the opening dialog control
pub fn (dialog &Ihandle) show() &Ihandle {
	C.IupShow(dialog)
	return unsafe { dialog }
}

// show_xy shows the dialog the the provided X/Y coordinates
// Note: Only to be used with dialogs
pub fn (dialog &Ihandle) show_xy(x int, y int) &Ihandle {
	C.IupShowXY(dialog, x, y)
	return unsafe { dialog }
}
