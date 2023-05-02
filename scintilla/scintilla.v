module scintilla

import viup

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liup_scintilla
#include "iup.h"
#include "iup_scintilla.h"

fn C.IupScintillaOpen()
fn C.IupScintilla() &viup.Ihandle
fn C.IupScintillaDlg() &viup.Ihandle
fn C.IupScintillaSendMessage(&viup.Ihandle, u32, u32, u32) u32

// scintilla_open must be called after a `open`
fn init() {
	C.IupScintillaOpen()
}

// scintilla creates a multiline source code text editor that uses the Scintilla library
pub fn scintilla(attrs ...string) &viup.Ihandle {
	scintilla := C.IupScintilla()
	scintilla.set_attrs(...attrs)
	return scintilla
}

// scintilla_dlg creates a notepad dialog using the IupScintilla control. It is a predefined dialog for a text notepad. The dialog can be shown with `show`, `show_xy` or `popup`
pub fn scintilla_dlg(attrs ...string) &viup.Ihandle {
	scintilla_dlg := C.IupScintillaDlg()
	scintilla_dlg.set_attrs(...attrs)
	return scintilla_dlg
}

// scintilla_send_message sends a message to the Scintilla control in any platform
pub fn scintilla_send_message(scintilla &viup.Ihandle, msg u32, w_param u32, l_param u32) u32 {
	return C.IupScintillaSendMessage(scintilla, msg, w_param, l_param)
}
