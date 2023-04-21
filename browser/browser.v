module browser

import viup

#flag -L .
#flag windows -liupole
#flag linux -lwebkit2gtk-4.0
#flag linux -lgio-2.0
#include "iupweb.h"

fn C.IupWebBrowser() voidptr

pub fn new(attrs ...string) &viup.IHandle{
	control := unsafe { &viup.IHandle(C.IupWebBrowser()) }
	control.set_attrs(...attrs)
	return control
}
