module viup

fn C.IupAnimatedLabel(voidptr) voidptr

fn C.IupButton(charptr) voidptr

fn C.IupCalendar() voidptr

fn C.IupCanvas(charptr) voidptr

fn C.IupColorBrowser() voidptr

fn C.IupDatePick() voidptr

fn C.IupDropButton(voidptr) voidptr

fn C.IupFlatButton(charptr) voidptr

fn C.IupFlatTree() voidptr

fn C.IupFlatToggle(charptr) voidptr

fn C.IupFlatVal(charptr) voidptr

fn C.IupItem(charptr, charptr) voidptr

fn C.IupLabel(charptr) voidptr

fn C.IupLink(charptr, charptr) voidptr

fn C.IupList(charptr) voidptr

fn C.IupMultiLine(charptr) voidptr

fn C.IupProgressBar() voidptr

fn C.IupSeparator() voidptr

fn C.IupSpin() voidptr

fn C.IupSpinbox(voidptr) voidptr

fn C.IupSubmenu(charptr, voidptr) voidptr

fn C.IupText(charptr) voidptr

fn C.IupToggle(charptr, charptr) voidptr

fn C.IupTree() voidptr

fn C.IupVal(charptr) voidptr

// animated_label creates an control that can display an animation
pub fn animated_label(animation &Control, attrs ...string) &Control {
	animated_label := &Control(C.IupAnimatedLabel(animation))
	animated_label.set_attrs(attrs)
	return animated_label
}

// button creates a standard button control with `title` for text
pub fn button(title string, attrs ...string) &Control {
	button := &Control(C.IupButton(title.str, 0))
	button.set_attrs(attrs)
	return button
}

pub fn calendar(attrs ...string) &Control {
	calendar := &Control(C.IupCalendar())
	calendar.set_attrs(attrs)
	return calendar
}

// canvas creates a control that can render custom content
pub fn canvas(attrs ...string) &Control {
	canvas := &Control(C.IupCanvas(0))
	canvas.set_attrs(attrs)
	return canvas
}

pub fn color_browser(attrs ...string) &Control {
	color_browser := &Control(C.IupColorBrowser())
	color_browser.set_attrs(attrs)
	return color_browser
}

pub fn date_picker(attrs ...string) &Control {
	date_picker := &Control(C.IupDatePick())
	date_picker.set_attrs(attrs)
	return date_picker
}

// divider creates a simple line divider element (horizontal by default)
pub fn divider(attrs ...string) &Control {
	divider := &Control(C.IupFlatSeparator())
	divider.set_attr("orientation", "horizontal")
	divider.set_attrs(attrs)
	return divider
}

pub fn drop_button(child &Control, attrs ...string) &Control {
	drop_button := &Control(C.IupDropButton(child))
	drop_button.set_attrs(attrs)
	return drop_button
}

pub fn flat_button(title string, attrs ...string) &Control {
	flat_button := &Control(C.IupFlatButton(title.str))
	flat_button.set_attrs(attrs)
	return flat_button
}

pub fn flat_toggle(title string, attrs ...string) &Control {
	flat_toggle := &Control(C.IupFlatToggle(title.str))
	flat_toggle.set_attrs(attrs)
	return flat_toggle
}

pub fn flat_slider(orientation string, attrs ...string) &Control {
	flat_slider := &Control(C.IupFlatVal(orientation.str))
	flat_slider.set_attrs(attrs)
	return flat_slider
}

pub fn flat_tree(attrs ...string) &Control {
	flat_tree := &Control(C.IupFlatTree())
	flat_tree.set_attrs(attrs)
	return flat_tree
}

// label is used to draw simple text or images
pub fn label(title string, attrs ...string) &Control {
	label := &Control(C.IupLabel(title.str))
	label.set_attrs(attrs)
	return label
}

// link creates a control similar to a `label` that can
// link to external resources (files, URL, etc)
pub fn link(url string, title string, attrs ...string) &Control {
	label := &Control(C.IupLink(url.str, title.str))
	label.set_attrs(attrs)
	return label
}

// list creates a component that can list multiple values
pub fn list(attrs ...string) &Control {
	list := &Control(C.IupList(0))
	list.set_attrs(attrs)
	return list
}

// menu_item is a component that can be used in a `menu` to
// that is tied to a specific action or event
pub fn menu_item(title string, attrs ...string) &Control {
	menu_item := &Control(C.IupItem(title.str, 0))
	menu_item.set_attrs(attrs)
	return menu_item
}

// menu_sep creates a simple horizontal line in a `menu`
pub fn menu_sep(attrs ...string) &Control {
	menu_sep := &Control(C.IupSeparator())
	menu_sep.set_attrs(attrs)
	return menu_sep
}

// multiline creates a multiline chooser component
pub fn multiline(attrs ...string) &Control {
	multiline := &Control(C.IupMultiLine(0))
	multiline.set_attrs(attrs)
	return multiline
}

// progress is a basic progressbar component
pub fn progress(attrs ...string) &Control {
	progress := &Control(C.IupProgressBar())
	progress.set_attrs(attrs)
	return progress
}

// slider is a number-line slider component
pub fn slider(orientation string, attrs ...string) &Control {
	slider := &Control(C.IupVal(orientation.str))
	slider.set_attrs(attrs)
	return slider
}

pub fn spin(attrs ...string) &Control {
	spin := &Control(C.IupSpin())
	spin.set_attrs(attrs)
	return spin
}

pub fn spin_box(child &Control, attrs ...string) &Control {
	spin_box := &Control(C.IupSpinbox(child))
	spin_box.set_attrs(attrs)
	return spin_box
}

// sub_menu is a container control for `menu` controls
pub fn sub_menu(title string, child &Control, attrs ...string) &Control {
	sub_menu := &Control(C.IupSubmenu(title.str, child))
	sub_menu.set_attrs(attrs)
	return sub_menu
}

// text is a standard text input component. Can be configured to
// to be multi-line, number formatted, etc.
pub fn text(attrs ...string) &Control {
	text := &Control(C.IupText(0))
	text.set_attrs(attrs)
	return text
}

pub fn tree(attrs ...string) &Control {
	tree := &Control(C.IupTree())
	tree.set_attrs(attrs)
	return tree
}

// toggle is a radio or checkbox component. Defaults to radio in a `radio_group`
pub fn toggle(title string, attrs ...string) &Control {
	toggle := &Control(C.IupToggle(title.str, 0))
	toggle.set_attrs(attrs)
	return toggle
}