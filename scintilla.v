module viup

#flag -I @VROOT/headers
#flag -L .
#flag -liup_scintilla
#include "iup.h"
#include "iup_scintilla.h"

fn C.IupScintillaOpen()
fn C.IupScintilla() &Ihandle
fn C.IupScintillaDlg() &Ihandle
fn C.IupScintillaSendMessage(&Ihandle, u32, u32, u32) u32

// scintilla_open must be called after a `open`
pub fn scintilla_open() {
	C.IupScintillaOpen()
}

// scintilla creates a multiline source code text editor that uses the Scintilla library
pub fn scintilla(attrs ...string) &Ihandle {
	scintilla := C.IupScintilla()
	scintilla.set_attrs(...attrs)
	return scintilla
}

// scintilla_dlg creates a notepad dialog using the IupScintilla control. It is a predefined dialog for a text notepad. The dialog can be shown with `show`, `show_xy` or `popup`
pub fn scintilla_dlg(attrs ...string) &Ihandle {
	scintilla_dlg := C.IupScintillaDlg()
	scintilla_dlg.set_attrs(...attrs)
	return scintilla_dlg
}

// scintilla_send_message sends a message to the Scintilla control in any platform
pub fn (scintilla &Ihandle) scintilla_send_message(msg u32, w_param u32, l_param u32) u32 {
	return C.IupScintillaSendMessage(scintilla, msg, w_param, l_param)
}
