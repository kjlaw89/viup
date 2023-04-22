module viup

#flag -I @VROOT/headers
#flag -L .
#flag windows -lole
#include "iup.h"
#include "iupole.h"

fn C.IupOleControl(charptr) &Ihandle
fn C.IupOleControlOpen() int

// ole_control_open must be called after a `open`
pub fn ole_control_open() int {
	$if windows {
		return C.IupOleControlOpen()
	} $else {
		return 0
	}
}

// ole_control hosts an windows OLE control (also named ActiveX control), allowing it to be used inside IUP dialogs. There are many OLE controls available, like calendars, internet browsers, PDF readers etc.
// `progid` is the programmatic identifier of the OLE control. This can be found in the documentation of the OLE control or by browsing the list of registered controls, using tools like OleView.
pub fn ole_control(progid string, attrs ...string) &Ihandle {
	$if windows {
		ole_control := C.IupOleControl(progid.str)
		ole_control.set_attrs(...attrs)
		return ole_control
	} $else {
		return unsafe { nil }
	}
}
