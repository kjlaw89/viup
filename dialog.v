module viup

// `Dialog` inherits from `Control`
[heap]
pub struct Dialog {
	Control
}

type Iparamcb = fn (&Dialog, int, voidptr) int

fn C.IupAlarm(charptr, charptr, charptr, charptr, charptr) int
fn C.IupElementPropertiesDialog(voidptr, &Control) &Dialog
fn C.IupClassInfoDialog(&Dialog) &Dialog
fn C.IupColorDlg() &Dialog
fn C.IupDialog(&Control) &Dialog
fn C.IupFileDlg() &Dialog
fn C.IupFontDlg() &Dialog
fn C.IupGetFile(charptr) int
fn C.IupGetText(charptr, charptr, int) int
fn C.IupGetColor(int, int, charptr, charptr, charptr) int
fn C.IupGetParamv(charptr, Iparamcb, voidptr, charptr, int, int, voidptr) int
fn C.IupGlobalsDialog() &Dialog
fn C.IupLayoutDialog(&Dialog) &Dialog
fn C.IupListDialog(int, charptr, int, voidptr, int, int, int, []int) int
fn C.IupMessage(charptr, charptr)
fn C.IupMessageAlarm(&Dialog, charptr, charptr, charptr) int
fn C.IupMessageDlg() &Dialog
fn C.IupMessageError(&Dialog, charptr)
fn C.IupParam(charptr) &Control
fn C.IupParamBoxv(voidptr) &Dialog
fn C.IupPopup(&Dialog, x int, y int) int
fn C.IupProgressDlg() &Dialog
fn C.IupShow(&Dialog) int
fn C.IupShowXY(&Dialog, int, int)

// alarm shows a modal dialog containing a message and up to three buttons
// b1 is button1's text, ...
// return the number of the button selected by the user (1, 2 or 3) , or 0 if failed. It fails only if b1 is not defined.
pub fn alarm(title string, message string, b1 string, b2 string, b3 string) int {
	return C.IupAlarm(title.str, message.str, b1.str, b2.str, b3.str)
}

// IupClassInfoDialog
pub fn class_info_dialog(attrs ...string) &Dialog {
	class_info_dialog := C.IupClassInfoDialog(0)
	class_info_dialog.set_attrs(...attrs)
	return class_info_dialog
}

