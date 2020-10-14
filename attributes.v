module viup

fn C.IupGetAttribute(voidptr, charptr) charptr
fn C.IupSetAttribute(voidptr, charptr, charptr)

// apply_attrs takes all x=x values and applies them to them control
fn (control Control) apply_attrs(attrs ...string) {

	for attr in attrs {
		split := attr.split_nth("=", 2)

		if split.len == 1 {
			continue
		}

		control.set_attr(split[0], split[1])
	}
}

pub fn (control Control) get_attr(name string) string {
	return tos3(C.IupGetAttribute(control.ptr, name.str))
}

pub fn (control Control) set_attr(name, value string) {
	C.IupSetAttribute(control.ptr, name.to_upper().trim_space().str, value.trim_space().str)
}

