module gl_controls

import viup { Ihandle, cleanup_iup, init_iup }
import viup.gl { GL_Canvas }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liupglcontrols -lftgl
#include "iup.h"
#include "iupglcontrols.h"

// `GL_Controls` inherits from `GL_Canvas`
@[heap]
pub struct GL_Controls {
	GL_Canvas
}

fn C.IupGLControlsOpen() int
fn C.IupGLCanvasBoxv(&GL_Controls) &GL_Controls
fn C.IupGLSubCanvas() &GL_Controls
fn C.IupGLLabel(charptr) &GL_Controls
fn C.IupGLSeparator() &GL_Controls
fn C.IupGLButton(charptr) &GL_Controls
fn C.IupGLToggle(charptr) &GL_Controls
fn C.IupGLLink(charptr, charptr) &GL_Controls
fn C.IupGLProgressBar() &GL_Controls
fn C.IupGLVal() &GL_Controls
fn C.IupGLFrame(&GL_Controls) &GL_Controls
fn C.IupGLExpander(&GL_Controls) &GL_Controls
fn C.IupGLScrollBox(&GL_Controls) &GL_Controls
fn C.IupGLSizeBox(&GL_Controls) &GL_Controls
fn C.IupGLText() &GL_Controls
fn C.IupGLDrawImage(&GL_Controls, charptr, int, int, int)
fn C.IupGLDrawText(&GL_Controls, charptr, int, int, int)
fn C.IupGLDrawGetTextSize(&GL_Controls, charptr, &int, &int)
fn C.IupGLDrawGetImageInfo(charptr, &int, &int, &int)

// gl_controls_open must be called after `open`
fn init() {
	init_iup()
	C.IupGLControlsOpen()
}

fn cleanup() {
	cleanup_iup()
}

// gl_control_boxv creates an OpenGL canvas container, place `children` in the box
pub fn gl_control_boxv(children []&GL_Controls, attrs ...string) &GL_Controls {
	mut ptrs := []&GL_Controls{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &GL_Controls(nil) } // Add null value
	box := C.IupGLCanvasBoxv(ptrs.data)
	box.set_attrs(...attrs)
	return box
}

// gl_sub_canvas creates an embedded OpenGL sub-canvas, it exists only inside an `gl_control_box`
pub fn gl_sub_canvas(attrs ...string) &GL_Controls {
	gl_sub_canvas := C.IupGLSubCanvas()
	gl_sub_canvas.set_attrs(...attrs)
	return gl_sub_canvas
}

// gl_label creates an embedded OpenGL label interface element, which displays a `title` and/or an image
pub fn gl_label(title string, attrs ...string) &GL_Controls {
	gl_label := C.IupGLLabel(title.str)
	gl_label.set_attrs(...attrs)
	return gl_label
}

// gl_separator creates an embedded OpenGL separator interface element, which displays a vertical or horizontal line
pub fn gl_separator(attrs ...string) &GL_Controls {
	gl_separator := C.IupGLSeparator()
	gl_separator.set_attrs(...attrs)
	return gl_separator
}

// gl_button creates an embedded OpenGL button
pub fn gl_button(title string, attrs ...string) &GL_Controls {
	gl_button := C.IupGLButton(title.str)
	gl_button.set_attrs(...attrs)
	return gl_button
}

// gl_toggle creates an embedded OpenGL toggle interface element
pub fn gl_toggle(title string, attrs ...string) &GL_Controls {
	gl_toggle := C.IupGLToggle(title.str)
	gl_toggle.set_attrs(...attrs)
	return gl_toggle
}

// gl_link creates an embedded OpenGL label that displays an underlined clickable `title`
pub fn gl_link(url string, title string, attrs ...string) &GL_Controls {
	gl_link := C.IupGLLink(url.str, title.str)
	gl_link.set_attrs(...attrs)
	return gl_link
}

// gl_progress_bar creates an embedded OpenGL progress bar control
pub fn gl_progress_bar(attrs ...string) &GL_Controls {
	gl_progress_bar := C.IupGLProgressBar()
	gl_progress_bar.set_attrs(...attrs)
	return gl_progress_bar
}

// gl_slider creates an embedded OpenGL Valuator control
pub fn gl_slider(attrs ...string) &GL_Controls {
	gl_slider := C.IupGLVal()
	gl_slider.set_attrs(...attrs)
	return gl_slider
}

