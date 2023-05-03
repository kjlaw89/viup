module canvas

import viup { Control, Ihandle, cleanup_iup, init_iup }

#include "iup.h"
#include "iupdraw.h"

// `Canvas` inherits from `Control`
[heap]
pub struct Canvas {
	Control
}

[heap]
pub struct Rect {
pub mut:
	x1 int
	x2 int
	y1 int
	y2 int
}

fn C.IupDrawBegin(&Canvas)
fn C.IupDrawEnd(&Canvas)
fn C.IupDrawSetClipRect(&Canvas, int, int, int, int)
fn C.IupDrawGetClipRect(&Canvas, &int, &int, &int, &int)
fn C.IupDrawResetClip(&Canvas)
fn C.IupDrawParentBackground(&Canvas)
fn C.IupDrawLine(&Canvas, int, int, int, int)
fn C.IupDrawRectangle(&Canvas, int, int, int, int)
fn C.IupDrawArc(&Canvas, int, int, int, int, f64, f64)
fn C.IupDrawPolygon(&Canvas, &int, int)
fn C.IupDrawText(&Canvas, charptr, int, int, int, int, int)
fn C.IupDrawImage(&Canvas, charptr, int, int, int, int)
fn C.IupDrawSelectRect(&Canvas, int, int, int, int)
fn C.IupDrawFocusRect(&Canvas, int, int, int, int)
fn C.IupDrawGetSize(&Canvas, &int, &int)
fn C.IupDrawGetTextSize(&Canvas, charptr, int, &int, &int)
fn C.IupDrawGetImageInfo(charptr, &int, &int, &int)

fn init() {
	init_iup()
}

fn cleanup() {
	cleanup_iup()
}

// draw_begin initialize the drawing process
pub fn (cavas &Canvas) draw_begin() &Canvas {
	C.IupDrawBegin(cavas)
	return cavas
}

// draw_end terminates the drawing process and actually draw on screen
pub fn (cavas &Canvas) draw_end() &Canvas {
	C.IupDrawEnd(cavas)
	return cavas
}

// draw_set_clip_rect defines a rectangular clipping region
pub fn (cavas &Canvas) draw_set_clip_rect(rect Rect) &Canvas {
	C.IupDrawSetClipRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return cavas
}

// get_clip_rect returns the previous rectangular clipping region set by `draw_set_clip_rect`, if clipping was reset returns 0 in all values
pub fn (cavas &Canvas) get_clip_rect() Rect {
	mut rect := Rect{}
	C.IupDrawGetClipRect(cavas, &rect.x1, &rect.y1, &rect.x2, &rect.y2)
	return rect
}

// reset_clip reset the clipping area to none
pub fn (cavas &Canvas) reset_clip() &Canvas {
	C.IupDrawResetClip(cavas)
	return cavas
}

// draw_parent_background fills the canvas with the native parent background color
pub fn (cavas &Canvas) draw_parent_background() &Canvas {
	C.IupDrawParentBackground(cavas)
	return cavas
}

// draw_line draws a line including start and end points
pub fn (cavas &Canvas) draw_line(x1 int, y1 int, x2 int, y2 int) &Canvas {
	C.IupDrawLine(cavas, x1, y1, x2, y2)
	return cavas
}

