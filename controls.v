module viup

fn C.IupButton(charptr) voidptr
fn C.IupCalendar() voidptr
fn C.IupHboxv(voidptr) voidptr
fn C.IupLabel(charptr) voidptr
fn C.IupVboxv(voidptr) voidptr

pub fn button(title, action string, attrs ...string) &Control {
	button := &Control(C.IupButton(title.str, C.NULL))
	button.apply_attrs(attrs)

	return button
}

pub fn calendar(attrs ...string) &Control {
	calendar := &Control(C.IupCalendar())
	calendar.apply_attrs(attrs)

	return calendar
}

pub fn hbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}

	ptrs << 0 // Add null value

	hbox := &Control(C.IupHboxv(ptrs.data))
	hbox.apply_attrs(attrs)

	return hbox
}

pub fn label(title string, attrs ...string) &Control {
	label := &Control(C.IupLabel(title.str))
	label.apply_attrs(attrs)

	return label
}

pub fn vbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}

	ptrs << 0 // Add null value

	vbox := &Control(C.IupVboxv(ptrs.data))
	vbox.apply_attrs(attrs)

	return vbox
}