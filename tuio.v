module viup

fn C.IupTuioOpen() int
fn C.IupTuioClient(int) &IHandle

pub fn tuio_open() int {
	return C.IupTuioOpen()
}

pub fn tuio_client(port int) &IHandle {
	return C.IupTuioClient(port)
}
