module viup

fn C.IupAnimatedLabel(&IHandle) &IHandle

fn C.IupButton(charptr, charptr) &IHandle

fn C.IupCalendar() &IHandle

fn C.IupCanvas(charptr) &IHandle

fn C.IupColorbar() &IHandle
fn C.IupColorBrowser() &IHandle
fn C.IupColorDial(charptr) &IHandle
fn C.IupDial(charptr) &IHandle
fn C.IupDatePick() &IHandle

fn C.IupDropButton(&IHandle) &IHandle

fn C.IupFlatButton(charptr) &IHandle

fn C.IupFlatLabel(charptr) &IHandle
fn C.IupFlatList() &IHandle
fn C.IupFlatTree() &IHandle

fn C.IupFlatToggle(charptr) &IHandle

fn C.IupFlatVal(charptr) &IHandle

fn C.IupGauge() &IHandle
fn C.IupItem(charptr, charptr) &IHandle

fn C.IupLabel(charptr) &IHandle

fn C.IupLink(charptr, charptr) &IHandle

fn C.IupList(charptr) &IHandle

fn C.IupMultiLine(charptr) &IHandle

fn C.IupProgressBar() &IHandle

fn C.IupSeparator() &IHandle

fn C.IupSpin() &IHandle

fn C.IupSpinbox(&IHandle) &IHandle

fn C.IupSubmenu(charptr, &IHandle) &IHandle

fn C.IupText(charptr) &IHandle

fn C.IupToggle(charptr, charptr) &IHandle

fn C.IupTree() &IHandle

fn C.IupVal(charptr) &IHandle

// iupcontrols.h
fn C.IupControlsOpen() int
fn C.IupCells() &IHandle
fn C.IupMatrix(charptr) &IHandle
fn C.IupMatrixList() &IHandle
fn C.IupMatrixEx() &IHandle
fn C.IupMatrixSetFormula(&IHandle, int, charptr, charptr)
fn C.IupMatrixSetDynamic(&IHandle, charptr)

// animated_label creates an control that can display an animation
pub fn animated_label(animation &IHandle, attrs ...string) &IHandle {
	animated_label := C.IupAnimatedLabel(animation)
	animated_label.set_attrs(...attrs)
	return animated_label
}

// button creates a standard button control with `title` for text
pub fn button(title string, attrs ...string) &IHandle {
	button := C.IupButton(title.str, C.NULL)
	button.set_attrs(...attrs)
	return button
}

pub fn calendar(attrs ...string) &IHandle {
	calendar := C.IupCalendar()
	calendar.set_attrs(...attrs)
	return calendar
}

// canvas creates a control that can render custom content
pub fn canvas(attrs ...string) &IHandle {
	canvas := C.IupCanvas(0)
	canvas.set_attrs(...attrs)
	return canvas
}

pub fn color_bar(attrs ...string) &IHandle {
	color_bar := C.IupColorbar()
	color_bar.set_attrs(...attrs)
	return color_bar
}

pub fn color_browser(attrs ...string) &IHandle {
	color_browser := C.IupColorBrowser()
	color_browser.set_attrs(...attrs)
	return color_browser
}

pub fn dial(type_ string, attrs ...string) &IHandle {
	dial := C.IupColorDial(type_.str)
	dial.set_attrs(...attrs)
	return dial
}

pub fn date_picker(attrs ...string) &IHandle {
	date_picker := C.IupDatePick()
	date_picker.set_attrs(...attrs)
	return date_picker
}

// divider creates a simple line divider element (horizontal by default)
pub fn divider(attrs ...string) &IHandle {
	divider := C.IupFlatSeparator()
	divider.set_attr('orientation', 'horizontal')
	divider.set_attrs(...attrs)
	return divider
}

pub fn drop_button(child &IHandle, attrs ...string) &IHandle {
	drop_button := C.IupDropButton(child)
	drop_button.set_attrs(...attrs)
	return drop_button
}

pub fn flat_button(title string, attrs ...string) &IHandle {
	flat_button := C.IupFlatButton(title.str)
	flat_button.set_attrs(...attrs)
	return flat_button
}

pub fn flat_label(title string, attrs ...string) &IHandle {
	flat_label := C.IupFlatLabel(title.str)
	flat_label.set_attrs(...attrs)
	return flat_label
}

pub fn flat_list(attrs ...string) &IHandle {
	flat_list := C.IupFlatList()
	flat_list.set_attrs(...attrs)
	return flat_list
}

