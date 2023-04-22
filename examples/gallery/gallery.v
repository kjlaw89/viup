module main

import os
import viup

//#flag windows "path\\to\\manifest.syso"

const (
	version = '1.0.0'
	about   = '
This is version ${version} of VIUP Control Gallery demo.

It gives a simple overview of all of the available controls and some sample use cases.
	'
)

fn main() {
	vlogo := viup.load_image(os.resource_abs_path('./v-logo.png'), 'resize=64x64')!
	vlogo.set_handle('logo')

	// Create our menu with the typical "File | Edit | About" layout
	menu_event := viup.ActionFunc(menu_clicked)
	menu := viup.menu([
		viup.sub_menu('&File', viup.menu([
			viup.item('&Open File...', 'name=MenuOpen').on_action(menu_event),
			viup.item('&Save File...', 'name=MenuSave').on_action(menu_event),
			viup.separator(),
			viup.item('E&xit', 'name=MenuExit').on_action(menu_event),
		])),
		viup.sub_menu('&Edit', viup.menu([
			viup.item('Debug &Window', 'name=MenuDebugWindow').on_action(menu_event),
			viup.item('Debug &Control', 'name=MenuDebugControl').on_action(menu_event),
		])),
		viup.sub_menu('&Help', viup.menu([
			viup.item('&Repository', 'name=MenuRepository').on_action(menu_event),
			viup.separator(),
			viup.item('&About', 'name=MenuAbout').on_action(menu_event),
		])),
	])

	// Layout design
	// ----------------- hbox ------------------
	// ------vbox------- ---------vbox----------
	// |---frame "BC"--| |----frame "Numbers"--|  "BC" - "Basic Controls"
	// | button        | | spin                |
	// | toggle        | | slider ('value')    |
	// | text          | | progress            |
	// | label         | |---------------------|
	// | flat_separator| |----frame "Lists"----|
	// | date_picker   | | dropdown            |
	// | button        | | editable-dropdown   |
	// | image         | | radio-group         |
	// | fill          | |---------------------|
	// |               | | tab-group           |
	// |---------------| |---------------------|
	hbox := viup.hbox([
		viup.vbox([
			viup.frame(viup.vbox([
				viup.button('Button', 'expand=horizontal').on_action(button_clicked),
				viup.toggle('Checkbox', 'action1'),
				viup.text('expand=horizontal', 'value=Text Field'),
				viup.label('Label'),
				viup.link('https://www.vlang.io', 'Link'),
				viup.flat_separator(),
				viup.button('Set font...', 'expand=horizontal').set_handle('font_btn').on_action(font_button_clicked),
				viup.date_picker('expand=horizontal', 'order=MDY'),
				viup.button('', 'bgcolor=0 0 0', 'expand=horizontal', 'padding=10x0').unset_attr('title').set_handle('color_btn').on_action(color_button_clicked),
				viup.label('', 'size=64x64', 'alignment=acenter', 'expand=horizontal').set_image('logo'),
				viup.fill(),
			]), 'title=Basic Controls', 'margin=10x10', 'expand=yes'),
		], 'expand=vertical', 'gap=10', 'minsize=250x'),
		viup.vbox([
			viup.frame(viup.vbox([
				viup.text('expand=horizontal', 'spin=yes', 'spinmax=100', 'value=50').set_handle('spin1').on_value_changed(numbers_changed),
				viup.slider('horizontal', 'expand=horizontal', 'max=100', 'showticks=yes',
					'step=5', 'tickspos=reverse', 'value=50').set_handle('slider1').on_value_changed(numbers_changed),
				viup.progress_bar('expand=horizontal', 'max=100', 'value=50').set_handle('progress1'),
				viup.fill(),
			]), 'title=Numbers', 'margin=10x10', 'minsize=500x'),
			viup.frame(viup.vbox([
				viup.list('1=Combo Item 1', '2=Combo Item 2', '3=Combo Item 3', '4=Combo Item 4',
					'dropdown=yes', 'expand=horizontal', 'value=1'),
				viup.list('1=Editable Item 1', '2=Editable Item 2', '3=Editable Item 3',
					'4=Editable Item 4', 'dropdown=yes', 'editbox=yes', 'expand=horizontal',
					'value=1'),
				viup.radio_group(viup.vbox([
					viup.toggle('Radio 1'),
					viup.toggle('Radio 2'),
					viup.toggle('Radio 3'),
				])),
			]), 'title=Lists', 'margin=10x10'),
			viup.tabs([
				viup.hbox([
					viup.label('In tab 1'),
					viup.fill(),
				], 'tabtitle=Tab 1'),
				viup.hbox([
					viup.label('In tab 2'),
				], 'tabtitle=Tab 2'),
				viup.hbox([
					viup.label('In tab 3'),
				], 'tabtitle=Tab 3'),
			]),
		], 'gap=10'),
	], 'margin=10x10')

	// Create our window to display - size will be
	// automatically calculated by components

	dialog := viup.dialog(viup.scroll(hbox), 'MainWindow', 'title=Control Gallery')
	dialog.set_menu('app_menu', menu)
	dialog.show_xy(viup.pos_center, viup.pos_center)

	viup.main_loop()
	viup.close()
}

