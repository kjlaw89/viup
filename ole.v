module viup

fn C.IupOleControl(charptr) &IHandle
fn C.IupOleControlOpen() int

pub fn ole_control(progid string) &IHandle {
	return C.IupOleControl(progid.str)
}

pub fn ole_control_open() int {
	return C.IupOleControlOpen()
}
