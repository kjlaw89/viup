module main

import viup
import viup.plot as plot_module

const max_plot = 6

@[heap]
struct Plot {
pub mut:
	plot  []&viup.Control
	vboxr []&viup.Control
}

fn main() {
	mut plot := Plot{}
	plot_test(mut plot)
	viup.main_loop()
}

fn plot_test(mut plot Plot) {
	// create plots
	for _ in 0 .. max_plot {
		plot.plot << &viup.Control(plot_module.plot('menuitemproperties=Yes'))
	}
	/*
	left panel: plot control
     Y zooming
	*/
	dial1 := viup.dial('VERTICAL', 'active=NO', 'size=20x52') //.on_button_press(dial1_btndown_cb).on_mouse_move(dial1_btnup_cb).on_button_release(dial1_btnup_cb)
	boxinfo1 := viup.vbox([viup.label('+', 'expand=NO'), viup.fill(),
		viup.label('-', 'expand=NO')], 'alignment=ACENTER', 'size=20x52', 'gap=2', 'margin=4',
		'expand=YES')
	boxdial1 := viup.hbox([boxinfo1, dial1], 'alignment=ACENTER')

	tgg1 := viup.toggle('Y Autoscale', 'value=ON') //.on_action(tgg1_cb)
	f1 := viup.frame(viup.vbox([boxdial1, tgg1]), 'title=Y Zoom')

	// X zooming
	dial2 := viup.dial('HORIZONTAL', 'alignment=ACENTER', 'active=NO', 'size=64x16') //.on_button_press(dial2_btndown_cb).on_mouse_move(dial2_btnup_cb).on_button_release(dial2_btnup_cb)
	boxinfo2 := viup.hbox([viup.label('-', 'expand=NO'), viup.fill(),
		viup.label('+', 'expand=NO')], 'alignment=ACENTER', 'size=64x16', 'gap=2', 'margin=4',
		'expand=HORIZONTAL')
	boxdial2 := viup.vbox([dial2, boxinfo2])

	tgg2 := viup.toggle('X Autoscale') //.on_action(tgg2_cb)
	f2 := viup.frame(viup.vbox([boxdial2, tgg2]), 'title=X Zoom')

	tgg3 := viup.toggle('Vertical Grid') //.on_action(tgg3_cb)
	tgg4 := viup.toggle('Horizontal Grid') //.on_action(tgg4_cb)
	tgg5 := viup.toggle('Legend') //.on_action(tgg5_cb)
	bt1 := viup.button('Export PDF') //.on_action(bt1_cb)
	vboxl := viup.vbox([f1, f2, viup.label('', 'separator=HORIZONTAL'), tgg3, tgg4,
		viup.label('', 'separator=HORIZONTAL'), tgg5, viup.label('', 'separator=HORIZONTAL'),
		bt1], 'gap=4', 'expand=NO')
	// right panel: tabs with plots
	for i in 0 .. max_plot {
		plot.vboxr << viup.vbox([plot.plot[i]], 'tabtitle=Plot ${i}')
		viup.set_handle(plot.vboxr[i].get_attr('tabtitle'), &viup.Ihandle(plot.vboxr[i]))
	}

	// plot.vboxr[MAXPLOT] = NULL; /* mark end of array */
	tabs := viup.tabs(plot.vboxr) //.on_tab_change(tabs_tabchange_cb)
	hbox := viup.hbox([vboxl, tabs], 'margin=4x4', 'gap=10')

	dlg := viup.dialog(hbox, '', 'title=IupPlot Example', 'size=300x')

	// init_plots() /* It must be able to be done independent of dlg Mapping */

	// tabs_tabchange_cb(tabs, plot.vboxr[0])
	dlg.show_xy(viup.pos_center, viup.pos_center)
	dlg.set_attr('size', '')
}
