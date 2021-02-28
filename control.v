module viup

fn C.IupAppend(voidptr, voidptr) voidptr

fn C.IupDestroy(voidptr)

fn C.IupDetach(voidptr)

fn C.IupGetClassName(voidptr) charptr

fn C.IupGetClassType(voidptr) charptr

fn C.IupGetFocus() voidptr

fn C.IupInsert(voidptr, voidptr, voidptr) voidptr

fn C.IupNextField(voidptr) voidptr

fn C.IupMap(voidptr) int

fn C.IupPreviousField(voidptr) voidptr

fn C.IupRefresh(voidptr)

fn C.IupRefreshChildren(voidptr)

fn C.IupSaveClassAttributes(voidptr)

fn C.IupSetFocus(voidptr) voidptr

fn C.IupUnmap(voidptr)

pub struct Control {
mut:
	sig    [4]i8
	iclass voidptr
	attrib voidptr
	serial int
	handle voidptr
	expand int
	flags  int
pub:
	x              int
	y              int
	user_width     int
	user_height    int
	natural_width  int
	natural_height int
	current_width  int
	current_height int
	parent         &Control
	first_child    &Control
	sibling        &Control
	data           voidptr
}

pub fn (control &Control) append(new_control &Control) &Control {
	return C.IupAppend(control, new_control)
}

pub fn (control &Control) destroy() {
	C.IupDestroy(control)
}

pub fn (control &Control) detach() {
	C.IupDetach(control)
}

// focus sets focus on to the current control and
// returns back the previously focused control
pub fn (control &Control) focus() {
	return C.IupSetFocus(control)
}

// focus_next focuses on the next element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Control) focus_next() {
	return C.IupNextField(control)
}

// focus_prev focuses on the previous element that can have focus
// Note: This may not produce the same results as tabbing
pub fn (control &Control) focus_prev() {
	return C.IupPreviousField(control)
}

// free destroys this control and releases its memory (used by autofree)
pub fn (mut control Control) free() {
	if control.handle == 0 {
		return
	}

	control.destroy()
	control.handle = voidptr(0)
}

// get_bgcolor gets the background color for the control
pub fn (control &Control) get_bgcolor() Color {
	return parse_color(control.get_attr('bgcolor'))
}

pub fn (control &Control) get_class_name() string {
	return unsafe { tos3(C.IupGetClassName(control)) }
}

pub fn (control &Control) get_class_type() string {
	return unsafe { tos3(C.IupGetClassType(control)) }
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

pub fn (control &Control) map_control() int {
	return C.IupMap(control)
}

pub fn (control &Control) refresh() {
	C.IupRefresh(control)
}

pub fn (control &Control) refresh_children() {
	C.IupRefreshChildren(control)
}

// set_bgcolor updates the background color for this control to the provided `Color`
pub fn (control &Control) set_bgcolor(color Color) &Control {
	return control.set_attr('bgcolor', color.str())
}

// set_fgcolor updates the foreground color for this control to the provided `Color`
pub fn (control &Control) set_fgcolor(color Color) &Control {
	return control.set_attr('fgcolor', color.str())
}

// set_font updates the font for this control to the provided `Font`
pub fn (control &Control) set_font(font Font) &Control {
	return control.set_attr('font', font.str())
}

// set_handle is a helper function for `Control` that calls the global
// `set_handle` function. Returns back an instance of `Control` for chaining
pub fn (control &Control) set_handle(name string) &Control {
	return set_handle(name, control)
}

pub fn (control &Control) set_image(handle string) &Control {
	return control.set_attr('image', handle)
}

pub fn (control &Control) unmap_control(save_attrs bool) {
	if save_attrs {
		C.IupSaveClassAttributes(control)
	}

	C.IupUnmap(control)
}
