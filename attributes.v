module viup

fn C.IupGetAttribute(&Ihandle, charptr) charptr
fn C.IupGetDouble(&Ihandle, charptr) f64
fn C.IupGetFloat(&Ihandle, charptr) f32
fn C.IupGetInt(&Ihandle, charptr) int
fn C.IupGetIntInt(&Ihandle, charptr, voidptr, voidptr) int
fn C.IupGetRGB(&Ihandle, charptr, voidptr, voidptr, voidptr)
fn C.IupGetRGBA(&Ihandle, charptr, voidptr, voidptr, voidptr, voidptr)
fn C.IupSetAttribute(&Ihandle, charptr, charptr)
fn C.IupSetStrAttribute(&Ihandle, charptr, charptr)

// get_attr retrieves a string attribute
pub fn (control &Ihandle) get_attr(name string) string {
	ptr := C.IupGetAttribute(control, name.to_upper().trim_space().str)
	if isnil(ptr) {
		return ''
	}

	return unsafe { tos_clone(ptr) }
}

// get_bool retrieves an bool attribute (technically int > 0)
pub fn (control &Ihandle) get_bool(name string) bool {
	return C.IupGetInt(control, name.to_upper().trim_space().str) > 0
}

// get_data gets some data that has been associated with this control based on `name`
pub fn (control &Ihandle) get_data(name string) voidptr {
	return C.IupGetAttribute(control, '${name}_data'.to_upper().trim_space().str)
}

// get_f32 retrieves a float attribute
pub fn (control &Ihandle) get_f32(name string) f32 {
	return C.IupGetFloat(control, name.to_upper().trim_space().str)
}

// get_f64 retrieves an f64 attribute
pub fn (control &Ihandle) get_f64(name string) f64 {
	return C.IupGetDouble(control, name.to_upper().trim_space().str)
}

// get_int retrieves an int attribute
pub fn (control &Ihandle) get_int(name string) int {
	return C.IupGetInt(control, name.to_upper().trim_space().str)
}

// get_int_int retrieves an attribute that has a divider (x, :, -)
// It returns the amount of values (0, 1, 2) and each value
pub fn (control &Ihandle) get_int_int(name string) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	return C.IupGetIntInt(control, name.to_upper().trim_space().str, &v1, &v2), v1, v2
}

// get_rgb retrieves an attribute and returns it back in r, g, b form
pub fn (control &Ihandle) get_rgb(name string) (byte, byte, byte) {
	r := byte(0)
	g := byte(0)
	b := byte(0)

	C.IupGetRGB(control, name.to_upper().trim_space().str, &r, &g, &b)
	return r, g, b
}

// get_rgba retrieves an attribute and returns it back in r, g, b, a form
pub fn (control &Ihandle) get_rgba(name string) (byte, byte, byte, byte) {
	r := byte(0)
	g := byte(0)
	b := byte(0)
	a := byte(0)

	C.IupGetRGBA(control, name.to_upper().trim_space().str, &r, &g, &b, &a)
	return r, g, b, a
}

// set_attr sets an attribute on `Control` and
// returns `Control` back for chaining
pub fn (control &Ihandle) set_attr(name string, value string) &Ihandle {
	C.IupSetStrAttribute(control, name.to_upper().trim_space().str, value.trim_space().str)

	return unsafe { control }
}

// set_attrs takes all x=x values and applies them to `Control` and
// returns `Control` back for chaining
pub fn (control &Ihandle) set_attrs(attrs ...string) &Ihandle {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}

		control.set_attr(split[0], split[1])
	}

	return unsafe { control }
}

// set_data associates the provided `data` with `Control` and
// returns `Control` back for chaining
pub fn (control &Ihandle) set_data(name string, data voidptr) &Ihandle {
	C.IupSetAttribute(control, '${name}_data'.to_upper().trim_space().str, charptr(data))

	return unsafe { control }
}

// unset_attr clears the provided attribute
pub fn (control &Ihandle) unset_attr(name string) &Ihandle {
	C.IupSetAttribute(control, name.to_upper().trim_space().str, C.NULL)
	return unsafe { control }
}
