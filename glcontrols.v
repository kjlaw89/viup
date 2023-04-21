module viup

fn C.IupGLControlsOpen() int
fn C.IupGLCanvasBoxv(&IHandle) &IHandle
fn C.IupGLSubCanvas() &IHandle
fn C.IupGLLabel(charptr) &IHandle
fn C.IupGLSeparator() &IHandle
fn C.IupGLButton(charptr) &IHandle
fn C.IupGLToggle(charptr) &IHandle
fn C.IupGLLink(charptr, charptr) &IHandle
fn C.IupGLProgressBar() &IHandle
fn C.IupGLVal() &IHandle
fn C.IupGLFrame(&IHandle) &IHandle
fn C.IupGLExpander(&IHandle) &IHandle
fn C.IupGLScrollBox(&IHandle) &IHandle
fn C.IupGLSizeBox(&IHandle) &IHandle
fn C.IupGLText() &IHandle
fn C.IupGLDrawImage(&IHandle, charptr, int, int, int)
fn C.IupGLDrawText(&IHandle, charptr, int, int, int)
fn C.IupGLDrawGetTextSize(&IHandle, charptr, &int, &int)
fn C.IupGLDrawGetImageInfo(charptr, &int, &int, &int)

pub fn gl_controls_open() int {
	return C.IupGLControlsOpen()
}

pub fn gl_canvas_boxv(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	box := C.IupGLCanvasBoxv(ptrs.data)
	box.set_attrs(...attrs)
	return box
}

pub fn gl_sub_canvas() &IHandle {
	return C.IupGLSubCanvas()
}

pub fn gl_label(title string) &IHandle {
	return C.IupGLLabel(title.str)
}

pub fn gl_separator() &IHandle {
	return C.IupGLSeparator()
}

pub fn gl_button(title string) &IHandle {
	return C.IupGLButton(title.str)
}

pub fn gl_toggle(title string) &IHandle {
	return C.IupGLToggle(title.str)
}

pub fn gl_link(url string, title string) &IHandle {
	return C.IupGLLink(url.str, title.str)
}

pub fn gl_progress_bar() &IHandle {
	return C.IupGLProgressBar()
}

pub fn gl_val() &IHandle {
	return C.IupGLVal()
}

pub fn gl_frame(child &IHandle) &IHandle {
	return C.IupGLFrame(child)
}

pub fn gl_expander(child &IHandle) &IHandle {
	return C.IupGLExpander(child)
}

pub fn gl_scroll_box(child &IHandle) &IHandle {
	return C.IupGLScrollBox(child)
}

pub fn gl_size_box(child &IHandle) &IHandle {
	return C.IupGLSizeBox(child)
}

pub fn gl_text() &IHandle {
	return C.IupGLText()
}

pub fn (gl_control &IHandle) gl_draw_image(name string, x int, y int, active int) &IHandle {
	C.IupGLDrawImage(gl_control, name.str, x, y, active)
	return gl_control
}

pub fn (gl_control &IHandle) gl_draw_text(str string, x int, y int) &IHandle {
	C.IupGLDrawText(gl_control, str.str, str.len, x, y)
	return gl_control
}

pub fn (gl_control &IHandle) gl_draw_get_text_size(str string) (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupGLDrawGetTextSize(gl_control, str.str, &w, &h)
	return w, h
}

pub fn gl_draw_get_image_info(name string) (int, int, int) {
	mut w := int(0)
	mut h := int(0)
	mut bpp := int(0)
	C.IupGLDrawGetImageInfo(name.str, &w, &h, &bpp)
	return w, h, bpp
}
