module gl

import viup { Ihandle, cleanup_iup, init_iup }
import viup.canvas { Canvas }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liupgl
#include "iup.h"
#include "iupgl.h"

// `GL_Canvas` inherits from `Canvas`
[heap]
pub struct GL_Canvas {
	Canvas
}

fn C.IupGLCanvasOpen()
fn C.IupGLBackgroundBox(&GL_Canvas) &GL_Canvas
fn C.IupGLCanvas(charptr) &GL_Canvas
fn C.IupGLIsCurrent(&GL_Canvas) int
fn C.IupGLMakeCurrent(&GL_Canvas)
fn C.IupGLPalette(&GL_Canvas, int, f32, f32, f32)
fn C.IupGLSwapBuffers(&GL_Canvas)
fn C.IupGLUseFont(&GL_Canvas, int, int, int)
fn C.IupGLWait(int)

// gl_canvas_open must be called after a `open`
fn init() {
	init_iup()
	C.IupGLCanvasOpen()
}

fn cleanup() {
	cleanup_iup()
}

// gl_canvas creates an OpenGL gl_canvas (drawing area for OpenGL)
pub fn gl_canvas(attrs ...string) &GL_Canvas {
	gl_canvas := C.IupGLCanvas(0)
	gl_canvas.set_attr('buffer', 'double')
	gl_canvas.set_attrs(...attrs)
	return gl_canvas
}

// gl_is_current returns true if the given `gl_canvas` is the current OpenGL context
pub fn gl_is_current(gl_canvas &GL_Canvas) bool {
	return C.IupGLIsCurrent(gl_canvas) > 0
}

// gl_make_current activates the given `gl_canvas` as the current OpenGL context
pub fn gl_make_current(gl_canvas &GL_Canvas) &GL_Canvas {
	C.IupGLMakeCurrent(gl_canvas)
	return gl_canvas
}

// gl_palette defines a color in the color palette, this function is necessary when INDEX color is used
pub fn gl_palette(gl_canvas &GL_Canvas, index int, r f32, g f32, b f32) &GL_Canvas {
	C.IupGLPalette(gl_canvas, index, r, g, b)
	return gl_canvas
}

// gl_swap_buffers makes the BACK buffer visible, this function is necessary when a double buffer is used
pub fn gl_swap_buffers(gl_canvas &GL_Canvas) &GL_Canvas {
	C.IupGLSwapBuffers(gl_canvas)
	return gl_canvas
}

// gl_wait if `is_gl` is true it will call glFinish or glXWaitGL, else will call GdiFlush or glXWaitX
pub fn gl_wait(is_gl bool) {
	C.IupGLWait(is_gl)
}

// gl_background_box creates a simple native container without decorations, but with OpenGL enabled
pub fn (gl_canvas &GL_Canvas) gl_background_box() &GL_Canvas {
	return C.IupGLBackgroundBox(gl_canvas)
}

// gl_use_font creates a bitmap display list from the current FONT attribute
pub fn (gl_canvas &GL_Canvas) gl_use_font(first int, count int, list_base int) &GL_Canvas {
	C.IupGLUseFont(gl_canvas, first, count, list_base)
	return gl_canvas
}

// set_handle is a helper function for `GL_Canvas` that calls the global
// `set_handle` function. Returns back an instance of `GL_Canvas` for chaining
pub fn (gl_canvas &GL_Canvas) set_handle(name string) &GL_Canvas {
	C.IupSetHandle(name.str, &Ihandle(gl_canvas))
	return gl_canvas
}

// get_gl_canvas_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_gl_canvas_handle(handle string) &GL_Canvas {
	return &GL_Canvas(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `GL_Canvas` and
// returns `GL_Canvas` back for chaining
pub fn (gl_canvas &GL_Canvas) set_attr(name string, value string) &GL_Canvas {
	C.IupSetStrAttribute(&Ihandle(gl_canvas), name.to_upper().trim_space().str, value.trim_space().str)

	return gl_canvas
}

// set_attrs takes all x=x values and applies them to `GL_Canvas` and
// returns `GL_Canvas` back for chaining
pub fn (gl_canvas &GL_Canvas) set_attrs(attrs ...string) &GL_Canvas {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		gl_canvas.set_attr(split[0], split[1])
	}

	return gl_canvas
}

// set_data associates the provided `data` with `GL_Canvas` and
// returns `GL_Canvas` back for chaining
pub fn (gl_canvas &GL_Canvas) set_data(name string, data voidptr) &GL_Canvas {
	C.IupSetAttribute(&Ihandle(gl_canvas), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return gl_canvas
}

// unset_attr clears the provided attribute
pub fn (gl_canvas &GL_Canvas) unset_attr(name string) &GL_Canvas {
	C.IupSetAttribute(&Ihandle(gl_canvas), name.to_upper().trim_space().str, C.NULL)
	return gl_canvas
}
