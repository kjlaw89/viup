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

// background is a simple container element that is
// designed to have a background color or image
pub fn background(child &Control, attrs ...string) &Control {
	background := unsafe { &Control(C.IupBackgroundBox(child)) }
	background.set_attr('title', '')
	background.set_attrs(...attrs)
	return background
}

pub fn cbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	cbox := unsafe { &Control(C.IupCboxv(ptrs.data)) }
	cbox.set_attrs(...attrs)
	return cbox
}

// detach_box is a container that can be detached as a dialog
// and reattached back to the parent dialog when needed
pub fn detach_box(child &Control, attrs ...string) &Control {
	detach_box := unsafe { &Control(C.IupDetachBox(child)) }
	detach_box.set_attrs(...attrs)
	return detach_box
}

pub fn expander(child &Control, attrs ...string) &Control {
	expander := unsafe { &Control(C.IupExpander(child)) }
	expander.set_attrs(...attrs)
	return expander
}

// fill fills up the remaining space for the parent container
pub fn fill(attrs ...string) &Control {
	fill := unsafe { &Control(C.IupFill()) }
	fill.set_attrs(...attrs)
	return fill
}

// flat_frame is a standard frame that allows custom drawing
pub fn flat_frame(child &Control, attrs ...string) &Control {
	flat_frame := unsafe { &Control(C.IupFlatFrame(child)) }
	flat_frame.set_attr('title', '')
	flat_frame.set_attrs(...attrs)
	return flat_frame
}

// flat_scroll is a standard scroll that allow custom drawing
pub fn flat_scroll(child &Control, attrs ...string) &Control {
	flat_scroll := unsafe { &Control(C.IupFlatScrollBox(child)) }
	flat_scroll.set_attrs(...attrs)
	return flat_scroll
}

// flat_tabs is a standard tabs container that allows custom drawing
pub fn flat_tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	flat_tabs := unsafe { &Control(C.IupFlatTabsv(ptrs.data)) }
	flat_tabs.set_attrs(...attrs)
	return flat_tabs
}

// frame puts a border around its children with an optional title
pub fn frame(child &Control, attrs ...string) &Control {
	frame := unsafe { &Control(C.IupFrame(child)) }
	frame.set_attr('title', '')
	frame.set_attrs(...attrs)
	return frame
}

// grid is a container that can layout its children in a table-like configuration
pub fn grid(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	grid := unsafe { &Control(C.IupGridBoxv(ptrs.data)) }
	grid.set_attrs(...attrs)
	return grid
}

// hbox is a container that displays its children in a row
pub fn hbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	hbox := unsafe { &Control(C.IupHboxv(ptrs.data)) }
	hbox.set_attrs(...attrs)
	return hbox
}

// menu is an application container for menu items
pub fn menu(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	menu := unsafe { &Control(C.IupMenuv(ptrs.data)) }
	menu.set_attrs(...attrs)
	return menu
}

pub fn multi_box(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	multi_box := unsafe { &Control(C.IupMultiBoxv(ptrs.data)) }
	multi_box.set_attrs(...attrs)
	return multi_box
}

pub fn normalizer(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	normalizer := unsafe { &Control(C.IupNormalizerv(ptrs.data)) }
	normalizer.set_attrs(...attrs)
	return normalizer
}

// radio_group is designed to wrap around toggle controls to
// turn them into a radio button group
pub fn radio_group(child &Control, attrs ...string) &Control {
	radio_group := unsafe { &Control(C.IupRadio(child)) }
	radio_group.set_attrs(...attrs)
	return radio_group
}

pub fn resizer(child &Control, attrs ...string) &Control {
	resizer := unsafe { &Control(C.IupSbox(child)) }
	resizer.set_attrs(...attrs)
	return resizer
}

// scroll creates a scroll box that creates a virtual space that
// can hold an unlimited amount of items with scrolling.
pub fn scroll(child &Control, attrs ...string) &Control {
	scroll := unsafe { &Control(C.IupScrollBox(child)) }
	scroll.set_attrs(...attrs)
	return scroll
}

pub fn space(attrs ...string) &Control {
	space := unsafe { &Control(C.IupSpace()) }
	space.set_attrs(...attrs)
	return space
}

// tabs creates a tab group that can be switched
// between to view different content
pub fn tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	tabs := unsafe { &Control(C.IupTabsv(ptrs.data)) }
	tabs.set_attrs(...attrs)
	return tabs
}

// vbox is a container that displays its children in a column
pub fn vbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	vbox := unsafe { &Control(C.IupVboxv(ptrs.data)) }
	vbox.set_attrs(...attrs)
	return vbox
}

pub fn zbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []voidptr{}
	for child in children {
		ptrs << child
	}
	ptrs << 0 // Add null value
	zbox := unsafe { &Control(C.IupZboxv(ptrs.data)) }
	zbox.set_attrs(...attrs)
	return zbox
}
