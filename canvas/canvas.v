module canvas

import viup { Control, Ihandle, cleanup_iup, init_iup }

#include "iup.h"
#include "iupdraw.h"

// `Canvas` inherits from `Control`
@[heap]
pub struct Canvas {
	Control
}

@[heap]
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
pub fn (canvas_control &Canvas) draw_begin() &Canvas {
	C.IupDrawBegin(canvas_control)
	return canvas_control
}

// draw_end terminates the drawing process and actually draw on screen
pub fn (canvas_control &Canvas) draw_end() &Canvas {
	C.IupDrawEnd(canvas_control)
	return canvas_control
}

// draw_set_clip_rect defines a rectangular clipping region
pub fn (canvas_control &Canvas) draw_set_clip_rect(rect Rect) &Canvas {
	C.IupDrawSetClipRect(canvas_control, rect.x1, rect.y1, rect.x2, rect.y2)
	return canvas_control
}

// get_clip_rect returns the previous rectangular clipping region set by `draw_set_clip_rect`, if clipping was reset returns 0 in all values
pub fn (canvas_control &Canvas) get_clip_rect() Rect {
	mut rect := Rect{}
	C.IupDrawGetClipRect(canvas_control, &rect.x1, &rect.y1, &rect.x2, &rect.y2)
	return rect
}

// reset_clip reset the clipping area to none
pub fn (canvas_control &Canvas) reset_clip() &Canvas {
	C.IupDrawResetClip(canvas_control)
	return canvas_control
}

// draw_parent_background fills the canvas with the native parent background color
pub fn (canvas_control &Canvas) draw_parent_background() &Canvas {
	C.IupDrawParentBackground(canvas_control)
	return canvas_control
}

// draw_line draws a line including start and end points
pub fn (canvas_control &Canvas) draw_line(x1 int, y1 int, x2 int, y2 int) &Canvas {
	C.IupDrawLine(canvas_control, x1, y1, x2, y2)
	return canvas_control
}

// draw_rectangle draws a rectangle including start and end points
pub fn (canvas_control &Canvas) draw_rectangle(rect Rect) &Canvas {
	C.IupDrawRectangle(canvas_control, rect.x1, rect.y1, rect.x2, rect.y2)
	return canvas_control
}

// draw_arc draws an arc inside a rectangle `rect` between the two angles in degrees. When filled will draw a pie shape with the vertex at the center of the rectangle. Angles are counter-clock wise relative to the 3 o'clock position
pub fn (canvas_control &Canvas) draw_arc(rect Rect, a1 f64, a2 f64) &Canvas {
	C.IupDrawArc(canvas_control, rect.x1, rect.y1, rect.x2, rect.y2, a1, a2)
	return canvas_control
}

// draw_polygon draws a polygon. Coordinates are stored in the array `points` in the sequence: x1, y1, x2, y2, ...
pub fn (canvas_control &Canvas) draw_polygon(points []int) &Canvas {
	C.IupDrawPolygon(canvas_control, points.data, points.len)
	return canvas_control
}

// draw_text draws a `text` in the given position using the font defined by DRAWFONT (since 3.22), if not defined then use FONT
pub fn (canvas_control &Canvas) draw_text(text string, x int, y int, w int, h int) &Canvas {
	C.IupDrawText(canvas_control, text.str, text.len, x, y, w, h)
	return canvas_control
}

// draw_image draws an image given its `name`. The coordinates are relative the top-left corner of the image
pub fn (canvas_control &Canvas) draw_image(name string, x int, y int, w int, h int) &Canvas {
	C.IupDrawImage(canvas_control, name.str, x, y, w, h)
	return canvas_control
}

// draw_select_rect draws a selection rectangle `rect`
pub fn (canvas_control &Canvas) draw_select_rect(rect Rect) &Canvas {
	C.IupDrawSelectRect(canvas_control, rect.x1, rect.y1, rect.x2, rect.y2)
	return canvas_control
}

// draw_focus_rect draws a focus rectangle `rect`
pub fn (canvas_control &Canvas) draw_focus_rect(rect Rect) &Canvas {
	C.IupDrawFocusRect(canvas_control, rect.x1, rect.y1, rect.x2, rect.y2)
	return canvas_control
}

// draw_get_size returns the drawing area size
pub fn (canvas_control &Canvas) draw_get_size() (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetSize(canvas_control, &w, &h)
	return w, h
}

// draw_get_text_size returns the given `text` size using the font defined by DRAWFONT, if not defined then use FONT
pub fn (canvas_control &Canvas) draw_get_text_size(text string) (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetTextSize(canvas_control, text.str, text.len, &w, &h)
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
pub fn (canvas_control &Canvas) set_handle(name string) &Canvas {
	C.IupSetHandle(name.str, &Ihandle(canvas_control))
	return canvas_control
}

// get_cavas_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_cavas_handle(handle string) &Canvas {
	return &Canvas(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Canvas` and
// returns `Canvas` back for chaining
pub fn (canvas_control &Canvas) set_attr(name string, value string) &Canvas {
	C.IupSetStrAttribute(&Ihandle(canvas_control), name.to_upper().trim_space().str, value.trim_space().str)

	return canvas_control
}

// set_attrs takes all x=x values and applies them to `Canvas` and
// returns `Canvas` back for chaining
pub fn (canvas_control &Canvas) set_attrs(attrs ...string) &Canvas {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		canvas_control.set_attr(split[0], split[1])
	}

	return canvas_control
}

// set_data associates the provided `data` with `Canvas` and
// returns `Canvas` back for chaining
pub fn (canvas_control &Canvas) set_data(name string, data voidptr) &Canvas {
	C.IupSetAttribute(&Ihandle(canvas_control), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return canvas_control
}

// unset_attr clears the provided attribute
pub fn (canvas_control &Canvas) unset_attr(name string) &Canvas {
	C.IupSetAttribute(&Ihandle(canvas_control), name.to_upper().trim_space().str, C.NULL)
	return canvas_control
}
