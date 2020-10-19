module viup

fn C.IupGetAttribute(voidptr, charptr) charptr

fn C.IupGetDouble(voidptr, charptr) f64

fn C.IupGetFloat(voidptr, charptr) f32

fn C.IupGetInt(voidptr, charptr) int

fn C.IupGetIntInt(voidptr, charptr, voidptr, voidptr) int

fn C.IupGetRGB(voidptr, charptr, voidptr, voidptr, voidptr)

fn C.IupGetRGBA(voidptr, charptr, voidptr, voidptr, voidptr, voidptr)

fn C.IupSetAttribute(voidptr, charptr, charptr)

fn C.IupSetStrAttribute(voidptr, charptr, charptr)

pub fn (control &Control) get_attr(name string) string {
	ptr := C.IupGetAttribute(control, name.to_upper().trim_space().str)
	if ptr == 0 {
		return ""
	}

	return tos3(ptr)
}

// get_f32 retrieves a float attribute
pub fn (control &Control) get_f32(name string) f32 {
	return C.IupGetFloat(control, name.to_upper().trim_space().str)
}

// get_f64 retrieves an f64 attribute
pub fn (control &Control) get_f64(name string) f64 {
	return C.IupGetDouble(control, name.to_upper().trim_space().str)
}

// get_int retrieves an int attribute
pub fn (control &Control) get_int(name string) int {
	return C.IupGetInt(control, name.to_upper().trim_space().str)
}

// get_int_int retrieves an attribute that has a divider (x, :, -)
// It returns the amount of values (0, 1, 2) and each value
pub fn (control &Control) get_int_int(name string) (int, int, int) {
	v1 := 0
	v2 := 0
	return C.IupGetIntInt(control, name.to_upper().trim_space().str, &v1, &v2), v1, v2
}

// get_rgb retrieves an attribute and returns it back in r, g, b form
pub fn (control &Control) get_rgb(name string) (byte, byte, byte) {
	r := byte(0)
	g := byte(0)
	b := byte(0)

	C.IupGetRGB(control, name.to_upper().trim_space().str, &r, &g, &b)
	return r, g, b
}

// get_rgba retrieves an attribute and returns it back in r, g, b, a form
pub fn (control &Control) get_rgba(name string) (byte, byte, byte, byte) {
	r := byte(0)
	g := byte(0)
	b := byte(0)
	a := byte(0)

	C.IupGetRGBA(control, name.to_upper().trim_space().str, &r, &g, &b, &a)
	return r, g, b, a
}

// set_attr sets an attribute on `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_attr(name string, value string) &Control {
	C.IupSetStrAttribute(control, name.to_upper().trim_space().str, value.trim_space().str)

	return control
}

// set_attrs takes all x=x values and applies them to `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_attrs(attrs ...string) &Control {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}

		control.set_attr(split[0], split[1])
	}

	return control
}

// set_data associates the provided `data` with `Control` and
// returns `Control` back for chaining
pub fn (control &Control) set_data(name string, data voidptr) &Control {
	C.IupSetAttribute(control, '${name}_data'.to_upper().trim_space().str, charptr(data))
	
	return control
}

pub fn (control &Control) get_data(name string) voidptr {
	return C.IupGetAttribute(control, '${name}_data'.to_upper().trim_space().str)
}
