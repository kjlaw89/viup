module viup

fn C.IupBackgroundBox(&IHandle) &IHandle

fn C.IupCboxv(&IHandle) &IHandle

fn C.IupDetachBox(&IHandle) &IHandle

fn C.IupExpander(&IHandle) &IHandle

fn C.IupFill() &IHandle

fn C.IupFlatFrame(&IHandle) &IHandle

fn C.IupFlatSeparator() &IHandle

fn C.IupFlatScrollBox(&IHandle) &IHandle

fn C.IupFlatTabsv(&IHandle) &IHandle

fn C.IupFrame(&IHandle) &IHandle

fn C.IupGridBoxv(&IHandle) &IHandle

fn C.IupHboxv(&IHandle) &IHandle

fn C.IupMenuv(&IHandle) &IHandle

fn C.IupMultiBoxv(&IHandle) &IHandle

fn C.IupNormalizerv(&IHandle) &IHandle

fn C.IupRadio(&IHandle) &IHandle

fn C.IupSbox(&IHandle) &IHandle

fn C.IupScrollBox(&IHandle) &IHandle

fn C.IupSpace() &IHandle

fn C.IupTabsv(&IHandle) &IHandle

fn C.IupVboxv(&IHandle) &IHandle

fn C.IupZboxv(&IHandle) &IHandle

// background is a simple container element that is
// designed to have a background color or image
pub fn background(child &IHandle, attrs ...string) &IHandle {
	background := C.IupBackgroundBox(child)
	background.set_attr('title', '')
	background.set_attrs(...attrs)
	return background
}

pub fn cbox(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	cbox := C.IupCboxv(ptrs.data)
	cbox.set_attrs(...attrs)
	return cbox
}

// detach_box is a container that can be detached as a dialog
// and reattached back to the parent dialog when needed
pub fn detach_box(child &IHandle, attrs ...string) &IHandle {
	detach_box := C.IupDetachBox(child)
	detach_box.set_attrs(...attrs)
	return detach_box
}

pub fn expander(child &IHandle, attrs ...string) &IHandle {
	expander := C.IupExpander(child)
	expander.set_attrs(...attrs)
	return expander
}

// fill fills up the remaining space for the parent container
pub fn fill(attrs ...string) &IHandle {
	fill := C.IupFill()
	fill.set_attrs(...attrs)
	return fill
}

// flat_frame is a standard frame that allows custom drawing
pub fn flat_frame(child &IHandle, attrs ...string) &IHandle {
	flat_frame := C.IupFlatFrame(child)
	flat_frame.set_attr('title', '')
	flat_frame.set_attrs(...attrs)
	return flat_frame
}

// flat_scroll is a standard scroll that allow custom drawing
pub fn flat_scroll(child &IHandle, attrs ...string) &IHandle {
	flat_scroll := C.IupFlatScrollBox(child)
	flat_scroll.set_attrs(...attrs)
	return flat_scroll
}

// flat_tabs is a standard tabs container that allows custom drawing
pub fn flat_tabs(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	flat_tabs := C.IupFlatTabsv(ptrs.data)
	flat_tabs.set_attrs(...attrs)
	return flat_tabs
}

// frame puts a border around its children with an optional title
pub fn frame(child &IHandle, attrs ...string) &IHandle {
	frame := C.IupFrame(child)
	frame.set_attr('title', '')
	frame.set_attrs(...attrs)
	return frame
}

// grid is a container that can layout its children in a table-like configuration
pub fn grid(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	grid := C.IupGridBoxv(ptrs.data)
	grid.set_attrs(...attrs)
	return grid
}

// hbox is a container that displays its children in a row
pub fn hbox(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	hbox := C.IupHboxv(ptrs.data)
	hbox.set_attrs(...attrs)
	return hbox
}

// menu is an application container for menu items
pub fn menu(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	menu := C.IupMenuv(ptrs.data)
	menu.set_attrs(...attrs)
	return menu
}

pub fn multi_box(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	multi_box := C.IupMultiBoxv(ptrs.data)
	multi_box.set_attrs(...attrs)
	return multi_box
}

pub fn normalizer(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	normalizer := C.IupNormalizerv(ptrs.data)
	normalizer.set_attrs(...attrs)
	return normalizer
}

// radio_group is designed to wrap around toggle controls to
// turn them into a radio button group
pub fn radio_group(child &IHandle, attrs ...string) &IHandle {
	radio_group := C.IupRadio(child)
	radio_group.set_attrs(...attrs)
	return radio_group
}

pub fn resizer(child &IHandle, attrs ...string) &IHandle {
	resizer := C.IupSbox(child)
	resizer.set_attrs(...attrs)
	return resizer
}

// scroll creates a scroll box that creates a virtual space that
// can hold an unlimited amount of items with scrolling.
pub fn scroll(child &IHandle, attrs ...string) &IHandle {
	scroll := C.IupScrollBox(child)
	scroll.set_attrs(...attrs)
	return scroll
}

pub fn space(attrs ...string) &IHandle {
	space := C.IupSpace()
	space.set_attrs(...attrs)
	return space
}

// tabs creates a tab group that can be switched
// between to view different content
pub fn tabs(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	tabs := C.IupTabsv(ptrs.data)
	tabs.set_attrs(...attrs)
	return tabs
}

// vbox is a container that displays its children in a column
pub fn vbox(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	vbox := C.IupVboxv(ptrs.data)
	vbox.set_attrs(...attrs)
	return vbox
}

pub fn zbox(children []&IHandle, attrs ...string) &IHandle {
	mut ptrs := []&IHandle{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { (&IHandle(nil)) } // Add null value
	zbox := C.IupZboxv(ptrs.data)
	zbox.set_attrs(...attrs)
	return zbox
}
