module viup

#flag -I @VROOT/headers/iup
#flag -L /usr/lib/iup
#flag -liupim
#flag -liupimglib
#include "iup.h"
#include "iupim.h"

fn C.IupImOpen()
fn C.IupGetImageNativeHandle(voidptr) voidptr
fn C.IupImage(int, int, byteptr) &Ihandle
fn C.IupImageFromImImage(voidptr) &Ihandle
fn C.IupImageRGB(int, int, byteptr) &Ihandle
fn C.IupImageRGBA(int, int, byteptr) &Ihandle
fn C.IupLoadAnimation(charptr) &Ihandle
fn C.IupLoadAnimationFrames(voidptr, int) &Ihandle
fn C.IupLoadImage(charptr) &Ihandle
fn C.IupSaveImage(&Ihandle, charptr, charptr) int

// im_open must be called after `open`
pub fn im_open() {
	C.IupImOpen()
}

// load_image load a image from `path`, BMP, JPEG, GIF, TIFF, PNG, PNM, PCX, ICO and others
pub fn load_image(path string, attrs ...string) !&Ihandle {
	println(path)
	ptr := C.IupLoadImage(path.str)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// save_image save current image to `filename`, BMP, JPEG, GIF, TIFF, PNG, PNM, PCX, ICO and others
pub fn (img &Ihandle) save_image(filename string, format string) int {
	return C.IupSaveImage(img, filename.str, format.str)
}

// load_animation loading of multiple images from the `path` for the following formats: GIF, TIFF, AVI (additional library) and WMV  (additional library)
pub fn load_animation(path string, attrs ...string) !&Ihandle {
	ptr := C.IupLoadAnimation(path.str)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// load_animation_frames load multiple frames from `paths`
pub fn load_animation_frames(paths []string, attrs ...string) !&Ihandle {
	mut flists := []&char{}
	for i in 0 .. paths.len {
		flists << &char(paths[i].str)
	}
	flists << &char(0)
	mut fnums := paths.len

	ptr := C.IupLoadAnimationFrames(flists.data, fnums)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load animation frames ${paths}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// new_grayscale creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_grayscale(width int, height int, pixels []byte, attrs ...string) &Ihandle {
	new_grayscale := C.IupImage(width, height, pixels.data)
	new_grayscale.set_attrs(...attrs)
	return new_grayscale
}

// new_rgb creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_rgb(width int, height int, pixels []byte, attrs ...string) &Ihandle {
	new_rgb := C.IupImageRGB(width, height, pixels.data)
	new_rgb.set_attrs(...attrs)
	return new_rgb
}

// new_rgba creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_rgba(width int, height int, pixels []byte, attrs ...string) &Ihandle {
	new_rgba := C.IupImageRGBA(width, height, pixels.data)
	new_rgba.set_attrs(...attrs)
	return new_rgba
}

// Need "im_image.h" from library
//#include "im_image.h"
// pub type NativeImage = voidptr
/*
pub fn get_control(native NativeImage) &Ihandle{
	return C.IupImageFromImImage(native)
}

pub fn get_to_native(control &Ihandle) NativeImage {
	return C.IupGetImageNativeHandle(control)
}
*/
