module viup

type IUPCallback = fn(voidptr) int
pub type ControlCallback = fn(Control) int

fn C.IupSetCallback(voidptr, charptr, IUPCallback)

pub fn (control Control) watch(event string, callback IUPCallback) {
	C.IupSetCallback(control.ptr, event.str, callback)
}