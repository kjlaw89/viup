module viup

fn C.IupAppend(voidptr, voidptr) voidptr

fn C.IupDestroy(voidptr)

fn C.IupDetach(voidptr)

fn C.IupGetClassName(voidptr) charptr

fn C.IupGetClassType(voidptr) charptr

fn C.IupInsert(voidptr, voidptr, voidptr) voidptr

fn C.IupMap(voidptr) int

fn C.IupRefresh(voidptr)

fn C.IupRefreshChildren(voidptr)

fn C.IupSaveClassAttributes(voidptr)

fn C.IupUnmap(voidptr)

pub struct Control {
mut:
	sig            [4]byte
	iclass         voidptr
	attr           voidptr
	serial         int
	handle         voidptr
	expand         int
	flags          int
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

pub fn (control &Control) get_class_name() string {
	return tos3(C.IupGetClassName(control))
}

pub fn (control &Control) get_class_type() string {
	return tos3(C.IupGetClassType(control))
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

pub fn (control &Control) unmap_control(save_attrs bool) {
	if save_attrs {
		C.IupSaveClassAttributes(control)
	}

	C.IupUnmap(control)
}