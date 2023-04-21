module image

import viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupim
#flag -liupimglib
#include "iupim.h"

fn C.IupGetImageNativeHandle(voidptr) voidptr

fn C.IupImage(int, int, byteptr) &viup.IHandle

fn C.IupImageFromImImage(voidptr)  &viup.IHandle

fn C.IupImageRGB(int, int, byteptr) &viup.IHandle

fn C.IupImageRGBA(int, int, byteptr) &viup.IHandle

fn C.IupLoadAnimation(charptr) &viup.IHandle

fn C.IupLoadImage(charptr) &viup.IHandle

pub fn load(path string, attrs ...string) !&viup.IHandle{
	println(path)
	ptr := C.IupLoadImage(path.str)

	if isnil(ptr) {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

pub fn load_animation(path string) !&viup.IHandle{
	ptr := C.IupLoadAnimation(path.str)

	if isnil(ptr) {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	return ptr
}

pub fn new_grayscale(width int, height int, pixels []byte) &viup.IHandle{
	return C.IupImage(width, height, pixels.data)
}

pub fn new_rgb(width int, height int, pixels []byte) &viup.IHandle{
	return C.IupImageRGB(width, height, pixels.data)
}

pub fn new_rgba(width int, height int, pixels []byte) &viup.IHandle{
	return C.IupImageRGBA(width, height, pixels.data)
}

// Need "im_image.h" from library
//#include "im_image.h"
// pub type NativeImage = voidptr
/*
pub fn get_control(native NativeImage) &viup.IHandle{
	return C.IupImageFromImImage(native)
}

pub fn get_to_native(control &viup.IHandle) NativeImage {
	return C.IupGetImageNativeHandle(control)
}
*/