// menu_clicked handles when different menu items are clicked
fn menu_clicked(control &viup.Ihandle) viup.FuncResult {
	name := control.get_attr('name')
	match name {
		'MenuAbout' {
			viup.message_dialog('title=About', 'value=${about}', 'dialogtype=information').popup(viup.pos_current,
				viup.pos_current)
		}
		'MenuExit' {
			return .close
		}
		'MenuOpen' {
			dialog := viup.file_dialog('title=Open file...')
			dialog.popup(viup.pos_current, viup.pos_current)

			if dialog.get_int('status') == 0 {
				value := dialog.get_attr('value')

				viup.message_dialog('title=File Opened', "value=The file '${value}' was opened.",
					'dialogtype=information').popup(viup.pos_current, viup.pos_current)
			}
		}
		'MenuDebugControl' {
			focused := viup.get_focused()
			focused.debug_props()
		}
		'MenuDebugWindow' {
			window := viup.get_handle('MainWindow')
			window.debug() // when autofree is enabled this will cause a crash as the mainwindow will go out of scope and be freed
		}
		'MenuRepository' {
			viup.help('https://github.com/kjlaw89/viup')
		}
		'MenuSave' {
			dialog := viup.file_dialog('title=Save file...', 'dialogtype=save')
			dialog.popup(viup.pos_current, viup.pos_current)

			if dialog.get_int('status') != -1 {
				value := dialog.get_attr('value')

				viup.message_dialog('buttons=OKCANCEL', 'dialogtype=warning', 'title=File Save',
					"value=The file '${value}' was not actually saved, but this is where you would do it.").popup(viup.pos_current,
					viup.pos_current)
			}
		}
		else {
			println('Menu ${name}')
		}
	}

	return .cont
}

// numbers_changed handles when the spinner or slider are updated
// and links all three controls together automatically
fn numbers_changed(control &viup.Ihandle) viup.FuncResult {
	value := control.get_attr('value')
	viup.get_handle('spin1').set_attr('value', value.int().str())
	viup.get_handle('slider1').set_attr('value', value)
	viup.get_handle('progress1').set_attr('value', value)

	return .cont
}

// button_clicked shows a dialog when the test button is clicked
fn button_clicked(control &viup.Ihandle) viup.FuncResult {
	viup.message('Button Click', 'Button clicked!')
	return .cont
}

// font_button_clicked shows a font dialog when the font button is clicked
fn font_button_clicked(control &viup.Ihandle) viup.FuncResult {
	font := control.get_font().show_picker()
	control.set_font(font).set_attr('title', font.face)

	return .cont
}

// color_button_clicked shows a color dialog when the color button is clicked
fn color_button_clicked(control &viup.Ihandle) viup.FuncResult {
	color, table := control.get_bgcolor().show_picker()
	println(table)
	control.set_bgcolor(color)

	return .cont
}