// color_dialog opens a color picker with optional palette
pub fn color_dialog(handle string, attrs ...string) &Dialog {
	dialog := C.IupColorDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// debug shows a layout dialog that can be used to
// inspect the provided Dialog's layout
// Note: This is intended for developers
pub fn (dialog &Dialog) debug() &Dialog {
	dialog1 := C.IupLayoutDialog(dialog)
	return dialog1.show()
}

// debug_props shows a properites dialog that can be used to
// inspect the provided control's various properties
// Note: This is intended for developers
pub fn (control &Control) debug_props() &Dialog {
	dialog1 := C.IupElementPropertiesDialog(C.NULL, control)
	return dialog1.show()
}

// dialog creates a standard Window or Modal dialog control
pub fn dialog(child &Control, handle string, attrs ...string) &Dialog {
	dialog := C.IupDialog(child)
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// file_dialog creates a file chooser dialog that can be used to
// open or save files. If "dialogtype" is not provided, defaults to "open"
pub fn file_dialog(handle string, attrs ...string) &Dialog {
	dialog := C.IupFileDlg()
	dialog.set_handle(handle)
	dialog.set_attr('dialogtype', 'open')
	dialog.set_attrs(...attrs)
	return dialog
}

// font_dialog opens a font picker dialog
pub fn font_dialog(handle string, attrs ...string) &Dialog {
	dialog := C.IupFontDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// get_color shows a modal dialog which allows the user to select a color
// `x`, `y`: x, y values of the IupPopup function
pub fn get_color(x int, y int) (int, Color) {
	mut r := u8(0)
	mut g := u8(0)
	mut b := u8(0)
	ret := C.IupGetColor(x, y, &r, &g, &b)
	return ret, Color{
		r: r
		g: g
		b: b
	}
}

// get_file shows a modal dialog of the native interface system to select a filename
// `filter` is used as an input value to define the default filter and directory. Example: "../docs/*.txt"
// return a status code, whose values can be: "1": New file. "0": Normal, existing file. "-1": Operation cancelled.
pub fn get_file(filter string) (int, string) {
	mut buffer := []u8{len: 4096}
	unsafe { vmemcpy(buffer.data, filter.str, filter.len) }
	ret := C.IupGetFile(buffer.data)
	filename_entered := unsafe { tos_clone(buffer.data) }
	return ret, filename_entered
}

// get_param shows a modal dialog for capturing parameter values using several types of controls
// `action`: user callback to be called whenever a parameter value was changed, and when the user pressed the OK button. It can be NULL.
// `user_data`: user pointer passed to the user callback
// `format`: string describing all the parameters. It is a sequence of format strings for each parameter, see IupParam
// `param_count`: number of regular parameters in the array.
// `param_extra`: number of extra parameters in the array (separator lines and button names).
// `param_data`: array of variables address with initial values for the parameters.
// return a status code 1 if the button 1 was pressed, 0 if the button 2 was pressed or if an error occurred.
pub fn get_param(title string, action Iparamcb, user_data voidptr, format string, param_count int, param_extra int, param_data []string) int {
	mut clist := []&char{}
	for i in 0 .. param_data.len {
		clist << &char(param_data[i].str)
	}
	clist << &char(0)

	return C.IupGetParamv(title.str, action, user_data, format.str, param_count, param_extra,
		clist.data)
}

// get_text shows a modal dialog to edit a multiline `text`
// return a non zero value if successful
pub fn get_text(title string, text string, maxsize int) (int, string) {
	mut buffer := []u8{len: maxsize + 10}
	unsafe { vmemcpy(buffer.data, text.str, text.len) }
	ret := C.IupGetText(title.str, buffer.data, maxsize)
	text_entered := unsafe { tos_clone(buffer.data) }
	return ret, text_entered
}

// globals_dialog creates an Globals Dialog. It is a predefined dialog to check and edit global attributes, functions (read-only) and names (read-only) in run time.
pub fn globals_dialog(attrs ...string) &Dialog {
	globals_dialog := C.IupGlobalsDialog()
	globals_dialog.set_attrs(...attrs)
	return globals_dialog
}

// list_dialog shows a modal dialog to select items from a simple or multiple selection list
// `dialog_type`: 1=simple selection; 2=multiple selection
// `list`: List of options.
// `op`: Initial selected item when type=1. starts at 1 (note that this index is different from the return value, kept for compatibility reasons)
// `max_col`: number of visible columns in the list
// `max_lin`: number of visible lines in the list
// `marks`: List of the items selection state, used only when type=2. Can be NULL when type=1. When type=2 must have size elements
// return When type=1, the function returns the number of the selected option (starts at 0), or -1 if the user cancels the operation.
//        When type=2, the function returns -1 when the user cancels the operation. If the user does not cancel the operation the function returns 1 and the marks parameter will have value 1 for the options selected by the user and value 0 for non-selected options. In Lua, the input table mark is changed.
pub fn list_dialog(dialog_type int, title string, list []string, op int, max_col int, max_lin int, marks []int) int {
	mut clist := []&char{}
	for i in 0 .. list.len {
		clist << &char(list[i].str)
	}
	clist << &char(0)
	return C.IupListDialog(dialog_type, title.str, list.len, clist.data, op, max_col,
		max_lin, marks.data)
}

// message shows a modal dialog containing a `message` with `title`
pub fn message(title string, message string) {
	C.IupMessage(title.str, message.str)
}

// message_alarm shows a modal dialog containing a question message
// `buttons` can have values: "OK", "OKCANCEL", "RETRYCANCEL", "YESNO", or "YESNOCANCEL".
// return the number of the button selected by the user (1, 2 or 3)
pub fn message_alarm(title string, message string, buttons string) int {
	return C.IupMessageAlarm(0, title.str, message.str, buttons.str)
}

// message_dialog opens customizable message modal box
pub fn message_dialog(attrs ...string) &Dialog {
	dialog := C.IupMessageDlg()
	dialog.set_attrs(...attrs)
	return dialog
}

// message_error shows a modal dialog containing an error message
pub fn message_error(message string) {
	C.IupMessageError(0, message.str)
}

// param construction element used only in `param_box`
pub fn param(format string, attrs ...string) &Control {
	param := C.IupParam(format.str)
	param.set_attrs(...attrs)
	return param
}

// param_box creates a void container for composing elements created using a list of IupParam elements. Each param is used to create several lines of controls internally arranged in a vertical composition.
pub fn param_box(param_array []&Control, attrs ...string) &Dialog {
	mut ptrs := []&Control{}
	for child in param_array {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	param_box := C.IupParamBoxv(ptrs.data)
	param_box.set_attrs(...attrs)
	return param_box
}

// popup displays the dialog as a modal at `x`, `y` position
pub fn (dialog &Dialog) popup(x int, y int) &Dialog {
	C.IupPopup(dialog, x, y)
	return dialog
}

// progress_dialog creates a progress dialog
pub fn progress_dialog(handle string, attrs ...string) &Dialog {
	dialog := C.IupProgressDlg()
	dialog.set_handle(handle)
	dialog.set_attrs(...attrs)
	return dialog
}

// set_menu sets the provided menu to this control
pub fn (dialog &Dialog) set_menu(name string, menu voidptr) &Dialog {
	unsafe { set_handle(name, &Ihandle(menu)) }
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

// set_handle is a helper function for `Dialog` that calls the global
// `set_handle` function. Returns back an instance of `Dialog` for chaining
pub fn (dialog &Dialog) set_handle(name string) &Dialog {
	set_handle(name, &Ihandle(dialog))
	return dialog
}

// get_dialog_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_dialog_handle(handle string) &Dialog {
	return &Dialog(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Dialog` and
// returns `Dialog` back for chaining
pub fn (dialog &Dialog) set_attr(name string, value string) &Dialog {
	C.IupSetStrAttribute(&Ihandle(dialog), name.to_upper().trim_space().str, value.trim_space().str)

	return dialog
}

// set_attrs takes all x=x values and applies them to `Dialog` and
// returns `Dialog` back for chaining
pub fn (dialog &Dialog) set_attrs(attrs ...string) &Dialog {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		dialog.set_attr(split[0], split[1])
	}

	return dialog
}

// set_data associates the provided `data` with `Dialog` and
// returns `Dialog` back for chaining
pub fn (dialog &Dialog) set_data(name string, data voidptr) &Dialog {
	C.IupSetAttribute(&Ihandle(dialog), '${name}_data'.to_upper().trim_space().str, charptr(data))

	return dialog
}

// unset_attr clears the provided attribute
pub fn (dialog &Dialog) unset_attr(name string) &Dialog {
	C.IupSetAttribute(&Ihandle(dialog), name.to_upper().trim_space().str, C.NULL)
	return dialog
}
