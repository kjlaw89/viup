module main

import viup
import viup.gl

$if arm64 {
	#flag -L /usr/lib/iup
	#flag -L /lib/gcc/aarch64-linux-gnu/11/
	#flag -L /lib/aarch64-linux-gnu/
	#flag -lgcc
}

#flag linux -lGL
#flag windows -lopengl32
#include <GL/gl.h>

fn C.glClear(int)
fn C.glBegin(int)
fn C.glColor3f(f32, f32, f32)
fn C.glVertex3f(f32, f32, f32)
fn C.glEnd()
fn C.glFlush()

fn main() {
	canvas := gl.gl_canvas().set_handle('context').on_redraw(redraw)

	viup.dialog(viup.hbox([
		viup.fill(),
		&viup.Control(canvas),
		viup.fill(),
	]), 'title=GL Example', 'rastersize=640x480').show()

	viup.main_loop()
}

fn redraw(gl_canvas &gl.GL_Canvas, x f32, y f32) viup.FuncResult {
	gl.gl_make_current(gl_canvas)

	C.glClear(C.GL_COLOR_BUFFER_BIT)

	C.glBegin(C.GL_POLYGON)
	C.glColor3f(1, 0, 0)
	C.glVertex3f(-0.6, -0.75, 0.5)
	C.glColor3f(0, 1, 0)
	C.glVertex3f(0.6, -0.75, 0)
	C.glColor3f(0, 0, 1)
	C.glVertex3f(0, 0.75, 0)
	C.glEnd()

	gl.gl_swap_buffers(gl_canvas)

	return .cont
}
