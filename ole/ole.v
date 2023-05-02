module ole

import viup

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag windows -loleaut32 -luuid
#include "iup.h"
#include "iupole.h"

fn C.IupOleControl(charptr) &viup.Ihandle
fn C.IupOleControlOpen() int

// ole_control_open must be called after a `open`
fn init() {
	$if windows {
		C.IupOleControlOpen()
	}
}

// ole_control hosts an windows OLE control (also named ActiveX control), allowing it to be used inside IUP dialogs. There are many OLE controls available, like calendars, internet browsers, PDF readers etc.
// `progid` is the programmatic identifier of the OLE control. This can be found in the documentation of the OLE control or by browsing the list of registered controls, using tools like OleView.
pub fn ole_control(progid string, attrs ...string) &viup.Ihandle {
	$if windows {
		ole_control := C.IupOleControl(progid.str)
		ole_control.set_attrs(...attrs)
		return ole_control
	} $else {
		return unsafe { nil }
	}
}
