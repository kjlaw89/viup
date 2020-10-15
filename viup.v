module viup

#flag -I @VROOT/headers
#flag -L .
/*#flag -lfreetype6
#flag -lftgl*/
#flag -liup
/*#flag -liupcd
#flag -liupcontrols
#flag -liupgl
#flag -liupglcontrols
#flag -liupim
#flag -liupimglib
#flag -liupole
#flag -liuptuio*/
#flag manifest.syso

#include "iup.h"

fn C.IupClose()
fn C.IupGetGlobal() voidptr
fn C.IupMainLoop()
fn C.IupOpen(int, voidptr)
fn C.IupMessage(charptr, charptr)
fn C.IupSetGlobal(charptr, charptr)
fn C.IupSetStrGlobal(charptr, charptr)

pub fn close() {
	C.IupClose()
}

pub fn get_global_reference(name string) voidptr {
	return C.IupGetGlobal("${name}_global".to_upper().trim_space().str)
}

pub fn get_global_value(name string) string {
	return tos3(C.IupGetGlobal("${name}_global".to_upper().trim_space().str))
}

pub fn main_loop() {
	C.IupMainLoop()
}

pub fn message(title string, message string) {
	C.IupMessage(title.str, message.str)
}

pub fn open(args []string) {
	C.IupOpen(&args.len, &args.data)
}

pub fn set_global_reference(name string, data voidptr) {
	C.IupSetGlobal("${name}_global".to_upper().trim_space().str, charptr(data))
}

pub fn set_global_value(name, data string) {
	C.IupSetStrGlobal("${name}_global".to_upper().trim_space().str, data.str)
}