pub fn flat_toggle(title string, attrs ...string) &IHandle {
	flat_toggle := C.IupFlatToggle(title.str)
	flat_toggle.set_attrs(...attrs)
	return flat_toggle
}

pub fn flat_slider(orientation string, attrs ...string) &IHandle {
	flat_slider := C.IupFlatVal(orientation.str)
	flat_slider.set_attrs(...attrs)
	return flat_slider
}

pub fn flat_tree(attrs ...string) &IHandle {
	flat_tree := C.IupFlatTree()
	flat_tree.set_attrs(...attrs)
	return flat_tree
}

pub fn gauge(attrs ...string) &IHandle {
	gauge := C.IupGauge()
	gauge.set_attrs(...attrs)
	return gauge
}

// label is used to draw simple text or images
pub fn label(title string, attrs ...string) &IHandle {
	label := C.IupLabel(title.str)
	label.set_attrs(...attrs)
	return label
}

// link creates a control similar to a `label` that can
// link to external resources (files, URL, etc)
pub fn link(url string, title string, attrs ...string) &IHandle {
	label := C.IupLink(url.str, title.str)
	label.set_attrs(...attrs)
	return label
}

// list creates a component that can list multiple values
pub fn list(attrs ...string) &IHandle {
	list := C.IupList(0)
	list.set_attrs(...attrs)
	return list
}

// menu_item is a component that can be used in a `menu` to
// that is tied to a specific action or event
pub fn menu_item(title string, attrs ...string) &IHandle {
	menu_item := C.IupItem(title.str, 0)
	menu_item.set_attrs(...attrs)
	return menu_item
}

// menu_sep creates a simple horizontal line in a `menu`
pub fn menu_sep(attrs ...string) &IHandle {
	menu_sep := C.IupSeparator()
	menu_sep.set_attrs(...attrs)
	return menu_sep
}

// multiline creates a multiline chooser component
pub fn multiline(attrs ...string) &IHandle {
	multiline := C.IupMultiLine(0)
	multiline.set_attrs(...attrs)
	return multiline
}

// progress is a basic progressbar component
pub fn progress(attrs ...string) &IHandle {
	progress := C.IupProgressBar()
	progress.set_attrs(...attrs)
	return progress
}

// slider is a number-line slider component
pub fn slider(orientation string, attrs ...string) &IHandle {
	slider := C.IupVal(orientation.str)
	slider.set_attrs(...attrs)
	return slider
}

pub fn spin(attrs ...string) &IHandle {
	spin := C.IupSpin()
	spin.set_attrs(...attrs)
	return spin
}

pub fn spin_box(child &IHandle, attrs ...string) &IHandle {
	spin_box := C.IupSpinbox(child)
	spin_box.set_attrs(...attrs)
	return spin_box
}

// sub_menu is a container control for `menu` controls
pub fn sub_menu(title string, child &IHandle, attrs ...string) &IHandle {
	sub_menu := C.IupSubmenu(title.str, child)
	sub_menu.set_attrs(...attrs)
	return sub_menu
}

// text is a standard text input component. Can be configured to
// to be multi-line, number formatted, etc.
pub fn text(attrs ...string) &IHandle {
	text := C.IupText(0)
	text.set_attrs(...attrs)
	return text
}

pub fn tree(attrs ...string) &IHandle {
	tree := C.IupTree()
	tree.set_attrs(...attrs)
	return tree
}

// toggle is a radio or checkbox component. Defaults to radio in a `radio_group`
pub fn toggle(title string, attrs ...string) &IHandle {
	toggle := C.IupToggle(title.str, 0)
	toggle.set_attrs(...attrs)
	return toggle
}

// iupcontrols.h
pub fn controls_open() int {
	return C.IupControlsOpen()
}

pub fn cells() &IHandle {
	return C.IupCells()
}

pub fn matrix(action string) &IHandle {
	return C.IupMatrix(action.str)
}

pub fn matrix_list() &IHandle {
	return C.IupMatrixList()
}

pub fn matrix_ex() &IHandle {
	return C.IupMatrixEx()
}

pub fn (matrix &IHandle) matrix_set_formula(col int, formula string, init string) {
	C.IupMatrixSetFormula(matrix, col, formula.str, init.str)
}

pub fn (matrix &IHandle) matrix_set_dynamic(init string) {
	C.IupMatrixSetDynamic(matrix, init.str)
}
