module viup

fn C.IupAppend(&Control, &Control) &Control

// fn C.IupDestroy(&Control)
fn C.IupDetach(&Control)
fn C.IupGetClassName(&Control) charptr
fn C.IupGetClassType(&Control) charptr
fn C.IupGetFocus() &Control
fn C.IupInsert(&Control, &Control, &Control) &Control
fn C.IupNextField(&Control) &Control
fn C.IupMap(&Control) int
fn C.IupPreviousField(&Control) &Control
fn C.IupRefresh(&Control)
fn C.IupRefreshChildren(&Control)
fn C.IupSaveClassAttributes(&Control)
fn C.IupSetFocus(&Control) &Control
fn C.IupUnmap(&Control)

// append inserts an `new_control` at the end of the container
pub fn (control &Control) append(new_control &Control) &Control {
	return C.IupAppend(control, new_control)
}

// destroy destroy current control
pub fn (control &Control) destroy() {
	C.IupDestroy(&Ihandle(control))
}

// detach detaches current control from its parent
pub fn (control &Control) detach() {
	C.IupDetach(control)
}

// focus sets focus on to the current control and
// returns back the previously focused control
pub fn (control &Control) focus() &Control {
	return C.IupSetFocus(control)
}

// focus_next focuses on the next element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Control) focus_next() &Control {
	return C.IupNextField(control)
}

// focus_prev focuses on the previous element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Control) focus_prev() &Control {
	return C.IupPreviousField(control)
}

// get_bgcolor gets the background color for the control
pub fn (control &Control) get_bgcolor() Color {
	return parse_color(control.get_attr('bgcolor'))
}

// get_class_name get current control class name
pub fn (control &Control) get_class_name() string {
	return unsafe { tos_clone(C.IupGetClassName(control)) }
}

// get_class_type get current control class type
pub fn (control &Control) get_class_type() string {
	return unsafe { tos_clone(C.IupGetClassType(control)) }
}

// get_fgcolor gets the foreground color for the control
pub fn (control &Control) get_fgcolor() Color {
	return parse_color(control.get_attr('fgcolor'))
}

// get_focused returns back the control that currently has focus
// Note: This method can cause issues with autofree
pub fn get_focused() &Control {
	return C.IupGetFocus()
}

// get_font returns back a formatted `Font` object for this control
pub fn (control &Control) get_font() Font {
	return parse_font(control.get_attr('font'))
}

// insert inserts a `new_control` into this control after `ref_control` if provided
pub fn (control &Control) insert(new_control &Control, ref_control &Control) &Control {
	return C.IupInsert(control, new_control, ref_control)
}

// map_control creates (maps) the native interface objects corresponding to the given IUP interface elements
pub fn (control &Control) map_control() int {
	return C.IupMap(control)
}

// refresh updates the size and layout of all controls in the same dialog
pub fn (control &Control) refresh() &Control {
	C.IupRefresh(control)
	return control
}

// refresh_children updates the size and layout of controls after changing size attributes, or attributes that affect the size of the control
pub fn (control &Control) refresh_children() &Control {
	C.IupRefreshChildren(control)
	return control
}

// set_bgcolor updates the background color for this control to the provided `Color`
pub fn (control &Control) set_bgcolor(color Color) &Control {
	control.set_attr('bgcolor', color.str())
	return control
}

// set_fgcolor updates the foreground color for this control to the provided `Color`
pub fn (control &Control) set_fgcolor(color Color) &Control {
	control.set_attr('fgcolor', color.str())
	return control
}

// set_font updates the font for this control to the provided `Font`
pub fn (control &Control) set_font(font Font) &Control {
	control.set_attr('font', font.str())
	return control
}

// set_handle is a helper function for `Control` that calls the global
// `set_handle` function. Returns back an instance of `Control` for chaining
pub fn (control &Control) set_handle(name string) &Control {
	set_handle(name, &Ihandle(control))
	return control
}

// set_image set the current control's image handle to `handle`
pub fn (control &Control) set_image(handle string) &Control {
	control.set_attr('image', handle)
	return control
}

// unmap_control unmap current control from the native system. It will also unmap all its children
pub fn (control &Control) unmap_control(save_attrs bool) {
	if save_attrs {
		C.IupSaveClassAttributes(control)
	}

	C.IupUnmap(control)
}

// get_control_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_control_handle(handle string) &Control {
	return &Control(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_attr(name string, value string) &Control {
	C.IupSetStrAttribute(&Ihandle(control), name.to_upper().trim_space().str, value.trim_space().str)

	return control
}

// set_attrs takes all x=x values and applies them to `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_attrs(attrs ...string) &Control {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		control.set_attr(split[0], split[1])
	}

	return control
}

// set_data associates the provided `data` with `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_data(name string, data voidptr) &Control {
	C.IupSetAttribute(&Ihandle(control), '${name}_data'.to_upper().trim_space().str, charptr(data))

	return control
}

// unset_attr clears the provided attribute
pub fn (control &Control) unset_attr(name string) &Control {
	C.IupSetAttribute(&Ihandle(control), name.to_upper().trim_space().str, C.NULL)
	return control
}
