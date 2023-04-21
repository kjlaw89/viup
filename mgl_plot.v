module viup

fn C.IupMglPlotOpen()
fn C.IupMglPlot() &IHandle
fn C.IupMglPlotBegin(&IHandle, int)
fn C.IupMglPlotAdd1D(&IHandle, charptr, f64)
fn C.IupMglPlotAdd2D(&IHandle, f64, f64)
fn C.IupMglPlotAdd3D(&IHandle, f64, f64, f64)
fn C.IupMglPlotEnd(&IHandle) int

fn C.IupMglPlotNewDataSet(&IHandle, int) int

fn C.IupMglPlotInsert1D(&IHandle, int, int, voidptr, &f64, int)
fn C.IupMglPlotInsert2D(&IHandle, int, int, &f64, &f64, int)
fn C.IupMglPlotInsert3D(&IHandle, int, int, &f64, &f64, &f64, int)

fn C.IupMglPlotSet1D(&IHandle, int, voidptr, &f64, int)
fn C.IupMglPlotSet2D(&IHandle, int, &f64, &f64, int)
fn C.IupMglPlotSet3D(&IHandle, int, &f64, &f64, &f64, int)
fn C.IupMglPlotSetFormula(&IHandle, int, charptr, charptr, charptr, int)

fn C.IupMglPlotSetData(&IHandle, int, &double, int, int, int)
fn C.IupMglPlotLoadData(&IHandle, int, charptr, int, int, int)
fn C.IupMglPlotSetFromFormula(&IHandle, int, charptr, int, int, int)

fn C.IupMglPlotTransform(&IHandle, f64, f64, f64, &int, &int)
fn C.IupMglPlotTransformTo(&IHandle, int, int, &f64, &f64, &f64)
fn C.IupMglPlotDrawMark(&IHandle, f64, f64, f64)
fn C.IupMglPlotDrawLine(&IHandle, f64, f64, f64, f64, f64, f64)
fn C.IupMglPlotDrawText(&IHandle, charptr, f64, f64, f64)

fn C.IupMglPlotPaintTo(&IHandle, charptr, int, int, f64, voidptr)

fn C.IupMglLabel(charptr) &IHandle

pub fn mgl_plot_open() {
	C.IupMglPlotOpen()
}

pub fn mgl_plot() &IHandle {
	return C.IupMglPlot()
}

pub fn (mgl_plot &IHandle) mgl_plot_begin(dim int) {
	C.IupMglPlotBegin(mgl_plot, dim)
}

pub fn (mgl_plot &IHandle) mgl_plot_add1d(name string, y f64) {
	C.IupMglPlotAdd1D(mgl_plot, name.str, y)
}

pub fn (mgl_plot &IHandle) mgl_plot_add2d(x f64, y f64) {
	C.IupMglPlotAdd2D(mgl_plot, x, y)
}

pub fn (mgl_plot &IHandle) mgl_plot_add3d(x f64, y f64, z f64) {
	C.IupMglPlotAdd3D(mgl_plot, x, y, z)
}

pub fn (mgl_plot &IHandle) mgl_plot_end() int {
	return C.IupMglPlotEnd(mgl_plot)
}

pub fn (mgl_plot &IHandle) mgl_plot_new_data_set(dim int) int {
	return C.IupMglPlotNewDataSet(mgl_plot, dim)
}

pub fn (mgl_plot &IHandle) mgl_plot_insert_1d(ds_index int, sample_index int, names []string, y []f64) {
	assert names.len == y.len
	mut name_list := []&char{}
	for i in 0 .. names.len {
		name_list << &char(names[i].str)
	}
	name_list << &char(0)
	mut name_nums := names.len
	C.IupMglPlotInsert1D(mgl_plot, ds_index, sample_index, name_list.data, y.data, name_nums)
}

pub fn (mgl_plot &IHandle) mgl_plot_insert_2d(ds_index int, sample_index int, x []f64, y []f64) {
	assert x.len == y.len
	C.IupMglPlotInsert2D(mgl_plot, ds_index, sample_index, x.data, y.data, x.len)
}

pub fn (mgl_plot &IHandle) mgl_plot_insert_3d(ds_index int, sample_index int, x []f64, y []f64, z []f64) {
	assert x.len == y.len
	assert x.len == z.len
	C.IupMglPlotInsert3D(mgl_plot, ds_index, sample_index, x.data, y.data, z.data, x.len)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_1d(ds_index int, names []string, y []f64) {
	assert names.len == y.len
	mut name_list := []&char{}
	for i in 0 .. names.len {
		name_list << &char(names[i].str)
	}
	name_list << &char(0)
	mut name_nums := names.len
	C.IupMglPlotSet1D(mgl_plot, ds_index, name_list.data, y.data, name_nums)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_2d(ds_index int, x []f64, y []f64) {
	assert x.len == y.len
	C.IupMglPlotSet2D(mgl_plot, ds_index, x.data, y.data, x.len)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_3d(ds_index int, x []f64, y []f64, z []f64) {
	assert x.len == y.len
	assert x.len == z.len
	C.IupMglPlotSet3D(mgl_plot, ds_index, x.data, y.data, z.data, x.len)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_formula(ds_index int, formula_x string, formula_y string, formula_z string) {
	assert formula_x.len == formula_y.len
	assert formula_x.len == formula_z.len
	C.IupMglPlotSetFormula(mgl_plot, ds_index, formula_x.str, formula_y.str, formula_z.str,
		formula_x.len)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_data(ds_index int, data []f64, count_x int, count_y int, count_z int) {
	C.IupMglPlotSetData(mgl_plot, ds_index, data.data, count_x, count_y, count_z)
}

pub fn (mgl_plot &IHandle) mgl_plot_load_data(ds_index int, filename string, count_x int, count_y int, count_z int) {
	C.IupMglPlotLoadData(mgl_plot, ds_index, filename.str, count_x, count_y, count_z)
}

pub fn (mgl_plot &IHandle) mgl_plot_set_from_formula(ds_index int, formula string, count_x int, count_y int, count_z int) {
	C.IupMglPlotSetFromFormula(mgl_plot, ds_index, formula.str, count_x, count_y, count_z)
}

pub fn (mgl_plot &IHandle) mgl_plot_transform(x f64, y f64, z f64, ix &int, iy &int) {
	C.IupMglPlotTransform(mgl_plot, x, y, z, ix, iy)
}

pub fn (mgl_plot &IHandle) mgl_plot_transform_to(ix int, iy int, x &f64, y &f64, z &f64) {
	C.IupMglPlotTransformTo(mgl_plot, ix, iy, x, y, z)
}

pub fn (mgl_plot &IHandle) mgl_plot_draw_mark(x f64, y f64, z f64) {
	C.IupMglPlotDrawMark(mgl_plot, x, y, z)
}

pub fn (mgl_plot &IHandle) mgl_plot_draw_line(x1 f64, y1 f64, z1 f64, x2 f64, y2 f64, z2 f64) {
	C.IupMglPlotDrawLine(mgl_plot, x1, y1, z1, x2, y2, z2)
}

pub fn (mgl_plot &IHandle) mgl_plot_draw_text(text string, x f64, y f64, z f64) {
	C.IupMglPlotDrawText(mgl_plot, text.str, x, y, z)
}

pub fn (mgl_plot &IHandle) mgl_plot_paint_to(format string, w int, h int, dpi f64, data voidptr) {
	C.IupMglPlotPaintTo(mgl_plot, format.str, w, h, dpi, data)
}

pub fn mgl_label(title string) &IHandle {
	return C.IupMglLabel(title.str)
}
