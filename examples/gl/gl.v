module main

import viup
import viup.gl

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
	canvas := gl.create_context().set_handle("context").callback(viup.ActionFunc(redraw))

	viup.dialog(
		viup.hbox([
			viup.fill(),
			canvas,
			viup.fill()
		]),
		"title=GL Example",
		"rastersize=640x480"
	).show()

	viup.main_loop()
	viup.close()
}

fn redraw(control &viup.Control, x f32, y f32) viup.FuncResult {
	gl.make_current(control)
	
	C.glClear(C.GL_COLOR_BUFFER_BIT)

	C.glBegin(C.GL_POLYGON)
		C.glColor3f(1, 0, 0) C.glVertex3f(-0.6, -0.75, 0.5)
		C.glColor3f(0, 1, 0) C.glVertex3f(0.6, -0.75, 0)
		C.glColor3f(0, 0, 1) C.glVertex3f(0, 0.75, 0)
	C.glEnd()

	gl.swap(control)

	return .cont
}