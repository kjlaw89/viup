module viup

#flag -L .
#flag windows -liupole
#flag linux -lwebkit2gtk-4.0
#flag linux -lgio-2.0
#include "iupweb.h"

fn C.IupWebBrowserOpen() int
fn C.IupWebBrowser() &IHandle

pub fn web_browser_open() int {
	return C.IupWebBrowserOpen()
}

pub fn web_browser(attrs ...string) &IHandle {
	control := C.IupWebBrowser()
	control.set_attrs(...attrs)
	return control
}
