module viup

import os

#flag -I @VROOT/headers
#flag -L .
#flag -liup
//#flag @VOUTPUT/manifest.syso    // `@VOUTPUT` doesn't exist, compilers will compain about this file next existing
#include "iup.h"

fn C.IupClose()

fn C.IupFlush()

fn C.IupGetGlobal(charptr) voidptr

fn C.IupGetHandle(charptr) voidptr

fn C.IupHelp(charptr) int

fn C.IupLog(charptr, charptr)

fn C.IupLoopStep() int

fn C.IupMainLoop() int

fn C.IupMessage(charptr, charptr)

fn C.IupOpen(&int, voidptr)

fn C.IupSetGlobal(charptr, charptr)

fn C.IupSetHandle(charptr, voidptr)

fn C.IupSetStrGlobal(charptr, charptr)

fn init() {
	mut cargs := []&char{}
	for i in 0 .. os.args.len {
		cargs << &char(os.args[i].str)
	}
	cargs << &char(0)
	mut argc := os.args.len
	C.IupOpen(&argc, &cargs.data)
}

pub fn close() {
	C.IupClose()
}

pub fn flush() {
	C.IupFlush()
}

pub fn get_global_reference(name string) voidptr {
	return C.IupGetGlobal(name.to_upper().trim_space().str)
}

pub fn get_global_value(name string) string {
	return unsafe { tos3(C.IupGetGlobal(name.to_upper().trim_space().str)) }
}

// get_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_handle(handle string) &Control {
	return C.IupGetHandle(handle.str)
}

// help opens a browser to the provided `url`
pub fn help(url string) int {
	return C.IupHelp(url.str)
}

pub fn log(log_type string, data string) {
	C.IupLog(log_type.to_upper().str, data.str)
}

pub fn loop_step() int {
	return C.IupLoopStep()
}

pub fn main_loop() int {
	return C.IupMainLoop()
}

pub fn message(title string, message string) {
	C.IupMessage(title.str, message.str)
}

pub fn set_global_reference(name string, data voidptr) {
	C.IupSetGlobal(name.to_upper().trim_space().str, charptr(data))
}

pub fn set_global_value(name string, data string) {
	C.IupSetStrGlobal(name.to_upper().trim_space().str, data.str)
}

// set_handle adds a component to the global scope based on
// the provided handle name. Note, currently accessing a component
// on the global scope with autofree enabled can cause crashes
pub fn set_handle(handle string, control &Control) &Control {
	C.IupSetHandle(handle.str, control)
	return control
}
