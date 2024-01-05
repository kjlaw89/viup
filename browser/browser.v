module browser

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag linux -lwebkit2gtk-4.0 -lgio-2.0
#flag linux -liupweb
#include "iup.h"
#include "iupweb.h"

// `WebBrowser` inherits from `Ihandle`
@[heap]
pub struct WebBrowser {
	Ihandle
}

fn C.IupWebBrowserOpen() int
fn C.IupWebBrowser() &WebBrowser

// web_browser_open must be called after `open`
fn init() {
	init_iup()
	C.IupWebBrowserOpen()
}

fn cleanup() {
	cleanup_iup()
}

// web_browser creates a web browser control. It is responsible for managing the drawing of the web browser content and forwarding of its events
pub fn web_browser(attrs ...string) &WebBrowser {
	web_browser := C.IupWebBrowser()
	web_browser.set_attrs(...attrs)
	return web_browser
}

// set_handle is a helper function for `WebBrowser` that calls the global
// `set_handle` function. Returns back an instance of `WebBrowser` for chaining
pub fn (web_browser &WebBrowser) set_handle(name string) &WebBrowser {
	C.IupSetHandle(name.str, &Ihandle(web_browser))
	return web_browser
}

// get_gl_canvas_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_web_browser_handle(handle string) &WebBrowser {
	return &WebBrowser(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `WebBrowser` and
// returns `WebBrowser` back for chaining
pub fn (web_browser &WebBrowser) set_attr(name string, value string) &WebBrowser {
	C.IupSetStrAttribute(&Ihandle(web_browser), name.to_upper().trim_space().str, value.trim_space().str)

	return web_browser
}

// set_attrs takes all x=x values and applies them to `WebBrowser` and
// returns `WebBrowser` back for chaining
pub fn (web_browser &WebBrowser) set_attrs(attrs ...string) &WebBrowser {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		web_browser.set_attr(split[0], split[1])
	}

	return web_browser
}

// set_data associates the provided `data` with `WebBrowser` and
// returns `WebBrowser` back for chaining
pub fn (web_browser &WebBrowser) set_data(name string, data voidptr) &WebBrowser {
	C.IupSetAttribute(&Ihandle(web_browser), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return web_browser
}

// unset_attr clears the provided attribute
pub fn (web_browser &WebBrowser) unset_attr(name string) &WebBrowser {
	C.IupSetAttribute(&Ihandle(web_browser), name.to_upper().trim_space().str, C.NULL)
	return web_browser
}