// gl_frame creates an embedded OpenGL container, which draws a frame with a title around its child
pub fn gl_frame(child &GL_Controls, attrs ...string) &GL_Controls {
	gl_frame := C.IupGLFrame(child)
	gl_frame.set_attrs(...attrs)
	return gl_frame
}

// gl_expander creates an embedded OpenGL container that can interactively show or hide its child
pub fn gl_expander(child &GL_Controls, attrs ...string) &GL_Controls {
	gl_expander := C.IupGLExpander(child)
	gl_expander.set_attrs(...attrs)
	return gl_expander
}

// gl_scroll_box creates an embedded OpenGL container that allows its child to be scrolled
pub fn gl_scroll_box(child &GL_Controls, attrs ...string) &GL_Controls {
	gl_scroll_box := C.IupGLScrollBox(child)
	gl_scroll_box.set_attrs(...attrs)
	return gl_scroll_box
}

// gl_size_box creates a void container that allows its child to be resized
pub fn gl_size_box(child &GL_Controls, attrs ...string) &GL_Controls {
	gl_size_box := C.IupGLSizeBox(child)
	gl_size_box.set_attrs(...attrs)
	return gl_size_box
}

// gl_text creates an embedded OpenGL text interface element, which displays a text and allows to edit it when clicked
pub fn gl_text(attrs ...string) &GL_Controls {
	gl_text := C.IupGLText()
	gl_text.set_attrs(...attrs)
	return gl_text
}

// gl_draw_image draws an image given its `name`
pub fn (gl_control &GL_Controls) gl_draw_image(name string, x int, y int, active int) &GL_Controls {
	C.IupGLDrawImage(gl_control, name.str, x, y, active)
	return gl_control
}

// gl_draw_text draws a `str` in the given position(`x`,`y`) using the current FONT
pub fn (gl_control &GL_Controls) gl_draw_text(str string, x int, y int) &GL_Controls {
	C.IupGLDrawText(gl_control, str.str, str.len, x, y)
	return gl_control
}

// gl_draw_get_text_size returns the given `str` size using the current FONT
pub fn (gl_control &GL_Controls) gl_draw_get_text_size(str string) (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupGLDrawGetTextSize(gl_control, str.str, &w, &h)
	return w, h
}

// gl_draw_get_image_info returns the given image `name` size and bits per pixel. bpp can be 8, 24 or 32
pub fn gl_draw_get_image_info(name string) (int, int, int) {
	mut w := int(0)
	mut h := int(0)
	mut bpp := int(0)
	C.IupGLDrawGetImageInfo(name.str, &w, &h, &bpp)
	return w, h, bpp
}

// set_handle is a helper function for `GL_Controls` that calls the global
// `set_handle` function. Returns back an instance of `GL_Controls` for chaining
pub fn (gl_control &GL_Controls) set_handle(name string) &GL_Controls {
	C.IupSetHandle(name.str, &Ihandle(gl_control))
	return gl_control
}

// get_gl_control_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_gl_control_handle(handle string) &GL_Controls {
	return &GL_Controls(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `GL_Controls` and
// returns `GL_Controls` back for chaining
pub fn (gl_control &GL_Controls) set_attr(name string, value string) &GL_Controls {
	C.IupSetStrAttribute(&Ihandle(gl_control), name.to_upper().trim_space().str, value.trim_space().str)

	return gl_control
}

// set_attrs takes all x=x values and applies them to `GL_Controls` and
// returns `GL_Controls` back for chaining
pub fn (gl_control &GL_Controls) set_attrs(attrs ...string) &GL_Controls {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		gl_control.set_attr(split[0], split[1])
	}

	return gl_control
}

// set_data associates the provided `data` with `GL_Controls` and
// returns `GL_Controls` back for chaining
pub fn (gl_control &GL_Controls) set_data(name string, data voidptr) &GL_Controls {
	C.IupSetAttribute(&Ihandle(gl_control), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return gl_control
}

// unset_attr clears the provided attribute
pub fn (gl_control &GL_Controls) unset_attr(name string) &GL_Controls {
	C.IupSetAttribute(&Ihandle(gl_control), name.to_upper().trim_space().str, C.NULL)
	return gl_control
}
