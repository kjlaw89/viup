module browser

import viup

#flag -L .
#flag windows -liupole
#flag linux -lwebkit2gtk-4.0
#flag linux -lgio-2.0
#include "iupweb.h"

fn C.IupWebBrowser() voidptr

pub fn new(attrs ...string) &viup.Control {
	control := unsafe { &viup.Control(C.IupWebBrowser()) }
	control.set_attrs(...attrs)
	return control
}
