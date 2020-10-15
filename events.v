module viup

pub type ActionFunc = fn(&Control) int
pub type MouseButtonFunc = fn(&Control, MouseButton, bool, int, int, charptr) int

type VIUPFunc = ActionFunc | MouseButtonFunc

fn C.IupDestroy(voidptr)
fn C.IupSetCallback(voidptr, charptr, VIUPCallback)

pub fn (control &Control) destroy() {
	C.IupDestroy(control)
}

pub fn (control &Control) callback(func VIUPFunc) {
	match func {
		ActionFunc       { C.IupSetCallback(control, "ACTION", ActionFunc(func)) }
		MouseButtonFunc  { C.IupSetCallback(control, "BUTTON_CB", MouseButtonFunc(func)) }
	}
}