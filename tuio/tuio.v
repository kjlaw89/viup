module tuio

import viup

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liuptuio
#include "iup.h"
#include "iuptuio.h"

fn C.IupTuioOpen() int
fn C.IupTuioClient(int) &viup.Ihandle

// tuio_open must be called after a `open`
fn init() {
	C.IupTuioOpen()
}

// tuio_client implements an interface to the TUIO protocol client that allows the use of multi-touch devices. It can use any TUIO server, but it was tested with the Community Core Vision (CCV) from the NUI Group
// `port` is the UDP port used to connect to the TUIO server. If 0 is specified then the default value of 3333 will be used
pub fn tuio_client(port int, attrs ...string) &viup.Ihandle {
	tuio_client := C.IupTuioClient(port)
	tuio_client.set_attrs(...attrs)
	return tuio_client
}