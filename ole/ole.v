module ole

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag windows -loleaut32 -luuid
#include "iup.h"
#include "iupole.h"

// OLE inherits from `Ihandle`
@[heap]
pub struct OLE {
	Ihandle
}

fn C.IupOleControl(charptr) &OLE
fn C.IupOleControlOpen() int

// ole_control_open must be called after a `open`
fn init() {
	init_iup()
	$if windows {
		C.IupOleControlOpen()
	}
}

fn cleanup() {
	cleanup_iup()
}

// ole_control hosts an windows OLE control (also named ActiveX control), allowing it to be used inside IUP dialogs. There are many OLE controls available, like calendars, internet browsers, PDF readers etc.
// `progid` is the programmatic identifier of the OLE control. This can be found in the documentation of the OLE control or by browsing the list of registered controls, using tools like OleView.
pub fn ole_control(progid string, attrs ...string) &OLE {
	$if windows {
		ole_control := C.IupOleControl(progid.str)
		ole_control.set_attrs(...attrs)
		return ole_control
	} $else {
		return unsafe { nil }
	}
}

// set_handle is a helper function for `OLE` that calls the global
// `set_handle` function. Returns back an instance of `OLE` for chaining
pub fn (ole_control &OLE) set_handle(name string) &OLE {
	C.IupSetHandle(name.str, &Ihandle(ole_control))
	return ole_control
}

// get_ole_control_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_ole_control_handle(handle string) &OLE {
	return &OLE(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `OLE` and
// returns `OLE` back for chaining
pub fn (ole_control &OLE) set_attr(name string, value string) &OLE {
	C.IupSetStrAttribute(&Ihandle(ole_control), name.to_upper().trim_space().str, value.trim_space().str)

	return ole_control
}

// set_attrs takes all x=x values and applies them to `OLE` and
// returns `OLE` back for chaining
pub fn (ole_control &OLE) set_attrs(attrs ...string) &OLE {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		ole_control.set_attr(split[0], split[1])
	}

	return ole_control
}

// set_data associates the provided `data` with `OLE` and
// returns `OLE` back for chaining
pub fn (ole_control &OLE) set_data(name string, data voidptr) &OLE {
	C.IupSetAttribute(&Ihandle(ole_control), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return ole_control
}

// unset_attr clears the provided attribute
pub fn (ole_control &OLE) unset_attr(name string) &OLE {
	C.IupSetAttribute(&Ihandle(ole_control), name.to_upper().trim_space().str, C.NULL)
	return ole_control
}
