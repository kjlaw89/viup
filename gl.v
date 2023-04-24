module viup

#flag -I @VROOT/headers/iup
#flag -L /usr/lib/iup
#flag -liupgl
#include "iup.h"
#include "iupgl.h"

fn C.IupGLCanvasOpen()
fn C.IupGLBackgroundBox(&Ihandle) &Ihandle
fn C.IupGLCanvas(charptr) &Ihandle
fn C.IupGLIsCurrent(&Ihandle) int
fn C.IupGLMakeCurrent(&Ihandle)
fn C.IupGLPalette(&Ihandle, int, f32, f32, f32)
fn C.IupGLSwapBuffers(&Ihandle)
fn C.IupGLUseFont(&Ihandle, int, int, int)
fn C.IupGLWait(int)

// gl_canvas_open must be called after a `open`
pub fn gl_canvas_open() {
	C.IupGLCanvasOpen()
}

// gl_canvas creates an OpenGL canvas (drawing area for OpenGL)
pub fn gl_canvas(attrs ...string) &Ihandle {
	canvas := C.IupGLCanvas(0)
	canvas.set_attr('buffer', 'double')
	canvas.set_attrs(...attrs)
	return canvas
}

// gl_is_current returns true if the given `canvas` is the current OpenGL context
pub fn gl_is_current(canvas &Ihandle) bool {
	return C.IupGLIsCurrent(canvas) > 0
}

// gl_make_current activates the given `canvas` as the current OpenGL context
pub fn gl_make_current(canvas &Ihandle) &Ihandle {
	C.IupGLMakeCurrent(canvas)
	return unsafe { canvas }
}

// gl_palette defines a color in the color palette, this function is necessary when INDEX color is used
pub fn gl_palette(canvas &Ihandle, index int, r f32, g f32, b f32) &Ihandle {
	C.IupGLPalette(canvas, index, r, g, b)
	return unsafe { canvas }
}

// gl_swap_buffers makes the BACK buffer visible, this function is necessary when a double buffer is used
pub fn gl_swap_buffers(canvas &Ihandle) &Ihandle {
	C.IupGLSwapBuffers(canvas)
	return unsafe { canvas }
}

// gl_wait if `is_gl` is true it will call glFinish or glXWaitGL, else will call GdiFlush or glXWaitX
pub fn gl_wait(is_gl bool) {
	C.IupGLWait(is_gl)
}

// gl_background_box creates a simple native container without decorations, but with OpenGL enabled
pub fn (gl &Ihandle) gl_background_box() &Ihandle {
	return C.IupGLBackgroundBox(gl)
}

// gl_use_font creates a bitmap display list from the current FONT attribute
pub fn (gl &Ihandle) gl_use_font(first int, count int, list_base int) &Ihandle {
	C.IupGLUseFont(gl, first, count, list_base)
	return unsafe { gl }
}
