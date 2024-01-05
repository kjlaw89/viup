module viup

fn C.IupBackgroundBox(&Control) &Control
fn C.IupCboxv(&Control) &Control
fn C.IupDetachBox(&Control) &Control
fn C.IupExpander(&Control) &Control
fn C.IupFill() &Control
fn C.IupFlatFrame(&Control) &Control
fn C.IupFlatSeparator() &Control
fn C.IupFlatScrollBox(&Control) &Control
fn C.IupFlatTabsv(&Control) &Control
fn C.IupFrame(&Control) &Control
fn C.IupGridBoxv(&Control) &Control
fn C.IupHboxv(&Control) &Control
fn C.IupMultiBoxv(&Control) &Control
fn C.IupNormalizerv(&Control) &Control
fn C.IupRadio(&Control) &Control
fn C.IupSbox(&Control) &Control
fn C.IupScrollBox(&Control) &Control
fn C.IupSpace() &Control
fn C.IupSplit(&Control, &Control) &Control
fn C.IupTabsv(&Control) &Control
fn C.IupVboxv(&Control) &Control
fn C.IupZboxv(&Control) &Control

// background_box is a simple container element that is
// designed to have a background color or image
pub fn background_box(child &Control, attrs ...string) &Control {
	background_box := C.IupBackgroundBox(child)
	background_box.set_attr('title', '')
	background_box.set_attrs(...attrs)
	return background_box
}

// cbox creates a container for position elements in absolute coordinates, place `children` in the box
pub fn cbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	cbox := C.IupCboxv(ptrs.data)
	cbox.set_attrs(...attrs)
	return cbox
}

// detach_box is a container that can be detached as a dialog
// and reattached back to the parent dialog when needed
pub fn detach_box(child &Control, attrs ...string) &Control {
	detach_box := C.IupDetachBox(child)
	detach_box.set_attrs(...attrs)
	return detach_box
}

// expander creates a void container that can interactively show or hide its child
pub fn expander(child &Control, attrs ...string) &Control {
	expander := C.IupExpander(child)
	expander.set_attrs(...attrs)
	return expander
}

// fill fills up the remaining space for the parent container
pub fn fill(attrs ...string) &Control {
	fill := C.IupFill()
	fill.set_attrs(...attrs)
	return fill
}

// flat_frame is a standard frame that allows custom drawing
pub fn flat_frame(child &Control, attrs ...string) &Control {
	flat_frame := C.IupFlatFrame(child)
	flat_frame.set_attr('title', '')
	flat_frame.set_attrs(...attrs)
	return flat_frame
}

// flat_scroll_box is a standard scroll that allow custom drawing
pub fn flat_scroll_box(child &Control, attrs ...string) &Control {
	flat_scroll_box := C.IupFlatScrollBox(child)
	flat_scroll_box.set_attrs(...attrs)
	return flat_scroll_box
}

// flat_tabs is a standard tabs container that allows custom drawing
pub fn flat_tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	flat_tabs := C.IupFlatTabsv(ptrs.data)
	flat_tabs.set_attrs(...attrs)
	return flat_tabs
}

// frame puts a border around its children with an optional title
pub fn frame(child &Control, attrs ...string) &Control {
	frame := C.IupFrame(child)
	frame.set_attr('title', '')
	frame.set_attrs(...attrs)
	return frame
}

// grid_box is a container that can layout its children in a table-like configuration
pub fn grid_box(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	grid_box := C.IupGridBoxv(ptrs.data)
	grid_box.set_attrs(...attrs)
	return grid_box
}

// hbox is a container that displays its children in a row
pub fn hbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	hbox := C.IupHboxv(ptrs.data)
	hbox.set_attrs(...attrs)
	return hbox
}

// multi_box creates a container for composing `children` elements in a irregular grid
pub fn multi_box(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	multi_box := C.IupMultiBoxv(ptrs.data)
	multi_box.set_attrs(...attrs)
	return multi_box
}

// normalizer creates a container that does not affect the dialog layout
pub fn normalizer(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	normalizer := C.IupNormalizerv(ptrs.data)
	normalizer.set_attrs(...attrs)
	return normalizer
}

// radio_group is designed to wrap around toggle controls to
// turn them into a radio button group
pub fn radio_group(child &Control, attrs ...string) &Control {
	radio_group := C.IupRadio(child)
	radio_group.set_attrs(...attrs)
	return radio_group
}

// resizer creates a container that allows its `child` to be resized
pub fn resizer(child &Control, attrs ...string) &Control {
	resizer := C.IupSbox(child)
	resizer.set_attrs(...attrs)
	return resizer
}

// scroll creates a scroll box that creates a virtual space that
// can hold an unlimited amount of items with scrolling.
pub fn scroll(child &Control, attrs ...string) &Control {
	scroll := C.IupScrollBox(child)
	scroll.set_attrs(...attrs)
	return scroll
}

// space creates void element, which occupies an empty space
pub fn space(attrs ...string) &Control {
	space := C.IupSpace()
	space.set_attrs(...attrs)
	return space
}

// split creates a container that split its client area in two, `child1` will be at left or top, `child2` will be at right or bottom
pub fn split(child1 &Control, child2 &Control, attrs ...string) &Control {
	split := C.IupSplit(child1, child2)
	split.set_attrs(...attrs)
	return split
}

// tabs creates a tab group that can be switched
// between to view different content
pub fn tabs(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	tabs := C.IupTabsv(ptrs.data)
	tabs.set_attrs(...attrs)
	return tabs
}

// vbox is a container that displays its children in a column
pub fn vbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	vbox := C.IupVboxv(ptrs.data)
	vbox.set_attrs(...attrs)
	return vbox
}

// zbox is a container that displays its one child only, other `children` will be hidden
pub fn zbox(children []&Control, attrs ...string) &Control {
	mut ptrs := []&Control{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Control(nil) } // Add null value
	zbox := C.IupZboxv(ptrs.data)
	zbox.set_attrs(...attrs)
	return zbox
}
