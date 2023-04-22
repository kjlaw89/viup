module viup

#flag -L .
#include "iup.h"
#include "iupdraw.h"

[heap]
pub struct Rect {
pub mut:
	x1 int
	x2 int
	y1 int
	y2 int
}

fn C.IupDrawBegin(&Ihandle)
fn C.IupDrawEnd(&Ihandle)
fn C.IupDrawSetClipRect(&Ihandle, int, int, int, int)
fn C.IupDrawGetClipRect(&Ihandle, &int, &int, &int, &int)
fn C.IupDrawResetClip(&Ihandle)
fn C.IupDrawParentBackground(&Ihandle)
fn C.IupDrawLine(&Ihandle, int, int, int, int)
fn C.IupDrawRectangle(&Ihandle, int, int, int, int)
fn C.IupDrawArc(&Ihandle, int, int, int, int, f64, f64)
fn C.IupDrawPolygon(&Ihandle, &int, int)
fn C.IupDrawText(&Ihandle, charptr, int, int, int, int, int)
fn C.IupDrawImage(&Ihandle, charptr, int, int, int, int)
fn C.IupDrawSelectRect(&Ihandle, int, int, int, int)
fn C.IupDrawFocusRect(&Ihandle, int, int, int, int)
fn C.IupDrawGetSize(&Ihandle, &int, &int)
fn C.IupDrawGetTextSize(&Ihandle, charptr, int, &int, &int)
fn C.IupDrawGetImageInfo(charptr, &int, &int, &int)

// draw_begin initialize the drawing process
pub fn (cavas &Ihandle) draw_begin() &Ihandle {
	C.IupDrawBegin(cavas)
	return unsafe { cavas }
}

// draw_end terminates the drawing process and actually draw on screen
pub fn (cavas &Ihandle) draw_end() &Ihandle {
	C.IupDrawEnd(cavas)
	return unsafe { cavas }
}

// draw_set_clip_rect defines a rectangular clipping region
pub fn (cavas &Ihandle) draw_set_clip_rect(rect Rect) &Ihandle {
	C.IupDrawSetClipRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return unsafe { cavas }
}

// get_clip_rect returns the previous rectangular clipping region set by `draw_set_clip_rect`, if clipping was reset returns 0 in all values
pub fn (cavas &Ihandle) get_clip_rect() Rect {
	mut rect := Rect{}
	C.IupDrawGetClipRect(cavas, &rect.x1, &rect.y1, &rect.x2, &rect.y2)
	return rect
}

// reset_clip reset the clipping area to none
pub fn (cavas &Ihandle) reset_clip() &Ihandle {
	C.IupDrawResetClip(cavas)
	return unsafe { cavas }
}

// draw_parent_background fills the canvas with the native parent background color
pub fn (cavas &Ihandle) draw_parent_background() &Ihandle {
	C.IupDrawParentBackground(cavas)
	return unsafe { cavas }
}

// draw_line draws a line including start and end points
pub fn (cavas &Ihandle) draw_line(x1 int, y1 int, x2 int, y2 int) &Ihandle {
	C.IupDrawLine(cavas, x1, y1, x2, y2)
	return unsafe { cavas }
}

// draw_rectangle draws a rectangle including start and end points
pub fn (cavas &Ihandle) draw_rectangle(rect Rect) &Ihandle {
	C.IupDrawRectangle(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return unsafe { cavas }
}

// draw_arc draws an arc inside a rectangle `rect` between the two angles in degrees. When filled will draw a pie shape with the vertex at the center of the rectangle. Angles are counter-clock wise relative to the 3 o'clock position
pub fn (cavas &Ihandle) draw_arc(rect Rect, a1 f64, a2 f64) &Ihandle {
	C.IupDrawArc(cavas, rect.x1, rect.y1, rect.x2, rect.y2, a1, a2)
	return unsafe { cavas }
}

// draw_polygon draws a polygon. Coordinates are stored in the array `points` in the sequence: x1, y1, x2, y2, ...
pub fn (cavas &Ihandle) draw_polygon(points []int) &Ihandle {
	C.IupDrawPolygon(cavas, points.data, points.len)
	return unsafe { cavas }
}

// draw_text draws a `text` in the given position using the font defined by DRAWFONT (since 3.22), if not defined then use FONT
pub fn (cavas &Ihandle) draw_text(text string, x int, y int, w int, h int) &Ihandle {
	C.IupDrawText(cavas, text.str, text.len, x, y, w, h)
	return unsafe { cavas }
}

// draw_image draws an image given its `name`. The coordinates are relative the top-left corner of the image
pub fn (cavas &Ihandle) draw_image(name string, x int, y int, w int, h int) &Ihandle {
	C.IupDrawImage(cavas, name.str, x, y, w, h)
	return unsafe { cavas }
}

// draw_select_rect draws a selection rectangle `rect`
pub fn (cavas &Ihandle) draw_select_rect(rect Rect) &Ihandle {
	C.IupDrawSelectRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return unsafe { cavas }
}

// draw_focus_rect draws a focus rectangle `rect`
pub fn (cavas &Ihandle) draw_focus_rect(rect Rect) &Ihandle {
	C.IupDrawFocusRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
	return unsafe { cavas }
}

// draw_get_size returns the drawing area size
pub fn (cavas &Ihandle) draw_get_size() (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetSize(cavas, &w, &h)
	return w, h
}

// draw_get_text_size returns the given `text` size using the font defined by DRAWFONT, if not defined then use FONT
pub fn (cavas &Ihandle) draw_get_text_size(text string) (int, int) {
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
