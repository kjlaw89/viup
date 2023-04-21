module viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupim
#flag -liupimglib
#include "iupim.h"

fn C.IupImOpen()
fn C.IupGetImageNativeHandle(voidptr) voidptr

fn C.IupImage(int, int, byteptr) &IHandle

fn C.IupImageFromImImage(voidptr) &IHandle

fn C.IupImageRGB(int, int, byteptr) &IHandle

fn C.IupImageRGBA(int, int, byteptr) &IHandle

fn C.IupLoadAnimation(charptr) &IHandle
fn C.IupLoadAnimationFrames(voidptr, int) &IHandle

fn C.IupLoadImage(charptr) &IHandle
fn C.IupSaveImage(&IHandle, charptr, charptr) int

pub fn im_open() {
	C.IupImOpen()
}

pub fn load_image(path string, attrs ...string) !&IHandle {
	println(path)
	ptr := C.IupLoadImage(path.str)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

pub fn (img &IHandle) save_image(filename string, format string) int {
	return C.IupSaveImage(img, filename.str, format.str)
}

pub fn load_animation(path string) !&IHandle {
	ptr := C.IupLoadAnimation(path.str)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	return ptr
}

pub fn load_animation_frames(paths []string) !&IHandle {
	mut flists := []&char{}
	for i in 0 .. paths.len {
		flists << &char(paths[i].str)
	}
	flists << &char(0)
	mut fnums := paths.len

	ptr := C.IupLoadAnimationFrames(flists, fnums)

	if isnil(ptr) {
		err := get_global_value('IUPIM_LASSERROR')
		return error('Unable to load animation frames ${paths}: ${err}')
	}

	return ptr
}

pub fn new_grayscale(width int, height int, pixels []byte) &IHandle {
	return C.IupImage(width, height, pixels.data)
}

pub fn new_rgb(width int, height int, pixels []byte) &IHandle {
	return C.IupImageRGB(width, height, pixels.data)
}

pub fn new_rgba(width int, height int, pixels []byte) &IHandle {
	return C.IupImageRGBA(width, height, pixels.data)
}

// Need "im_image.h" from library
//#include "im_image.h"
// pub type NativeImage = voidptr
/*
pub fn get_control(native NativeImage) &IHandle{
	return C.IupImageFromImImage(native)
}

pub fn get_to_native(control &IHandle) NativeImage {
	return C.IupGetImageNativeHandle(control)
}
*/
