module viup

#flag -I @VROOT/headers
#flag -L .
#flag -liupcontrols
#include "iup.h"

fn C.IupControlsOpen() int
fn C.IupAnimatedLabel(&Ihandle) &Ihandle
fn C.IupButton(charptr, charptr) &Ihandle
fn C.IupCalendar() &Ihandle
fn C.IupCanvas(charptr) &Ihandle
fn C.IupColorbar() &Ihandle
fn C.IupColorBrowser() &Ihandle
fn C.IupDial(charptr) &Ihandle
fn C.IupDatePick() &Ihandle
fn C.IupDropButton(&Ihandle) &Ihandle
fn C.IupFlatButton(charptr) &Ihandle
fn C.IupFlatLabel(charptr) &Ihandle
fn C.IupFlatList() &Ihandle
fn C.IupFlatTree() &Ihandle
fn C.IupFlatToggle(charptr) &Ihandle
fn C.IupFlatVal(charptr) &Ihandle
fn C.IupGauge() &Ihandle
fn C.IupItem(charptr, charptr) &Ihandle
fn C.IupLabel(charptr) &Ihandle
fn C.IupLink(charptr, charptr) &Ihandle
fn C.IupList(charptr) &Ihandle
fn C.IupMultiLine(charptr) &Ihandle
fn C.IupProgressBar() &Ihandle
fn C.IupSeparator() &Ihandle
fn C.IupSpin() &Ihandle
fn C.IupSpinbox(&Ihandle) &Ihandle
fn C.IupSubmenu(charptr, &Ihandle) &Ihandle
fn C.IupText(charptr) &Ihandle
fn C.IupToggle(charptr, charptr) &Ihandle
fn C.IupTree() &Ihandle
fn C.IupVal(charptr) &Ihandle
fn C.IupCells() &Ihandle
fn C.IupMatrix(charptr) &Ihandle
fn C.IupMatrixList() &Ihandle
fn C.IupMatrixEx() &Ihandle

// fn C.IupMatrixSetFormula(&Ihandle, int, charptr, charptr)
// fn C.IupMatrixSetDynamic(&Ihandle, charptr)

// controls_open must be called after `open`
pub fn controls_open() int {
	return C.IupControlsOpen()
}

// animated_label creates an control that can display an `animation`
pub fn animated_label(animation &Ihandle, attrs ...string) &Ihandle {
	animated_label := C.IupAnimatedLabel(animation)
	animated_label.set_attrs(...attrs)
	return animated_label
}

// button creates a standard button control with `title` for text
pub fn button(title string, attrs ...string) &Ihandle {
	button := C.IupButton(title.str, C.NULL)
	button.set_attrs(...attrs)
	return button
}

// calendar creates a month calendar control, where the user can select a date
pub fn calendar(attrs ...string) &Ihandle {
	calendar := C.IupCalendar()
	calendar.set_attrs(...attrs)
	return calendar
}

// canvas creates a control that can render custom content
pub fn canvas(attrs ...string) &Ihandle {
	canvas := C.IupCanvas(0)
	canvas.set_attrs(...attrs)
	return canvas
}

// color_bar creates a color palette to enable a color selection from several samples
pub fn color_bar(attrs ...string) &Ihandle {
	color_bar := C.IupColorbar()
	color_bar.set_attrs(...attrs)
	return color_bar
}

// color_browser creates an element for selecting a color
pub fn color_browser(attrs ...string) &Ihandle {
	color_browser := C.IupColorBrowser()
	color_browser.set_attrs(...attrs)
	return color_browser
}

// date_picker creates a date editing interface element, which can displays a calendar for selecting a date
pub fn date_picker(attrs ...string) &Ihandle {
	date_picker := C.IupDatePick()
	date_picker.set_attrs(...attrs)
	return date_picker
}

// flat_separator creates a simple line divider element (horizontal by default)
pub fn flat_separator(attrs ...string) &Ihandle {
	divider := C.IupFlatSeparator()
	divider.set_attr('orientation', 'horizontal')
	divider.set_attrs(...attrs)
	return divider
}

// drop_button creates a button with a drop down arrow
pub fn drop_button(child &Ihandle, attrs ...string) &Ihandle {
	drop_button := C.IupDropButton(child)
	drop_button.set_attrs(...attrs)
	return drop_button
}

// flat_button creates a button without native decorations
pub fn flat_button(title string, attrs ...string) &Ihandle {
	flat_button := C.IupFlatButton(title.str)
	flat_button.set_attrs(...attrs)
	return flat_button
}

// flat_label creates a label without native decorations
pub fn flat_label(title string, attrs ...string) &Ihandle {
	flat_label := C.IupFlatLabel(title.str)
	flat_label.set_attrs(...attrs)
	return flat_label
}

// flat_list creates an interface element without native decorations, that displays a list of items
pub fn flat_list(attrs ...string) &Ihandle {
	flat_list := C.IupFlatList()
	flat_list.set_attrs(...attrs)
	return flat_list
}

// flat_toggle creates an interface element that is a toggle without native decorations
pub fn flat_toggle(title string, attrs ...string) &Ihandle {
	flat_toggle := C.IupFlatToggle(title.str)
	flat_toggle.set_attrs(...attrs)
	return flat_toggle
}

// flat_slider creates a Valuator control without native decorations
pub fn flat_slider(orientation string, attrs ...string) &Ihandle {
	flat_slider := C.IupFlatVal(orientation.str)
	flat_slider.set_attrs(...attrs)
	return flat_slider
}

