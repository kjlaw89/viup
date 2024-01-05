module im

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liupim -liupimglib
#include "iup.h"
#include "iupim.h"

// `Image` inherits from `Ihandle`
@[heap]
pub struct Image {
	Ihandle
}

fn C.IupImOpen()
fn C.IupGetImageNativeHandle(voidptr) voidptr
fn C.IupImage(int, int, byteptr) &Image
fn C.IupImageFromImImage(voidptr) &Image
fn C.IupImageRGB(int, int, byteptr) &Image
fn C.IupImageRGBA(int, int, byteptr) &Image
fn C.IupLoadAnimation(charptr) &Image
fn C.IupLoadAnimationFrames(voidptr, int) &Image
fn C.IupLoadImage(charptr) &Image
fn C.IupSaveImage(&Image, charptr, charptr) int

// im_open must be called after `open`
fn init() {
	init_iup()
	C.IupImOpen()
}

fn cleanup() {
	cleanup_iup()
}

// load_image load a image from `path`, BMP, JPEG, GIF, TIFF, PNG, PNM, PCX, ICO and others
pub fn load_image(path string, attrs ...string) !&Image {
	println(path)
	ptr := C.IupLoadImage(path.str)

	if isnil(ptr) {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// save_image save current image to `filename`, BMP, JPEG, GIF, TIFF, PNG, PNM, PCX, ICO and others
pub fn (img &Image) save_image(filename string, format string) int {
	return C.IupSaveImage(img, filename.str, format.str)
}

// load_animation loading of multiple images from the `path` for the following formats: GIF, TIFF, AVI (additional library) and WMV  (additional library)
pub fn load_animation(path string, attrs ...string) !&Image {
	ptr := C.IupLoadAnimation(path.str)

	if isnil(ptr) {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load image ${path}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// load_animation_frames load multiple frames from `paths`
pub fn load_animation_frames(paths []string, attrs ...string) !&Image {
	mut flists := []&char{}
	for i in 0 .. paths.len {
		flists << &char(paths[i].str)
	}
	flists << &char(0)
	mut fnums := paths.len

	ptr := C.IupLoadAnimationFrames(flists.data, fnums)

	if isnil(ptr) {
		err := viup.get_global_value('IUPIM_LASSERROR')
		return error('Unable to load animation frames ${paths}: ${err}')
	}

	ptr.set_attrs(...attrs)
	return ptr
}

// new_grayscale creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_grayscale(width int, height int, pixels []byte, attrs ...string) &Image {
	new_grayscale := C.IupImage(width, height, pixels.data)
	new_grayscale.set_attrs(...attrs)
	return new_grayscale
}

// new_rgb creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_rgb(width int, height int, pixels []byte, attrs ...string) &Image {
	new_rgb := C.IupImageRGB(width, height, pixels.data)
	new_rgb.set_attrs(...attrs)
	return new_rgb
}

// new_rgba creates an image to be shown on a label, button, toggle, or as a cursor
pub fn new_rgba(width int, height int, pixels []byte, attrs ...string) &Image {
	new_rgba := C.IupImageRGBA(width, height, pixels.data)
	new_rgba.set_attrs(...attrs)
	return new_rgba
}

// set_handle is a helper function for `Image` that calls the global
// `set_handle` function. Returns back an instance of `Image` for chaining
pub fn (image &Image) set_handle(name string) &Image {
	C.IupSetHandle(name.str, &Ihandle(image))
	return image
}

// get_image_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_image_handle(handle string) &Image {
	return &Image(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Image` and
// returns `Image` back for chaining
pub fn (image &Image) set_attr(name string, value string) &Image {
	C.IupSetStrAttribute(&Ihandle(image), name.to_upper().trim_space().str, value.trim_space().str)

	return image
}

// set_attrs takes all x=x values and applies them to `Image` and
// returns `Image` back for chaining
pub fn (image &Image) set_attrs(attrs ...string) &Image {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		image.set_attr(split[0], split[1])
	}

	return image
}

// set_data associates the provided `data` with `Image` and
// returns `Image` back for chaining
pub fn (image &Image) set_data(name string, data voidptr) &Image {
	C.IupSetAttribute(&Ihandle(image), '${name}_data'.to_upper().trim_space().str, charptr(data))

	return image
}

// unset_attr clears the provided attribute
pub fn (image &Image) unset_attr(name string) &Image {
	C.IupSetAttribute(&Ihandle(image), name.to_upper().trim_space().str, C.NULL)
	return image
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
