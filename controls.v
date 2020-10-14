module viup

fn C.IupButton(charptr) voidptr
fn C.IupLabel(charptr) voidptr
fn C.IupVboxv(voidptr) voidptr

pub fn button(title, action string, attrs ...string) Control {
	button := Control{ ptr: C.IupButton(title.str, C.NULL), @type: "button" }
	button.apply_attrs(attrs)

	return button
}

pub fn label(title string, attrs ...string) Control {
	label := Control{ ptr: C.IupLabel(title.str), @type: "label" }
	label.apply_attrs(attrs)

	return label
}

pub fn vbox(children []Control, attrs ...string) Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child.ptr
	}

	ptrs << 0 // Add null value

	vbox := Control{ ptr: C.IupVboxv(ptrs.data), @type: "vbox" }
	vbox.apply_attrs(attrs)

	return vbox
}