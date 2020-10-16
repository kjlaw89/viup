module viup

pub type ActionFunc = fn(&Control) int
pub type MouseButtonFunc = fn(&Control, MouseButton, bool, int, int, charptr) int
pub type ValueChangedFunc = fn(&Control) int

type VIUPFunc = ActionFunc | MouseButtonFunc | ValueChangedFunc

fn C.IupSetCallback(voidptr, charptr, VIUPCallback)

pub fn (control &Control) callback(func VIUPFunc) {
	match func {
		ActionFunc       { C.IupSetCallback(control, "ACTION", ActionFunc(func)) }
		MouseButtonFunc  { C.IupSetCallback(control, "BUTTON_CB", MouseButtonFunc(func)) }
		ValueChangedFunc { C.IupSetCallback(control, "VALUECHANGED_CB", ValueChangedFunc(func)) }
	}
}

pub fn (control &Control) callbacks(funcs ...VIUPFunc) {
	for f in funcs {
		control.callback(f)
	}
}