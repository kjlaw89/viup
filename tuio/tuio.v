module tuio

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liuptuio
#include "iup.h"
#include "iuptuio.h"

// `TUIO` inherits from `Ihandle`
[heap]
pub struct TUIO {
	Ihandle
}

fn C.IupTuioOpen() int
fn C.IupTuioClient(int) &TUIO

// tuio_open must be called after a `open`
fn init() {
	init_iup()
	C.IupTuioOpen()
}

fn cleanup() {
	cleanup_iup()
}

// tuio_client implements an interface to the TUIO protocol client that allows the use of multi-touch devices. It can use any TUIO server, but it was tested with the Community Core Vision (CCV) from the NUI Group
// `port` is the UDP port used to connect to the TUIO server. If 0 is specified then the default value of 3333 will be used
pub fn tuio_client(port int, attrs ...string) &TUIO {
	tuio_client := C.IupTuioClient(port)
	tuio_client.set_attrs(...attrs)
	return tuio_client
}

// set_handle is a helper function for `TUIO` that calls the global
// `set_handle` function. Returns back an instance of `TUIO` for chaining
pub fn (tuio_client &TUIO) set_handle(name string) &TUIO {
	C.IupSetHandle(name.str, &Ihandle(tuio_client))
	return tuio_client
}

// get_tuio_client_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_tuio_client_handle(handle string) &TUIO {
	return &TUIO(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `TUIO` and
// returns `TUIO` back for chaining
pub fn (tuio_client &TUIO) set_attr(name string, value string) &TUIO {
	C.IupSetStrAttribute(&Ihandle(tuio_client), name.to_upper().trim_space().str, value.trim_space().str)

	return tuio_client
}

// set_attrs takes all x=x values and applies them to `TUIO` and
// returns `TUIO` back for chaining
pub fn (tuio_client &TUIO) set_attrs(attrs ...string) &TUIO {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		tuio_client.set_attr(split[0], split[1])
	}

	return tuio_client
}

// set_data associates the provided `data` with `TUIO` and
// returns `TUIO` back for chaining
pub fn (tuio_client &TUIO) set_data(name string, data voidptr) &TUIO {
	C.IupSetAttribute(&Ihandle(tuio_client), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return tuio_client
}

// unset_attr clears the provided attribute
pub fn (tuio_client &TUIO) unset_attr(name string) &TUIO {
	C.IupSetAttribute(&Ihandle(tuio_client), name.to_upper().trim_space().str, C.NULL)
	return tuio_client
}
