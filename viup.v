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

#include "iup.h"

fn C.IupClose()
fn C.IupOpen(int, voidptr)
fn C.IupMainLoop()
fn C.IupMessage(charptr, charptr)

pub fn open(args []string) {
	C.IupOpen(&args.len, &args.data)
}

pub fn close() {
	C.IupClose()
}

pub fn main_loop() {
	C.IupMainLoop()
}

pub fn message(title string, message string) {
	C.IupMessage(title.str, message.str)
}