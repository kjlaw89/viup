module viup

#flag -I @VROOT/headers/iup
#flag -L .
#flag -liupglcontrols
#include "iup.h"
#include "iupglcontrols.h"

fn C.IupGLControlsOpen() int
fn C.IupGLCanvasBoxv(&Ihandle) &Ihandle
fn C.IupGLSubCanvas() &Ihandle
fn C.IupGLLabel(charptr) &Ihandle
fn C.IupGLSeparator() &Ihandle
fn C.IupGLButton(charptr) &Ihandle
fn C.IupGLToggle(charptr) &Ihandle
fn C.IupGLLink(charptr, charptr) &Ihandle
fn C.IupGLProgressBar() &Ihandle
fn C.IupGLVal() &Ihandle
fn C.IupGLFrame(&Ihandle) &Ihandle
fn C.IupGLExpander(&Ihandle) &Ihandle
fn C.IupGLScrollBox(&Ihandle) &Ihandle
fn C.IupGLSizeBox(&Ihandle) &Ihandle
fn C.IupGLText() &Ihandle
fn C.IupGLDrawImage(&Ihandle, charptr, int, int, int)
fn C.IupGLDrawText(&Ihandle, charptr, int, int, int)
fn C.IupGLDrawGetTextSize(&Ihandle, charptr, &int, &int)
fn C.IupGLDrawGetImageInfo(charptr, &int, &int, &int)

// gl_controls_open must be called after `open`
pub fn gl_controls_open() int {
	return C.IupGLControlsOpen()
}

// gl_canvas_boxv creates an OpenGL canvas container, place `children` in the box
pub fn gl_canvas_boxv(children []&Ihandle, attrs ...string) &Ihandle {
	mut ptrs := []&Ihandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&Ihandle(nil)) } // Add null value
	box := C.IupGLCanvasBoxv(ptrs.data)
	box.set_attrs(...attrs)
	return box
}

// gl_sub_canvas creates an embedded OpenGL sub-canvas, it exists only inside an `gl_canvas_box`
pub fn gl_sub_canvas(attrs ...string) &Ihandle {
	gl_sub_canvas := C.IupGLSubCanvas()
	gl_sub_canvas.set_attrs(...attrs)
	return gl_sub_canvas
}

// gl_label creates an embedded OpenGL label interface element, which displays a `title` and/or an image
pub fn gl_label(title string, attrs ...string) &Ihandle {
	gl_label := C.IupGLLabel(title.str)
	gl_label.set_attrs(...attrs)
	return gl_label
}

// gl_separator creates an embedded OpenGL separator interface element, which displays a vertical or horizontal line
pub fn gl_separator(attrs ...string) &Ihandle {
	gl_separator := C.IupGLSeparator()
	gl_separator.set_attrs(...attrs)
	return gl_separator
}

// gl_button creates an embedded OpenGL button
pub fn gl_button(title string, attrs ...string) &Ihandle {
	gl_button := C.IupGLButton(title.str)
	gl_button.set_attrs(...attrs)
	return gl_button
}

// gl_toggle creates an embedded OpenGL toggle interface element
pub fn gl_toggle(title string, attrs ...string) &Ihandle {
	gl_toggle := C.IupGLToggle(title.str)
	gl_toggle.set_attrs(...attrs)
	return gl_toggle
}

// gl_link creates an embedded OpenGL label that displays an underlined clickable `title`
pub fn gl_link(url string, title string, attrs ...string) &Ihandle {
	gl_link := C.IupGLLink(url.str, title.str)
	gl_link.set_attrs(...attrs)
	return gl_link
}

// gl_progress_bar creates an embedded OpenGL progress bar control
pub fn gl_progress_bar(attrs ...string) &Ihandle {
	gl_progress_bar := C.IupGLProgressBar()
	gl_progress_bar.set_attrs(...attrs)
	return gl_progress_bar
}

// gl_slider creates an embedded OpenGL Valuator control
pub fn gl_slider(attrs ...string) &Ihandle {
	gl_slider := C.IupGLVal()
	gl_slider.set_attrs(...attrs)
	return gl_slider
}

// gl_frame creates an embedded OpenGL container, which draws a frame with a title around its child
pub fn gl_frame(child &Ihandle, attrs ...string) &Ihandle {
	gl_frame := C.IupGLFrame(child)
	gl_frame.set_attrs(...attrs)
	return gl_frame
}

// gl_expander creates an embedded OpenGL container that can interactively show or hide its child
pub fn gl_expander(child &Ihandle, attrs ...string) &Ihandle {
	gl_expander := C.IupGLExpander(child)
	gl_expander.set_attrs(...attrs)
	return gl_expander
}

// gl_scroll_box creates an embedded OpenGL container that allows its child to be scrolled
pub fn gl_scroll_box(child &Ihandle, attrs ...string) &Ihandle {
	gl_scroll_box := C.IupGLScrollBox(child)
	gl_scroll_box.set_attrs(...attrs)
	return gl_scroll_box
}

// gl_size_box creates a void container that allows its child to be resized
pub fn gl_size_box(child &Ihandle, attrs ...string) &Ihandle {
	gl_size_box := C.IupGLSizeBox(child)
	gl_size_box.set_attrs(...attrs)
	return gl_size_box
}

// gl_text creates an embedded OpenGL text interface element, which displays a text and allows to edit it when clicked
pub fn gl_text(attrs ...string) &Ihandle {
	gl_text := C.IupGLText()
	gl_text.set_attrs(...attrs)
	return gl_text
}

// gl_draw_image draws an image given its `name`
pub fn (gl_control &Ihandle) gl_draw_image(name string, x int, y int, active int) &Ihandle {
	C.IupGLDrawImage(gl_control, name.str, x, y, active)
	return unsafe { gl_control }
}

// gl_draw_text draws a `str` in the given position(`x`,`y`) using the current FONT
pub fn (gl_control &Ihandle) gl_draw_text(str string, x int, y int) &Ihandle {
	C.IupGLDrawText(gl_control, str.str, str.len, x, y)
	return unsafe { gl_control }
}

// gl_draw_get_text_size returns the given `str` size using the current FONT
pub fn (gl_control &Ihandle) gl_draw_get_text_size(str string) (int, int) {
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
