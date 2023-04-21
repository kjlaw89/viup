module viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupgl
#include "iupgl.h"

fn C.IupGLCanvasOpen()

fn C.IupGLBackgroundBox(&IHandle) &IHandle
fn C.IupGLCanvas(charptr) &IHandle

fn C.IupGLIsCurrent(&IHandle) int

fn C.IupGLMakeCurrent(&IHandle)

fn C.IupGLPalette(&IHandle, int, f32, f32, f32)

fn C.IupGLSwapBuffers(&IHandle)

fn C.IupGLUseFont(&IHandle, int, int, int)

fn C.IupGLWait(int)

pub fn gl_canvas_open() {
	C.IupGLCanvasOpen()
}

pub fn gl_canvas(attrs ...string) &IHandle {
	canvas := C.IupGLCanvas(0)
	canvas.set_attr('buffer', 'double')
	canvas.set_attrs(...attrs)
	return canvas
}

pub fn gl_is_current(control &IHandle) bool {
	return C.IupGLIsCurrent(control) > 0
}

pub fn gl_make_current(control &IHandle) &IHandle {
	C.IupGLMakeCurrent(control)
	return control
}

pub fn gl_set_palette(control &IHandle, index int, r f32, g f32, b f32) &IHandle {
	C.IupGLPalette(control, index, r, g, b)
	return control
}

pub fn gl_swap_buffers(control &IHandle) &IHandle {
	C.IupGLSwapBuffers(control)
	return control
}

pub fn gl_wait(is_gl bool) {
	C.IupGLWait(is_gl)
}

pub fn (gl &IHandle) gl_background_box() &IHandle {
	return C.IupGLBackgroundBox(gl)
}

pub fn (gl &IHandle) gl_use_font(first int, count int, list_base int) &IHandle {
	C.IupGLUseFont(gl, first, count, list_base)
	return gl
}
