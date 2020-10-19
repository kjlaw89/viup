module viup

fn C.IupBackgroundBox(voidptr) voidptr

fn C.IupCboxv(voidptr) voidptr

fn C.IupDetachBox(voidptr) voidptr

fn C.IupExpander(voidptr) voidptr

fn C.IupFill() voidptr

fn C.IupFlatFrame(voidptr) voidptr

fn C.IupFlatSeparator() voidptr

fn C.IupFlatScrollBox(voidptr) voidptr

fn C.IupFlatTabsv(voidptr) voidptr

fn C.IupFrame(voidptr) voidptr

fn C.IupGridBoxv(voidptr) voidptr

fn C.IupHboxv(voidptr) voidptr

fn C.IupMenuv(voidptr) voidptr

fn C.IupMultiBoxv(voidptr) voidptr

fn C.IupNormalizerv(voidptr) voidptr

fn C.IupRadio(voidptr) voidptr

fn C.IupSbox(voidptr) voidptr

fn C.IupScrollBox(voidptr) voidptr

fn C.IupSpace() voidptr

fn C.IupTabsv(voidptr) voidptr

fn C.IupVboxv(voidptr) voidptr

fn C.IupZboxv(voidptr) voidptr

pub fn background(child &Control, attrs ...string) &Control {
	background := &Control(C.IupBackgroundBox(child))
	background.set_attr('title', '')
	background.set_attrs(attrs)
	return background
}

pub fn cbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	cbox := &Control(C.IupCboxv(ptrs.data))
	cbox.set_attrs(attrs)
	return cbox
}

pub fn detach_box(child &Control, attrs ...string) &Control {
	detach_box := &Control(C.IupDetachBox(child))
	detach_box.set_attrs(attrs)
	return detach_box
}

pub fn expander(child &Control, attrs ...string) &Control {
	expander := &Control(C.IupExpander(child))
	expander.set_attrs(attrs)
	return expander
}

pub fn fill(attrs ...string) &Control {
	fill := &Control(C.IupFill())
	fill.set_attrs(attrs)
	return fill
}

pub fn flat_frame(child &Control, attrs ...string) &Control {
	flat_frame := &Control(C.IupFlatFrame(child))
	flat_frame.set_attr('title', '')
	flat_frame.set_attrs(attrs)
	return flat_frame
}

pub fn flat_scroll(child &Control, attrs ...string) &Control {
	flat_scroll := &Control(C.IupFlatScrollBox(child))
	flat_scroll.set_attrs(attrs)
	return flat_scroll
}

pub fn flat_tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	flat_tabs := &Control(C.IupFlatTabsv(ptrs.data))
	flat_tabs.set_attrs(attrs)
	return flat_tabs
}

pub fn frame(child &Control, attrs ...string) &Control {
	frame := &Control(C.IupFrame(child))
	frame.set_attr('title', '')
	frame.set_attrs(attrs)
	return frame
}

pub fn grid(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	grid := &Control(C.IupGridBoxv(ptrs.data))
	grid.set_attrs(attrs)
	return grid
}

pub fn hbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	hbox := &Control(C.IupHboxv(ptrs.data))
	hbox.set_attrs(attrs)
	return hbox
}

pub fn menu(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	menu := &Control(C.IupMenuv(ptrs.data))
	menu.set_attrs(attrs)
	return menu
}

pub fn multi_box(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	multi_box := &Control(C.IupMultiBoxv(ptrs.data))
	multi_box.set_attrs(attrs)
	return multi_box
}

pub fn normalizer(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	normalizer := &Control(C.IupNormalizerv(ptrs.data))
	normalizer.set_attrs(attrs)
	return normalizer
}

pub fn radio_group(child &Control, attrs ...string) &Control {
	radio_group := &Control(C.IupRadio(child))
	radio_group.set_attrs(attrs)
	return radio_group
}

pub fn resizer(child &Control, attrs ...string) &Control {
	resizer := &Control(C.IupSbox(child))
	resizer.set_attrs(attrs)
	return resizer
}

// scroll creates a scroll box that creates a virtual space that
// can hold an unlimited amount of items with scrolling.
pub fn scroll(child &Control, attrs ...string) &Control {
	scroll := &Control(C.IupScrollBox(child))
	scroll.set_attrs(attrs)
	return scroll
}

pub fn space(attrs ...string) &Control {
	space := &Control(C.IupSpace())
	space.set_attrs(attrs)
	return space
}

pub fn tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	tabs := &Control(C.IupTabsv(ptrs.data))
	tabs.set_attrs(attrs)
	return tabs
}

pub fn vbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	vbox := &Control(C.IupVboxv(ptrs.data))
	vbox.set_attrs(attrs)
	return vbox
}

pub fn zbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value

	zbox := &Control(C.IupZboxv(ptrs.data))
	zbox.set_attrs(attrs)
	return zbox
}
