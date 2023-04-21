module viup

fn C.IupAppend(&IHandle, &IHandle) &IHandle

fn C.IupDestroy(&IHandle)

fn C.IupDetach(&IHandle)

fn C.IupGetClassName(&IHandle) charptr

fn C.IupGetClassType(&IHandle) charptr

fn C.IupGetFocus() &IHandle

fn C.IupInsert(&IHandle, &IHandle, &IHandle) &IHandle

fn C.IupNextField(&IHandle) &IHandle

fn C.IupMap(&IHandle) int

fn C.IupPreviousField(&IHandle) &IHandle

fn C.IupRefresh(&IHandle)

fn C.IupRefreshChildren(&IHandle)

fn C.IupSaveClassAttributes(&IHandle)

fn C.IupSetFocus(&IHandle) &IHandle

fn C.IupUnmap(&IHandle)

pub fn (control &IHandle) append(new_control &IHandle) &IHandle {
	return C.IupAppend(control, new_control)
}

pub fn (control &IHandle) destroy() {
	C.IupDestroy(control)
}

pub fn (control &IHandle) detach() {
	C.IupDetach(control)
}

// focus sets focus on to the current control and
// returns back the previously focused control
pub fn (control &IHandle) focus() &IHandle {
	return C.IupSetFocus(control)
}

// focus_next focuses on the next element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &IHandle) focus_next() &IHandle {
	return C.IupNextField(control)
}

// focus_prev focuses on the previous element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &IHandle) focus_prev() &IHandle {
	return C.IupPreviousField(control)
}

// get_bgcolor gets the background color for the control
pub fn (control &IHandle) get_bgcolor() Color {
	return parse_color(control.get_attr('bgcolor'))
}

pub fn (control &IHandle) get_class_name() string {
	return unsafe { tos_clone(C.IupGetClassName(control)) }
}

pub fn (control &IHandle) get_class_type() string {
	return unsafe { tos_clone(C.IupGetClassType(control)) }
}

// get_fgcolor gets the foreground color for the control
pub fn (control &IHandle) get_fgcolor() Color {
	return parse_color(control.get_attr('fgcolor'))
}

// get_focused returns back the control that currently has focus
// Note: This method can cause issues with autofree
pub fn get_focused() &IHandle {
	return C.IupGetFocus()
}

// get_font returns back a formatted `Font` object for this control
pub fn (control &IHandle) get_font() Font {
	return parse_font(control.get_attr('font'))
}

// insert inserts a `new_control` into this control after `ref_control` if provided
pub fn (control &IHandle) insert(new_control &IHandle, ref_control &IHandle) &IHandle {
	return C.IupInsert(control, new_control, ref_control)
}

pub fn (control &IHandle) map_control() int {
	return C.IupMap(control)
}

pub fn (control &IHandle) refresh() {
	C.IupRefresh(control)
}

pub fn (control &IHandle) refresh_children() {
	C.IupRefreshChildren(control)
}

// set_bgcolor updates the background color for this control to the provided `Color`
pub fn (control &IHandle) set_bgcolor(color Color) &IHandle {
	return control.set_attr('bgcolor', color.str())
}

// set_fgcolor updates the foreground color for this control to the provided `Color`
pub fn (control &IHandle) set_fgcolor(color Color) &IHandle {
	return control.set_attr('fgcolor', color.str())
}

// set_font updates the font for this control to the provided `Font`
pub fn (control &IHandle) set_font(font Font) &IHandle {
	return control.set_attr('font', font.str())
}

// set_handle is a helper function for `Control` that calls the global
// `set_handle` function. Returns back an instance of `Control` for chaining
pub fn (control &IHandle) set_handle(name string) &IHandle {
	return set_handle(name, control)
}

pub fn (control &IHandle) set_image(handle string) &IHandle {
	return control.set_attr('image', handle)
}

pub fn (control &IHandle) unmap_control(save_attrs bool) {
	if save_attrs {
		C.IupSaveClassAttributes(control)
	}

	C.IupUnmap(control)
}
