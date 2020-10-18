module viup

fn C.IupGetAttribute(voidptr, charptr) charptr

fn C.IupSetAttribute(voidptr, charptr, charptr)

fn C.IupSetStrAttribute(voidptr, charptr, charptr)

pub fn (control &Control) get_attr(name string) string {
	return tos3(C.IupGetAttribute(control, name.str))
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
