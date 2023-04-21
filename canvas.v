module viup

[heap]
pub struct Rect {
pub mut:
	x1 int
	x2 int
	y1 int
	y2 int
}

fn C.IupDrawBegin(&IHandle)
fn C.IupDrawEnd(&IHandle)

fn C.IupDrawSetClipRect(&IHandle, int, int, int, int)
fn C.IupDrawGetClipRect(&IHandle, &int, &int, &int, &int)
fn C.IupDrawResetClip(&IHandle)

fn C.IupDrawParentBackground(&IHandle)
fn C.IupDrawLine(&IHandle, int, int, int, int)
fn C.IupDrawRectangle(&IHandle, int, int, int, int)
fn C.IupDrawArc(&IHandle, int, int, int, int, f64, f64)
fn C.IupDrawPolygon(&IHandle, &int, int)
fn C.IupDrawText(&IHandle, charptr, int, int, int, int, int)
fn C.IupDrawImage(&IHandle, charptr, int, int, int, int)
fn C.IupDrawSelectRect(&IHandle, int, int, int, int)
fn C.IupDrawFocusRect(&IHandle, int, int, int, int)

fn C.IupDrawGetSize(&IHandle, &int, &int)
fn C.IupDrawGetTextSize(&IHandle, charptr, int, &int, &int)
fn C.IupDrawGetImageInfo(charptr, &int, &int, &int)

pub fn (cavas &IHandle) draw_begin() {
	C.IupDrawBegin(cavas)
}

pub fn (cavas &IHandle) draw_end() {
	C.IupDrawEnd(cavas)
}

pub fn (cavas &IHandle) draw_set_clip_rect(rect Rect) {
	C.IupDrawSetClipRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
}

pub fn (cavas &IHandle) get_clip_rect() Rect {
	mut rect := Rect{}
	C.IupDrawGetClipRect(cavas, &rect.x1, &rect.y1, &rect.x2, &rect.y2)
	return rect
}

pub fn (cavas &IHandle) reset_clip() {
	C.IupDrawResetClip(cavas)
}

pub fn (cavas &IHandle) draw_parent_background() {
	C.IupDrawParentBackground(cavas)
}

pub fn (cavas &IHandle) draw_line(x1 int, y1 int, x2 int, y2 int) {
	C.IupDrawLine(cavas, x1, y1, x2, y2)
}

pub fn (cavas &IHandle) draw_rectangle(rect Rect) {
	C.IupDrawRectangle(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
}

pub fn (cavas &IHandle) draw_arc(rect Rect, a1 f64, a2 f64) {
	C.IupDrawArc(cavas, rect.x1, rect.y1, rect.x2, rect.y2, a1, a2)
}

pub fn (cavas &IHandle) draw_polygon(points []int) {
	C.IupDrawPolygon(cavas, points.data, points.len)
}

pub fn (cavas &IHandle) draw_text(text string, x int, y int, w int, h int) {
	C.IupDrawText(cavas, text.str, text.len, x, y, w, h)
}

pub fn (cavas &IHandle) draw_image(name string, x int, y int, w int, h int) {
	C.IupDrawImage(cavas, name.str, x, y, w, h)
}

pub fn (cavas &IHandle) draw_select_rect(rect Rect) {
	C.IupDrawSelectRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
}

pub fn (cavas &IHandle) draw_focus_rect(rect Rect) {
	C.IupDrawFocusRect(cavas, rect.x1, rect.y1, rect.x2, rect.y2)
}

pub fn (cavas &IHandle) draw_get_size() (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetSize(cavas, &w, &h)
	return w, h
}

pub fn (cavas &IHandle) draw_get_text_size(text string) (int, int) {
	mut w := int(0)
	mut h := int(0)
	C.IupDrawGetTextSize(cavas, text.str, text.len, &w, &h)
	return w, h
}

pub fn draw_get_image_info(name string) (int, int, int) {
	mut w := int(0)
	mut h := int(0)
	mut bpp := int(0)
	C.IupDrawGetImageInfo(name.str, &w, &h, &bpp)
	return w, h, bpp
}
