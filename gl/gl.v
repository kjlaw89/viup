module gl

import viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupgl
#include "iupgl.h"

fn C.IupGLCanvasOpen()

fn C.IupGLCanvas(charptr) &viup.IHandle

fn C.IupGLIsCurrent(&viup.IHandle) int

fn C.IupGLMakeCurrent(&viup.IHandle)

fn C.IupGLPalette(&viup.IHandle, int, f32, f32, f32)

fn C.IupGLSwapBuffers(&viup.IHandle)

fn C.IupGLWait(int)

fn init() {
	C.IupGLCanvasOpen()
}

pub fn create_context(attrs ...string) &viup.IHandle{
	canvas := C.IupGLCanvas(0)
	canvas.set_attr('buffer', 'double')
	canvas.set_attrs(...attrs)
	return canvas
}

pub fn is_current(control &viup.IHandle) bool {
	return C.IupGLIsCurrent(control) > 0
}

pub fn make_current(control &viup.IHandle) &viup.IHandle{
	C.IupGLMakeCurrent(control)
	return control
}

pub fn set_palette(control &viup.IHandle, index int, r f32, g f32, b f32) &viup.IHandle{
	C.IupGLPalette(control, index, r, g, b)
	return control
}

pub fn swap(control &viup.IHandle) &viup.IHandle{
	C.IupGLSwapBuffers(control)
	return control
}

pub fn wait(is_gl bool) {
	C.IupGLWait(is_gl)
}
