module scintilla

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liup_scintilla
#include "iup.h"
#include "iup_scintilla.h"

// `Scintilla` inherits from `Ihandle`
@[heap]
pub struct Scintilla {
	Ihandle
}

fn C.IupScintillaOpen()
fn C.IupScintilla() &Scintilla
fn C.IupScintillaDlg() &Scintilla
fn C.IupScintillaSendMessage(&Scintilla, u32, u32, u32) u32

// scintilla_open must be called after a `open`
fn init() {
	init_iup()
	C.IupScintillaOpen()
}

fn cleanup() {
	cleanup_iup()
}

// scintilla creates a multiline source code text editor that uses the Scintilla library
pub fn scintilla(attrs ...string) &Scintilla {
	scintilla_control := C.IupScintilla()
	scintilla_control.set_attrs(...attrs)
	return scintilla_control
}

// scintilla_dlg creates a notepad dialog using the IupScintilla control. It is a predefined dialog for a text notepad. The dialog can be shown with `show`, `show_xy` or `popup`
pub fn scintilla_dlg(attrs ...string) &Scintilla {
	scintilla_dlg := C.IupScintillaDlg()
	scintilla_dlg.set_attrs(...attrs)
	return scintilla_dlg
}

// scintilla_send_message sends a message to the Scintilla control in any platform
pub fn (scintilla_control &Scintilla) scintilla_send_message(msg u32, w_param u32, l_param u32) u32 {
	return C.IupScintillaSendMessage(scintilla_control, msg, w_param, l_param)
}

// set_handle is a helper function for `Scintilla` that calls the global
// `set_handle` function. Returns back an instance of `Scintilla` for chaining
pub fn (scintilla_control &Scintilla) set_handle(name string) &Scintilla {
	C.IupSetHandle(name.str, &Ihandle(scintilla_control))
	return scintilla_control
}

// get_scintilla_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_scintilla_handle(handle string) &Scintilla {
	return &Scintilla(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Scintilla` and
// returns `Scintilla` back for chaining
pub fn (scintilla_control &Scintilla) set_attr(name string, value string) &Scintilla {
	C.IupSetStrAttribute(&Ihandle(scintilla_control), name.to_upper().trim_space().str,
		value.trim_space().str)

	return scintilla_control
}

// set_attrs takes all x=x values and applies them to `Scintilla` and
// returns `Scintilla` back for chaining
pub fn (scintilla_control &Scintilla) set_attrs(attrs ...string) &Scintilla {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		scintilla_control.set_attr(split[0], split[1])
	}

	return scintilla_control
}

// set_data associates the provided `data` with `Scintilla` and
// returns `Scintilla` back for chaining
pub fn (scintilla_control &Scintilla) set_data(name string, data voidptr) &Scintilla {
	C.IupSetAttribute(&Ihandle(scintilla_control), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return scintilla_control
}

// unset_attr clears the provided attribute
pub fn (scintilla_control &Scintilla) unset_attr(name string) &Scintilla {
	C.IupSetAttribute(&Ihandle(scintilla_control), name.to_upper().trim_space().str, C.NULL)
	return scintilla_control
}
