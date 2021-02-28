module image

import viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupim
#flag -liupimglib
#include "iupim.h"

fn C.IupGetImageNativeHandle(voidptr) voidptr

fn C.IupImage(int, int, byteptr) voidptr

fn C.IupImageFromImImage(voidptr) voidptr

fn C.IupImageRGB(int, int, byteptr) voidptr

fn C.IupImageRGBA(int, int, byteptr) voidptr

fn C.IupLoadAnimation(charptr) voidptr

fn C.IupLoadImage(charptr) voidptr

pub fn load(path string, attrs ...string) ?&viup.Control {
	ptr := &viup.Control(C.IupLoadImage(path.str))

	if ptr == 0 {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image $path: $err')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

pub fn load_animation(path string) ?&viup.Control {
	ptr := C.IupLoadAnimation(path.str)

	if ptr == 0 {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image $path: $err')
	}

	return ptr
}

pub fn new_grayscale(width int, height int, pixels []byte) &viup.Control {
	return C.IupImage(width, height, pixels.data)
}

pub fn new_rgb(width int, height int, pixels []byte) &viup.Control {
	return C.IupImageRGB(width, height, pixels.data)
}

pub fn new_rgba(width int, height int, pixels []byte) &viup.Control {
	return C.IupImageRGBA(width, height, pixels.data)
}

// Need "im_image.h" from library
//#include "im_image.h"
// pub type NativeImage = voidptr
/*
pub fn get_control(native NativeImage) &viup.Control {
	return C.IupImageFromImImage(native)
}

pub fn get_to_native(control &viup.Control) NativeImage {
	return C.IupGetImageNativeHandle(control)
}
*/
