module viup

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#include "iup.h"

// `Control` inherits from `Ihandle`
[heap]
pub struct Control {
	Ihandle
}

fn C.IupAnimatedLabel(&Control) &Control
fn C.IupButton(charptr, charptr) &Control
fn C.IupCalendar() &Control
fn C.IupCanvas(charptr) &Control
fn C.IupColorbar() &Control
fn C.IupColorBrowser() &Control
fn C.IupDial(charptr) &Control
fn C.IupDatePick() &Control
fn C.IupDropButton(&Control) &Control
fn C.IupFlatButton(charptr) &Control
fn C.IupFlatLabel(charptr) &Control
fn C.IupFlatList() &Control
fn C.IupFlatTree() &Control
fn C.IupFlatToggle(charptr) &Control
fn C.IupFlatVal(charptr) &Control
fn C.IupGauge() &Control
fn C.IupLabel(charptr) &Control
fn C.IupLink(charptr, charptr) &Control
fn C.IupList(charptr) &Control
fn C.IupMultiLine(charptr) &Control
fn C.IupProgressBar() &Control
fn C.IupSpin() &Control
fn C.IupSpinbox(&Control) &Control
fn C.IupText(charptr) &Control
fn C.IupToggle(charptr, charptr) &Control
fn C.IupTree() &Control
fn C.IupVal(charptr) &Control

// animated_label creates an control that can display an `animation`
pub fn animated_label(animation &Control, attrs ...string) &Control {
	animated_label := C.IupAnimatedLabel(animation)
	animated_label.set_attrs(...attrs)
	return animated_label
}

// button creates a standard button control with `title` for text
pub fn button(title string, attrs ...string) &Control {
	button := C.IupButton(title.str, C.NULL)
	button.set_attrs(...attrs)
	return button
}

// calendar creates a month calendar control, where the user can select a date
pub fn calendar(attrs ...string) &Control {
	calendar := C.IupCalendar()
	calendar.set_attrs(...attrs)
	return calendar
}

// canvas creates a control that can render custom content
pub fn canvas(attrs ...string) &Control {
	canvas := C.IupCanvas(0)
	canvas.set_attrs(...attrs)
	return canvas
}

// color_bar creates a color palette to enable a color selection from several samples
pub fn color_bar(attrs ...string) &Control {
	color_bar := C.IupColorbar()
	color_bar.set_attrs(...attrs)
	return color_bar
}

// color_browser creates an element for selecting a color
pub fn color_browser(attrs ...string) &Control {
	color_browser := C.IupColorBrowser()
	color_browser.set_attrs(...attrs)
	return color_browser
}

// date_picker creates a date editing interface element, which can displays a calendar for selecting a date
pub fn date_picker(attrs ...string) &Control {
	date_picker := C.IupDatePick()
	date_picker.set_attrs(...attrs)
	return date_picker
}

// dial creates a dial for regulating a given angular variable
pub fn dial(orientation string, attrs ...string) &Control {
	dial := C.IupDial(orientation.str)
	dial.set_attrs(...attrs)
	return dial
}

// flat_separator creates a simple line divider element (horizontal by default)
pub fn flat_separator(attrs ...string) &Control {
	divider := C.IupFlatSeparator()
	divider.set_attr('orientation', 'horizontal')
	divider.set_attrs(...attrs)
	return divider
}

// drop_button creates a button with a drop down arrow
pub fn drop_button(child &Control, attrs ...string) &Control {
	drop_button := C.IupDropButton(child)
	drop_button.set_attrs(...attrs)
	return drop_button
}

// flat_button creates a button without native decorations
pub fn flat_button(title string, attrs ...string) &Control {
	flat_button := C.IupFlatButton(title.str)
	flat_button.set_attrs(...attrs)
	return flat_button
}

// flat_label creates a label without native decorations
pub fn flat_label(title string, attrs ...string) &Control {
	flat_label := C.IupFlatLabel(title.str)
	flat_label.set_attrs(...attrs)
	return flat_label
}

// flat_list creates an interface element without native decorations, that displays a list of items
pub fn flat_list(attrs ...string) &Control {
	flat_list := C.IupFlatList()
	flat_list.set_attrs(...attrs)
	return flat_list
}

// flat_toggle creates an interface element that is a toggle without native decorations
pub fn flat_toggle(title string, attrs ...string) &Control {
	flat_toggle := C.IupFlatToggle(title.str)
	flat_toggle.set_attrs(...attrs)
	return flat_toggle
}

// flat_slider creates a Valuator control without native decorations
pub fn flat_slider(orientation string, attrs ...string) &Control {
	flat_slider := C.IupFlatVal(orientation.str)
	flat_slider.set_attrs(...attrs)
	return flat_slider
}

// flat_tree creates a tree containing nodes of branches or leaves
pub fn flat_tree(attrs ...string) &Control {
	flat_tree := C.IupFlatTree()
	flat_tree.set_attrs(...attrs)
	return flat_tree
}

// gauge creates a Gauge control, shows a percent value that can be updated to simulate a progression
pub fn gauge(attrs ...string) &Control {
	gauge := C.IupGauge()
	gauge.set_attrs(...attrs)
	return gauge
}

// label is used to draw simple text or images
pub fn label(title string, attrs ...string) &Control {
	label := C.IupLabel(title.str)
	label.set_attrs(...attrs)
	return label
}

// link creates a control similar to a `label` that can
// link to external resources (files, URL, etc)
pub fn link(url string, title string, attrs ...string) &Control {
	label := C.IupLink(url.str, title.str)
	label.set_attrs(...attrs)
	return label
}

// list creates a component that can list multiple values
pub fn list(attrs ...string) &Control {
	list := C.IupList(0)
	list.set_attrs(...attrs)
	return list
}

// multi_line creates a multiline chooser component
pub fn multi_line(attrs ...string) &Control {
	multi_line := C.IupMultiLine(0)
	multi_line.set_attrs(...attrs)
	return multi_line
}

// progress_bar is a basic progressbar component
pub fn progress_bar(attrs ...string) &Control {
	progress_bar := C.IupProgressBar()
	progress_bar.set_attrs(...attrs)
	return progress_bar
}

// slider is a number-line slider component
pub fn slider(orientation string, attrs ...string) &Control {
	slider := C.IupVal(orientation.str)
	slider.set_attrs(...attrs)
	return slider
}

// spin create a control set with a vertical box containing two buttons, one with an up arrow and the other with a down arrow, to be used to increment and decrement values
pub fn spin(attrs ...string) &Control {
	spin := C.IupSpin()
	spin.set_attrs(...attrs)
	return spin
}

// spin_box is an horizontal container that already contains a `spin`
pub fn spin_box(child &Control, attrs ...string) &Control {
	spin_box := C.IupSpinbox(child)
	spin_box.set_attrs(...attrs)
	return spin_box
}

// text is a standard text input component. Can be configured to
// to be multi-line, number formatted, etc.
pub fn text(attrs ...string) &Control {
	text := C.IupText(0)
	text.set_attrs(...attrs)
	return text
}

// tree creates a tree containing nodes of branches or leaves
pub fn tree(attrs ...string) &Control {
	tree := C.IupTree()
	tree.set_attrs(...attrs)
	return tree
}

// toggle is a radio or checkbox component. Defaults to radio in a `radio_group`
pub fn toggle(title string, attrs ...string) &Control {
	toggle := C.IupToggle(title.str, 0)
	toggle.set_attrs(...attrs)
	return toggle
}