// draw_rectangle draws a rectangle including start and end points
pub fn (cavas &Canvas) draw_rectangle(rect Rect) &Canvas {
	C.IupDrawRectangle(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return cavas
}

// draw_arc draws an arc inside a rectangle `rect` between the two angles in degrees. When filled will draw a pie shape with the vertex at the center of the rectangle. Angles are counter-clock wise relative to the 3 o'clock position
pub fn (cavas &Canvas) draw_arc(rect Rect, a1 f64, a2 f64) &Canvas {
	C.IupDrawArc(cavas, rect.x1, rect.y1, rect.x2, rect.y2, a1, a2)
	return cavas
}

// draw_polygon draws a polygon. Coordinates are stored in the array `points` in the sequence: x1, y1, x2, y2, ...
pub fn (cavas &Canvas) draw_polygon(points []int) &Canvas {
	C.IupDrawPolygon(cavas, points.data, points.len)
	return cavas
}

// draw_text draws a `text` in the given position using the font defined by DRAWFONT (since 3.22), if not defined then use FONT
pub fn (cavas &Canvas) draw_text(text string, x int, y int, w int, h int) &Canvas {
	C.IupDrawText(cavas, text.str, text.len, x, y, w, h)
	return cavas
}

// draw_image draws an image given its `name`. The coordinates are relative the top-left corner of the image
pub fn (cavas &Canvas) draw_image(name string, x int, y int, w int, h int) &Canvas {
	C.IupDrawImage(cavas, name.str, x, y, w, h)
	return cavas
}

// draw_select_rect draws a selection rectangle `rect`
pub fn (cavas &Canvas) draw_select_rect(rect Rect) &Canvas {
	C.IupDrawSelectRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return cavas
}

// draw_focus_rect draws a focus rectangle `rect`
pub fn (cavas &Canvas) draw_focus_rect(rect Rect) &Canvas {
	C.IupDrawFocusRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return cavas
}

// draw_get_size returns the drawing area size
pub fn (cavas &Canvas) draw_get_size() (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetSize(cavas, &w, &h)
	return w, h
}

// draw_get_text_size returns the given `text` size using the font defined by DRAWFONT, if not defined then use FONT
pub fn (cavas &Canvas) draw_get_text_size(text string) (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetTextSize(cavas, text.str, text.len, &w, &h)
	return w, h
}

// draw_get_image_info returns the given image `name` size and bits per pixel. bpp can be 8, 24 or 32
pub fn draw_get_image_info(name string) (int, int, int) {
	mut w := int(0)
	mut h := int(0)
	mut bpp := int(0)
	C.IupDrawGetImageInfo(name.str, &w, &h, &bpp)
	return w, h, bpp
}

// set_handle is a helper function for `Canvas` that calls the global
// `set_handle` function. Returns back an instance of `Canvas` for chaining
pub fn (cavas &Canvas) set_handle(name string) &Canvas {
	C.IupSetHandle(name.str, &Ihandle(cavas))
	return cavas
}

// get_cavas_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_cavas_handle(handle string) &Canvas {
	return &Canvas(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Canvas` and
// returns `Canvas` back for chaining
pub fn (cavas &Canvas) set_attr(name string, value string) &Canvas {
	C.IupSetStrAttribute(&Ihandle(cavas), name.to_upper().trim_space().str, value.trim_space().str)

	return cavas
}

// set_attrs takes all x=x values and applies them to `Canvas` and
// returns `Canvas` back for chaining
pub fn (cavas &Canvas) set_attrs(attrs ...string) &Canvas {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		cavas.set_attr(split[0], split[1])
	}

	return cavas
}

// set_data associates the provided `data` with `Canvas` and
// returns `Canvas` back for chaining
pub fn (cavas &Canvas) set_data(name string, data voidptr) &Canvas {
	C.IupSetAttribute(&Ihandle(cavas), '${name}_data'.to_upper().trim_space().str, charptr(data))

	return cavas
}

// unset_attr clears the provided attribute
pub fn (cavas &Canvas) unset_attr(name string) &Canvas {
	C.IupSetAttribute(&Ihandle(cavas), name.to_upper().trim_space().str, C.NULL)
	return cavas
}

// ==============Canvas==============
pub type IFnff = fn (&Canvas, f32, f32) viup.FuncResult // canvas_action

// on_redraw Action generated when the canvas needs to be redrawn
pub fn (cavas &Canvas) on_redraw(func IFnff) &Canvas {
	C.IupSetCallback(&Ihandle(cavas), c'ACTION', func)
	return cavas
}
