module gl

import viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupgl
#include "iupgl.h"

fn C.IupGLCanvasOpen()

fn C.IupGLCanvas(charptr) voidptr

fn C.IupGLIsCurrent(voidptr) int

fn C.IupGLMakeCurrent(voidptr)

fn C.IupGLPalette(voidptr, int, f32, f32, f32)

fn C.IupGLSwapBuffers(voidptr)

fn C.IupGLWait(int)

fn init() {
	C.IupGLCanvasOpen()
}

pub fn create_context(attrs ...string) &viup.Control {
	canvas := &viup.Control(C.IupGLCanvas(0))
	canvas.set_attr('buffer', 'double')
	canvas.set_attrs(...attrs)
	return canvas
}

pub fn is_current(control &viup.Control) bool {
	return C.IupGLIsCurrent(control) > 0
}

pub fn make_current(control &viup.Control) &viup.Control {
	C.IupGLMakeCurrent(control)
	return control
}

pub fn set_palette(control &viup.Control, index int, r f32, g f32, b f32) &viup.Control {
	C.IupGLPalette(control, index, r, g, b)
	return control
}

pub fn swap(control &viup.Control) &viup.Control {
	C.IupGLSwapBuffers(control)
	return control
}

pub fn wait(is_gl bool) {
	C.IupGLWait(is_gl)
}
