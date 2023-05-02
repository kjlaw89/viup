module browser

import viup

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag linux -lwebkit2gtk-4.0 -lgio-2.0
#flag linux -liupweb
#include "iup.h"
#include "iupweb.h"

fn C.IupWebBrowserOpen() int
fn C.IupWebBrowser() &viup.Ihandle

// web_browser_open must be called after `open`
fn init() {
	C.IupWebBrowserOpen()
}

// web_browser creates a web browser control. It is responsible for managing the drawing of the web browser content and forwarding of its events
pub fn web_browser(attrs ...string) &viup.Ihandle {
	web_browser := C.IupWebBrowser()
	web_browser.set_attrs(...attrs)
	return web_browser
}
