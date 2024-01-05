module browser

import viup { FuncResult }

fn C.IupSetCallback(voidptr, charptr, voidptr)

pub type IFn = fn (&WebBrowser) FuncResult

pub type IFns = fn (&WebBrowser, charptr) FuncResult

pub fn (web_browser &WebBrowser) set_callback(name string, func voidptr) &WebBrowser {
	C.IupSetCallback(web_browser, name.str, func)
	return web_browser
}

// on_completed action generated when a page successfully completed. Can be called multiple times when a frame set loads its frames, or when a page loads also other pages.
pub fn (web_browser &WebBrowser) on_completed(func IFns) &WebBrowser {
	C.IupSetCallback(web_browser, c'COMPLETED_CB', func)
	return web_browser
}

// on_error action generated when page load fail
pub fn (web_browser &WebBrowser) on_error(func IFns) &WebBrowser {
	C.IupSetCallback(web_browser, c'ERROR_CB', func)
	return web_browser
}

// on_navigate action generated when the browser requests a navigation to another page. It is called before navigation occurs. Can be called multiple times when a frame set loads its frames, or when a page loads also other pages
pub fn (web_browser &WebBrowser) on_navigate(func IFns) &WebBrowser {
	C.IupSetCallback(web_browser, c'NAVIGATE_CB', func)
	return web_browser
}

// on_new_window action generated when the browser requests a new window
pub fn (web_browser &WebBrowser) on_new_window(func IFns) &WebBrowser {
	C.IupSetCallback(web_browser, c'NEWWINDOW_CB', func)
	return web_browser
}

// on_update [Windows Only] action generated when the selection was changed and the editor interface needs an update. Used only when EDITABLE=Yes
pub fn (web_browser &WebBrowser) on_update(func IFn) &WebBrowser {
	C.IupSetCallback(web_browser, c'UPDATE_CB', func)
	return web_browser
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (web_browser &WebBrowser) on_map(func IFn) &WebBrowser {
	C.IupSetCallback(web_browser, c'MAP_CB', func)
	return web_browser
}

// on_unmap called right before an element is unmapped
pub fn (web_browser &WebBrowser) on_unmap(func IFn) &WebBrowser {
	C.IupSetCallback(web_browser, c'UNMAP_CB', func)
	return web_browser
}

// on_destroy called right before an element is destroyed
pub fn (web_browser &WebBrowser) on_destroy(func IFn) &WebBrowser {
	C.IupSetCallback(web_browser, c'DESTROY_CB', func)
	return web_browser
}
