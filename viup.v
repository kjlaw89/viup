module viup

import os

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup
#flag -liup
//#flag @VOUTPUT/manifest.syso    // `@VOUTPUT` doesn't exist, compilers will compain about this file next existing
#include "iup.h"

// `Ihandle` is a dummy struct here, because we never use its member, only a pointer
[heap]
pub struct Ihandle {
	sig           [4]u8   // IUP Signature, initialized with "IUP", cleared on destroy
	iclass        voidptr // Ihandle Class
	attrib        voidptr // attributes table
	serial        int     // serial number used for controls that need a numeric id, initialized with -1
	handle        voidptr // native handle. initialized when mapped. InativeHandle definition is system dependent.
	expand        int     // expand configuration, a combination of \ref Iexpand, for containers is a combination of the children expand's
	flags         int     // flags configuration, a combination of \ref Iflags
	x             int
	y             int // upper-left corner relative to the native parent. always 0 for the dialog.
	userwidth     int
	userheight    int // user defined size for the control using SIZE or RASTERSIZE
	naturalwidth  int
	naturalheight int // the calculated size based in the control contents and the user size
	currentwidth  int
	currentheight int     // actual size of the control in pixels (window size, including decorations and margins).
	parent        voidptr // previous control in the hierarchy tree
	firstchild    voidptr // first child control in the hierarchy tree
	brother       voidptr // next control inside parent
	data          voidptr // private control data. automatically freed if not NULL in destroy
}

fn C.IupClose()
fn C.IupClipboard() &Ihandle
fn C.IupFlush()
fn C.IupGetGlobal(charptr) voidptr
fn C.IupGetHandle(charptr) &Ihandle
fn C.IupGetAllNames(voidptr, int) int
fn C.IupHelp(charptr) int
fn C.IupIsOpened() int
fn C.IupLog(charptr, charptr)
fn C.IupLoopStep() int
fn C.IupMainLoop() int
fn C.IupOpen(&int, voidptr)
fn C.IupSetGlobal(charptr, charptr)
fn C.IupSetHandle(charptr, &Ihandle)
fn C.IupSetStrGlobal(charptr, charptr)
fn C.IupThread() &Ihandle
fn C.IupTimer() &Ihandle
fn C.IupUser() &Ihandle
fn C.IupDestroy(&Ihandle)

fn init() {
	init_iup()
}

fn cleanup() {
	cleanup_iup()
}

pub fn init_iup() {
	if C.IupIsOpened() == 0 {
		mut cargs := []&char{}
		for i in 0 .. os.args.len {
			cargs << &char(os.args[i].str)
		}
		cargs << &char(0)
		mut argc := os.args.len
		C.IupOpen(&argc, &cargs.data)
	}
}

// cleanup_iup ends the IUP toolkit and releases internal memory. It will also automatically destroy all dialogs and all elements that have names
pub fn cleanup_iup() {
	if C.IupIsOpened() > 0 {
		C.IupClose()
	}
}

// clipboard creates an element that allows access to the clipboard
pub fn clipboard(attrs ...string) &Ihandle {
	clipboard := C.IupClipboard()
	clipboard.set_attrs(...attrs)
	return clipboard
}

// flush processes all pending messages in the message queue
pub fn flush() {
	C.IupFlush()
}

// get_global_reference returns attribute `name` reference from the global environment
pub fn get_global_reference(name string) voidptr {
	return C.IupGetGlobal(name.to_upper().trim_space().str)
}

// get_global_value returns attribute `name` value from the global environment
pub fn get_global_value(name string) string {
	return unsafe { tos_clone(C.IupGetGlobal(name.to_upper().trim_space().str)) }
}

// get_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_handle(handle string) &Ihandle {
	return C.IupGetHandle(handle.str)
}

// help opens a browser to the provided `url`
pub fn help(url string) int {
	return C.IupHelp(url.str)
}

// log writes a message to the system log, `log_type` can be DEBUG, INFO, ERROR and WARNING
pub fn log(log_type string, data string) {
	C.IupLog(log_type.to_upper().str, data.str)
}

// loop_step runs one iteration of the message loop
pub fn loop_step() int {
	return C.IupLoopStep()
}

// main_loop executes the user interaction until a callback returns IUP_CLOSE, IupExitLoop is called, or hiding the last visible dialog
pub fn main_loop() int {
	return C.IupMainLoop()
}

// set_global_reference sets an attribute `name` in the global environment
pub fn set_global_reference(name string, data voidptr) {
	C.IupSetGlobal(name.to_upper().trim_space().str, charptr(data))
}

// set_global_value sets an attribute `name` in the global environment
pub fn set_global_value(name string, data string) {
	C.IupSetStrGlobal(name.to_upper().trim_space().str, data.str)
}

// set_handle adds a component to the global scope based on
// the provided handle name. Note, currently accessing a component
// on the global scope with autofree enabled can cause crashes
pub fn set_handle(handle string, control &Ihandle) &Ihandle {
	C.IupSetHandle(handle.str, control)
	return control
}

// get_all_handle_names returns the names of all interface elements that have an associated name using IupSetHandle or using LED
pub fn get_all_handle_names(max_n int) []string {
	mut cnames := unsafe { []&char{len: max_n + 1, init: nil} }
	ret := C.IupGetAllNames(cnames.data, max_n)

	mut names := []string{}
	for i in 0 .. ret {
		names << unsafe { tos_clone(cnames[i]) }
	}
	return names
}

// thread creates a thread element in IUP, which is not associated to any interface element. It is a very simple support to create and manage threads in a multithread environment
pub fn thread(attrs ...string) &Ihandle {
	thread := C.IupThread()
	thread.set_attrs(...attrs)
	return thread
}

// timer creates a timer which periodically invokes a callback `func` when the time is up
pub fn timer(func IFn, attrs ...string) &Ihandle {
	timer := C.IupTimer()
	timer.set_attrs(...attrs)
	C.IupSetCallback(timer, c'ACTION_CB', func)
	return timer
}

// user creates a user element in IUP, which is not associated to any interface element
pub fn user(attrs ...string) &Ihandle {
	user := C.IupUser()
	user.set_attrs(...attrs)
	return user
}

// destroy destroy current ihandle object
pub fn (object &Ihandle) destroy() {
	C.IupDestroy(object)
}
