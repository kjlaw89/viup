module viup

fn C.IupAppend(&Ihandle, &Ihandle) &Ihandle
fn C.IupDestroy(&Ihandle)
fn C.IupDetach(&Ihandle)
fn C.IupGetClassName(&Ihandle) charptr
fn C.IupGetClassType(&Ihandle) charptr
fn C.IupGetFocus() &Ihandle
fn C.IupHide(&Ihandle) int
fn C.IupInsert(&Ihandle, &Ihandle, &Ihandle) &Ihandle
fn C.IupNextField(&Ihandle) &Ihandle
fn C.IupMap(&Ihandle) int
fn C.IupPreviousField(&Ihandle) &Ihandle
fn C.IupRefresh(&Ihandle)
fn C.IupRefreshChildren(&Ihandle)
fn C.IupSaveClassAttributes(&Ihandle)
fn C.IupSetFocus(&Ihandle) &Ihandle
fn C.IupUnmap(&Ihandle)

// append inserts an `new_control` at the end of the container
pub fn (control &Ihandle) append(new_control &Ihandle) &Ihandle {
	return C.IupAppend(control, new_control)
}

// destroy destroy current control
pub fn (control &Ihandle) destroy() {
	C.IupDestroy(control)
}

// detach detaches current control from its parent
pub fn (control &Ihandle) detach() {
	C.IupDetach(control)
}

// focus sets focus on to the current control and
// returns back the previously focused control
pub fn (control &Ihandle) focus() &Ihandle {
	return C.IupSetFocus(control)
}

// focus_next focuses on the next element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Ihandle) focus_next() &Ihandle {
	return C.IupNextField(control)
}

// focus_prev focuses on the previous element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Ihandle) focus_prev() &Ihandle {
	return C.IupPreviousField(control)
}

// get_bgcolor gets the background color for the control
pub fn (control &Ihandle) get_bgcolor() Color {
	return parse_color(control.get_attr('bgcolor'))
}

// get_class_name get current control class name
pub fn (control &Ihandle) get_class_name() string {
	return unsafe { tos_clone(C.IupGetClassName(control)) }
}

// get_class_type get current control class type
pub fn (control &Ihandle) get_class_type() string {
	return unsafe { tos_clone(C.IupGetClassType(control)) }
}

// get_fgcolor gets the foreground color for the control
pub fn (control &Ihandle) get_fgcolor() Color {
	return parse_color(control.get_attr('fgcolor'))
}

// get_focused returns back the control that currently has focus
// Note: This method can cause issues with autofree
pub fn get_focused() &Ihandle {
	return C.IupGetFocus()
}

// get_font returns back a formatted `Font` object for this control
pub fn (control &Ihandle) get_font() Font {
	return parse_font(control.get_attr('font'))
}

// hide hides an interface element
pub fn (control &Ihandle) hide() int {
	return C.IupHide(control)
}

// insert inserts a `new_control` into this control after `ref_control` if provided
pub fn (control &Ihandle) insert(new_control &Ihandle, ref_control &Ihandle) &Ihandle {
	return C.IupInsert(control, new_control, ref_control)
}

// map_control creates (maps) the native interface objects corresponding to the given IUP interface elements
pub fn (control &Ihandle) map_control() int {
	return C.IupMap(control)
}

// refresh updates the size and layout of all controls in the same dialog
pub fn (control &Ihandle) refresh() &Ihandle {
	C.IupRefresh(control)
	return unsafe { control }
}

// refresh_children updates the size and layout of controls after changing size attributes, or attributes that affect the size of the control
pub fn (control &Ihandle) refresh_children() &Ihandle {
	C.IupRefreshChildren(control)
	return unsafe { control }
}

// set_bgcolor updates the background color for this control to the provided `Color`
pub fn (control &Ihandle) set_bgcolor(color Color) &Ihandle {
	return control.set_attr('bgcolor', color.str())
}

// set_fgcolor updates the foreground color for this control to the provided `Color`
pub fn (control &Ihandle) set_fgcolor(color Color) &Ihandle {
	return control.set_attr('fgcolor', color.str())
}

// set_font updates the font for this control to the provided `Font`
pub fn (control &Ihandle) set_font(font Font) &Ihandle {
	return control.set_attr('font', font.str())
}

// set_handle is a helper function for `Control` that calls the global
// `set_handle` function. Returns back an instance of `Control` for chaining
pub fn (control &Ihandle) set_handle(name string) &Ihandle {
	return set_handle(name, control)
}

// set_image set the current control's image handle to `handle`
pub fn (control &Ihandle) set_image(handle string) &Ihandle {
	return control.set_attr('image', handle)
}

// unmap_control unmap current control from the native system. It will also unmap all its children
pub fn (control &Ihandle) unmap_control(save_attrs bool) {
	if save_attrs {
		C.IupSaveClassAttributes(control)
	}

	C.IupUnmap(control)
}
