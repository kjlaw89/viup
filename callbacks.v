module viup

pub type ActionFunc = fn(&Control) FuncResult
pub type DestroyFunc = fn(&Control) FuncResult
pub type EnteredFunc = fn(&Control) FuncResult
pub type EntryFunc = fn()
pub type ExitFunc = fn()
pub type ExitedFunc = fn(&Control) FuncResult
pub type FocusedFunc = fn(&Control) FuncResult
pub type HelpFunc = fn(&Control) FuncResult
pub type IdleFunc = fn()
pub type KeyFunc = fn(&Control, int) FuncResult
pub type MapFunc = fn(&Control) int
pub type MouseButtonFunc = fn(&Control, MouseButton, bool, int, int, charptr) FuncResult
pub type UnfocusedFunc = fn(&Control)
pub type UnmapFunc = fn(&Control) FuncResult
pub type ValueChangedFunc = fn(&Control) FuncResult

type VIUPFunc = 
	ActionFunc | DestroyFunc | EnteredFunc | EntryFunc | ExitFunc | ExitedFunc |
	FocusedFunc | HelpFunc | IdleFunc | KeyFunc | MapFunc | MouseButtonFunc |
	UnmapFunc | UnfocusedFunc | ValueChangedFunc

fn C.IupSetCallback(voidptr, charptr, VIUPCallback)
fn C.IupSetFunction(charptr, VIUPCallback)

pub fn callback(func VIUPFunc) {
	match func {
		EntryFunc      { C.IupSetFunction("ENTRY_POINT", func) }
		ExitFunc      { C.IupSetFunction("EXIT_CB", func) }
		IdleFunc       { C.IupSetFunction("IDLE_ACTION", func) }
		else {}
	}
}

pub fn (control &Control) callback(func VIUPFunc) {
	match func {
		ActionFunc       { C.IupSetCallback(control, "ACTION", func) }
		DestroyFunc      { C.IupSetCallback(control, "DESTROY_CB", func) }
		EnteredFunc      { C.IupSetCallback(control, "ENTERWINDOW_CB", func) }
		ExitedFunc       { C.IupSetCallback(control, "LEAVEWINDOW_CB", func) }
		FocusedFunc      { C.IupSetCallback(control, "GETFOCUS_CB", func) }
		HelpFunc         { C.IupSetCallback(control, "HELP_CB", func) }
		KeyFunc          { C.IupSetCallback(control, "K_ANY", func) }
		MapFunc          { C.IupSetCallback(control, "MAP_CB", func) }
		MouseButtonFunc  { C.IupSetCallback(control, "BUTTON_CB", func) }
		UnfocusedFunc    { C.IupSetCallback(control, "KILLFOCUS_CB", func) }
		UnmapFunc        { C.IupSetCallback(control, "UNMAP_CB", func) }
		ValueChangedFunc { C.IupSetCallback(control, "VALUECHANGED_CB", func) }
		else {}
	}
}

pub fn (control &Control) callbacks(funcs ...VIUPFunc) {
	for f in funcs {
		control.callback(f)
	}
}