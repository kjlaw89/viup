module viup

fn C.IupGetAttribute(voidptr, charptr) charptr

fn C.IupSetAttribute(voidptr, charptr, charptr)

fn C.IupSetStrAttribute(voidptr, charptr, charptr)

pub fn (control &Control) get_attr(name string) string {
	return tos3(C.IupGetAttribute(control, name.str))
}

pub fn (control &Control) set_attr(name string, value string) {
	C.IupSetStrAttribute(control, name.to_upper().trim_space().str, value.trim_space().str)
}

// set_attrs takes all x=x values and applies them to them control
pub fn (control &Control) set_attrs(attrs ...string) {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		control.set_attr(split[0], split[1])
	}
}

pub fn (control &Control) set_data(name string, data voidptr) {
	C.IupSetAttribute(control, '${name}_data'.to_upper().trim_space().str, charptr(data))
}

pub fn (control &Control) get_data(name string) voidptr {
	return C.IupGetAttribute(control, '${name}_data'.to_upper().trim_space().str)
}
