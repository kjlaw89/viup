module viup

fn C.IupScintillaOpen()
fn C.IupScintilla() &IHandle
fn C.IupScintillaDlg() &IHandle

pub fn scintilla_open() {
	C.IupScintillaOpen()
}

pub fn scintilla() &IHandle {
	return C.IupScintilla()
}

pub fn scintilla_dlg() &IHandle {
	return C.IupScintillaDlg()
}
