module viup

#flag -I @VROOT/headers/iup
#flag -L /usr/lib/iup
#flag windows -lole
#flag linux -lwebkit2gtk-4.0 -lgio-2.0 -liupweb
#include "iup.h"
#include "iupweb.h"

fn C.IupWebBrowserOpen() int
fn C.IupWebBrowser() &Ihandle

// web_browser_open must be called after `open`
pub fn web_browser_open() int {
	return C.IupWebBrowserOpen()
}

// web_browser creates a web browser control. It is responsible for managing the drawing of the web browser content and forwarding of its events
pub fn web_browser(attrs ...string) &Ihandle {
	web_browser := C.IupWebBrowser()
	web_browser.set_attrs(...attrs)
	return web_browser
}