// flat_tree creates a tree containing nodes of branches or leaves
pub fn flat_tree(attrs ...string) &Ihandle {
	flat_tree := C.IupFlatTree()
	flat_tree.set_attrs(...attrs)
	return flat_tree
}

// gauge creates a Gauge control, shows a percent value that can be updated to simulate a progression
pub fn gauge(attrs ...string) &Ihandle {
	gauge := C.IupGauge()
	gauge.set_attrs(...attrs)
	return gauge
}

// label is used to draw simple text or images
pub fn label(title string, attrs ...string) &Ihandle {
	label := C.IupLabel(title.str)
	label.set_attrs(...attrs)
	return label
}

// link creates a control similar to a `label` that can
// link to external resources (files, URL, etc)
pub fn link(url string, title string, attrs ...string) &Ihandle {
	label := C.IupLink(url.str, title.str)
	label.set_attrs(...attrs)
	return label
}

// list creates a component that can list multiple values
pub fn list(attrs ...string) &Ihandle {
	list := C.IupList(0)
	list.set_attrs(...attrs)
	return list
}

// item is a component that can be used in a `menu` to
// that is tied to a specific action or event
pub fn item(title string, attrs ...string) &Ihandle {
	menu_item := C.IupItem(title.str, 0)
	menu_item.set_attrs(...attrs)
	return menu_item
}

// separator creates a simple horizontal line in a `menu`
pub fn separator(attrs ...string) &Ihandle {
	menu_sep := C.IupSeparator()
	menu_sep.set_attrs(...attrs)
	return menu_sep
}

// multi_line creates a multiline chooser component
pub fn multi_line(attrs ...string) &Ihandle {
	multi_line := C.IupMultiLine(0)
	multi_line.set_attrs(...attrs)
	return multi_line
}

// progress_bar is a basic progressbar component
pub fn progress_bar(attrs ...string) &Ihandle {
	progress_bar := C.IupProgressBar()
	progress_bar.set_attrs(...attrs)
	return progress_bar
}

// slider is a number-line slider component
pub fn slider(orientation string, attrs ...string) &Ihandle {
	slider := C.IupVal(orientation.str)
	slider.set_attrs(...attrs)
	return slider
}

// spin create a control set with a vertical box containing two buttons, one with an up arrow and the other with a down arrow, to be used to increment and decrement values
pub fn spin(attrs ...string) &Ihandle {
	spin := C.IupSpin()
	spin.set_attrs(...attrs)
	return spin
}

// spin_box is an horizontal container that already contains a `spin`
pub fn spin_box(child &Ihandle, attrs ...string) &Ihandle {
	spin_box := C.IupSpinbox(child)
	spin_box.set_attrs(...attrs)
	return spin_box
}

// sub_menu is a container control for `menu` controls
pub fn sub_menu(title string, child &Ihandle, attrs ...string) &Ihandle {
	sub_menu := C.IupSubmenu(title.str, child)
	sub_menu.set_attrs(...attrs)
	return sub_menu
}

// text is a standard text input component. Can be configured to
// to be multi-line, number formatted, etc.
pub fn text(attrs ...string) &Ihandle {
	text := C.IupText(0)
	text.set_attrs(...attrs)
	return text
}

// tree creates a tree containing nodes of branches or leaves
pub fn tree(attrs ...string) &Ihandle {
	tree := C.IupTree()
	tree.set_attrs(...attrs)
	return tree
}

// toggle is a radio or checkbox component. Defaults to radio in a `radio_group`
pub fn toggle(title string, attrs ...string) &Ihandle {
	toggle := C.IupToggle(title.str, 0)
	toggle.set_attrs(...attrs)
	return toggle
}

// cells creates a grid widget (set of cells) that enables several application-specific drawing, such as: chess tables, tiles editors, degrade scales, drawable spreadsheets and so forth
pub fn cells(attrs ...string) &Ihandle {
	cells := C.IupCells()
	cells.set_attrs(...attrs)
	return cells
}

// matrix creates a matrix of alphanumeric fields, all values of the matrix fields are strings
pub fn matrix(action string, attrs ...string) &Ihandle {
	matrix := C.IupMatrix(action.str)
	matrix.set_attrs(...attrs)
	return matrix
}

// matrix_list creates an interface element that displays a list of items
pub fn matrix_list(attrs ...string) &Ihandle {
	matrix_list := C.IupMatrixList()
	matrix_list.set_attrs(...attrs)
	return matrix_list
}

// matrix_ex an extension contrl for `matrix`, adds support for Import/Export, Clipboard, Undo/Redo, Find, Sort, Column Visibility, Numeric Columns, Numeric Units, Context Menu and others
pub fn matrix_ex(attrs ...string) &Ihandle {
	matrix_ex := C.IupMatrixEx()
	matrix_ex.set_attrs(...attrs)
	return matrix_ex
}

/*
pub fn (matrix &Ihandle) matrix_set_formula(col int, formula string, init string) &Ihandle {
	C.IupMatrixSetFormula(matrix, col, formula.str, init.str)
	return unsafe {matrix}
}

pub fn (matrix &Ihandle) matrix_set_dynamic(init string) &Ihandle {
	C.IupMatrixSetDynamic(matrix, init.str)
	return unsafe {matrix}
}
*/
