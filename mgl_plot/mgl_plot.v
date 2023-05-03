module mgl_plot

import viup { Ihandle, cleanup_iup, init_iup }
import viup.canvas { Canvas }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liup_mglplot
#include "iup.h"
#include "iup_mglplot.h"

// `Mgl_Plot` inherits from `Canvas`
[heap]
pub struct Mgl_Plot {
	Canvas
}

fn C.IupMglPlotOpen()
fn C.IupMglPlot() &Mgl_Plot
fn C.IupMglPlotBegin(&Mgl_Plot, int)
fn C.IupMglPlotAdd1D(&Mgl_Plot, charptr, f64)
fn C.IupMglPlotAdd2D(&Mgl_Plot, f64, f64)
fn C.IupMglPlotAdd3D(&Mgl_Plot, f64, f64, f64)
fn C.IupMglPlotEnd(&Mgl_Plot) int
fn C.IupMglPlotNewDataSet(&Mgl_Plot, int) int
fn C.IupMglPlotInsert1D(&Mgl_Plot, int, int, voidptr, &f64, int)
fn C.IupMglPlotInsert2D(&Mgl_Plot, int, int, &f64, &f64, int)
fn C.IupMglPlotInsert3D(&Mgl_Plot, int, int, &f64, &f64, &f64, int)
fn C.IupMglPlotSet1D(&Mgl_Plot, int, voidptr, &f64, int)
fn C.IupMglPlotSet2D(&Mgl_Plot, int, &f64, &f64, int)
fn C.IupMglPlotSet3D(&Mgl_Plot, int, &f64, &f64, &f64, int)
fn C.IupMglPlotSetFormula(&Mgl_Plot, int, charptr, charptr, charptr, int)
fn C.IupMglPlotSetData(&Mgl_Plot, int, &double, int, int, int)
fn C.IupMglPlotLoadData(&Mgl_Plot, int, charptr, int, int, int)
fn C.IupMglPlotSetFromFormula(&Mgl_Plot, int, charptr, int, int, int)
fn C.IupMglPlotTransform(&Mgl_Plot, f64, f64, f64, &int, &int)
fn C.IupMglPlotTransformTo(&Mgl_Plot, int, int, &f64, &f64, &f64)
fn C.IupMglPlotDrawMark(&Mgl_Plot, f64, f64, f64)
fn C.IupMglPlotDrawLine(&Mgl_Plot, f64, f64, f64, f64, f64, f64)
fn C.IupMglPlotDrawText(&Mgl_Plot, charptr, f64, f64, f64)
fn C.IupMglPlotPaintTo(&Mgl_Plot, charptr, int, int, f64, voidptr)
fn C.IupMglLabel(charptr) &Mgl_Plot

// mgl_plot_open must be called after `open`
fn init() {
	init_iup()
	C.IupMglPlotOpen()
}

fn cleanup() {
	cleanup_iup()
}

// mgl_plot returns the identifier of the created plot, or NULL if an error occurs
pub fn mgl_plot(attrs ...string) &Mgl_Plot {
	mgl_plot := C.IupMglPlot()
	mgl_plot.set_attrs(...attrs)
	return mgl_plot
}

// mgl_plot_begin prepares a dataset to receive samples. The dimension `dim` of the data can be 1, 2 or 3. Linear data only
pub fn (mgl_plot &Mgl_Plot) mgl_plot_begin(dim int) &Mgl_Plot {
	C.IupMglPlotBegin(mgl_plot, dim)
	return mgl_plot
}

// mgl_plot_add1d adds a sample to the dataset. Can only be called if `mgl_plot_begin` was called with dim=1. `name` is an optional string used for tick labels in the X axis, and it can be NULL. Names are allowed only for the first dataset and when set ticks configuration for the X axis is ignored, all the names are shown. The X axis data is automatically generated (0,1,2,3,...). Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_add1d(name string, y f64) &Mgl_Plot {
	C.IupMglPlotAdd1D(mgl_plot, name.str, y)
	return mgl_plot
}

// mgl_plot_add2d adds a sample to the dataset. Can only be called if `mgl_plot_begin` was called with dim=2. Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_add2d(x f64, y f64) &Mgl_Plot {
	C.IupMglPlotAdd2D(mgl_plot, x, y)
	return mgl_plot
}

// mgl_plot_add3d adds a sample to the dataset. Can only be called if `mgl_plot_begin` was called with dim=3. Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_add3d(x f64, y f64, z f64) &Mgl_Plot {
	C.IupMglPlotAdd3D(mgl_plot, x, y, z)
	return mgl_plot
}

// mgl_plot_end adds the dataset to the plot and returns the dataset index. The dataset can be empty. Redraw is NOT done until the REDRAW attribute is set. Also it will change the current dataset index (CURRENT) to the return value. You can only set attributes of a dataset AFTER you added the dataset. Can only be called if `mgl_plot_begin` was called. Whenever you create a dataset all its "DS_*" attributes will be set to the default values. Notice that DS_MODE must be set before other "DS_*" attributes. Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_end(attrs ...string) int {
	mgl_plot.set_attrs(...attrs)
	return C.IupMglPlotEnd(mgl_plot)
}

// mgl_plot_new_data_set creates an empty dataset to receive samples. The dimension `dim` of the data can be 1, 2 or 3. Linear data can have 1, 2 or 3 dimensions. Planar data has 2 dimensions, but use dim=1. Volumetric data has 3 dimensions, but use dim=1. Planar and volumetric data distribute their data in 2D and 3D continuous arrays, so the number of dimensions is given only when the array is set in `mgl_plot_set_data`, `mgl_plot_load_data` or `mgl_plot_set_formula`. You can convert planar data into linear data using the DS_REARRANGE and DS_SPLIT attributes.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_new_data_set(dim int) int {
	return C.IupMglPlotNewDataSet(mgl_plot, dim)
}

// mgl_plot_insert_1d inserts an array of samples in the dataset `ds_index` at the given `sample_index`. Can be used only after the dataset is added to the plot. `sample_index` can be after the last sample so data is appended to the array. Current data is shifted if necessary. `names` are optional strings used for tick labels in the X axis, and it can be NULL. `names` are allowed only for the first dataset and when set ticks configuration for the X axis is ignored, all the `names` are shown. Also for the 1D version, the X axis data is automatically generated (0,1,2,3,...). Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_insert_1d(ds_index int, sample_index int, names []string, y []f64) &Mgl_Plot {
	assert names.len == y.len
	mut name_list := []&char{}
	for i in 0 .. names.len {
		name_list << &char(names[i].str)
	}
	name_list << &char(0)
	mut name_nums := names.len
	C.IupMglPlotInsert1D(mgl_plot, ds_index, sample_index, name_list.data, y.data, name_nums)
	return mgl_plot
}

// mgl_plot_insert_2d check `mgl_plot_insert_1d`
pub fn (mgl_plot &Mgl_Plot) mgl_plot_insert_2d(ds_index int, sample_index int, x []f64, y []f64) &Mgl_Plot {
	assert x.len == y.len
	C.IupMglPlotInsert2D(mgl_plot, ds_index, sample_index, x.data, y.data, x.len)
	return mgl_plot
}

// mgl_plot_insert_3d check `mgl_plot_insert_1d`
pub fn (mgl_plot &Mgl_Plot) mgl_plot_insert_3d(ds_index int, sample_index int, x []f64, y []f64, z []f64) &Mgl_Plot {
	assert x.len == y.len
	assert x.len == z.len
	C.IupMglPlotInsert3D(mgl_plot, ds_index, sample_index, x.data, y.data, z.data, x.len)
	return mgl_plot
}

// mgl_plot_set_1d sets an array of samples in the dataset `ds_index`.  Existing data is removed. Can be used only after the dataset is added to the plot. `names` is an optional array of strings used for tick labels in the X axis, and it can be NULL. `names` are allowed only for the first dataset and when set ticks configuration for the X axis is ignored, all the `names` are shown. Also for the 1D version, the X axis data is automatically generated (0,1,2,3,...). Linear data only.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_1d(ds_index int, names []string, y []f64) &Mgl_Plot {
	assert names.len == y.len
	mut name_list := []&char{}
	for i in 0 .. names.len {
		name_list << &char(names[i].str)
	}
	name_list << &char(0)
	mut name_nums := names.len
	C.IupMglPlotSet1D(mgl_plot, ds_index, name_list.data, y.data, name_nums)
	return mgl_plot
}

// mgl_plot_set_2d check `mgl_plot_set_1d`
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_2d(ds_index int, x []f64, y []f64) &Mgl_Plot {
	assert x.len == y.len
	C.IupMglPlotSet2D(mgl_plot, ds_index, x.data, y.data, x.len)
	return mgl_plot
}

// mgl_plot_set_3d check `mgl_plot_set_1d`
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_3d(ds_index int, x []f64, y []f64, z []f64) &Mgl_Plot {
	assert x.len == y.len
	assert x.len == z.len
	C.IupMglPlotSet3D(mgl_plot, ds_index, x.data, y.data, z.data, x.len)
	return mgl_plot
}

// mgl_plot_set_formula same as `mgl_plot_set*` but data is generated from a formula. If `count` is 0 the current size is used. If 2D data then `formula_y` must be non NULL. If 3D data then `formula_z` must be non NULL. The variables of the formulas must be x, y and/or z. Coordinates are evaluated in the [AXS_?MIN, AXS_?MAX] interval. There is no difference between lower or upper case in formulas. Linear data only.
// The operators and functions can be:
// + - * / ^      ('^' is 'integer power')
// < > = & |      (logical operators, '&' is 'and', '|' is 'or')
// sqrt(a)  pow(a,b)  log(a,b)  ln(a)    lg(a)            (ln(a)=log(e,a)  lg(a)=log(10,a)
// abs(a)   sign(a)   mod(a,b)  step(a)  int(a)   rnd      pi
// sin(a)   cos(a)    tan(a)    asin(a)  acos(a)  atan(a)
// sinh(a)   cosh(a)  tanh(a)   asinh(a) acosh(a) atanh(a)
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_formula(ds_index int, formula_x string, formula_y string, formula_z string, count int) &Mgl_Plot {
	assert formula_x.len == formula_y.len
	assert formula_x.len == formula_z.len
	C.IupMglPlotSetFormula(mgl_plot, ds_index, formula_x.str, formula_y.str, formula_z.str,
		count)
	return mgl_plot
}

// mgl_plot_set_data sets an array of samples in the dataset `ds_index`. All previous values are removed. Can be used only after a 1D dataset is added to the plot, the actual dimension will be defined by the `count_*` parameters. If `count_y` is greater than 1 the data will be Planar (like a raster 2D image), if `count_z` is also greater than 1 the data will be Volumetric (a 3D volume).
// Notice that when `count_y` and/or `count_z` are greater than 0 a large amount of memory is used. All previous functions create linear data (a sequence of points) even though their coordinates can have 1, 2 or 3 dimensions. The data should be arranged so the element (x0, y0, z0) is accessed using the position [x0 + count_x*y0 + count_x*count_y*z0].
// DS_COUNT is set to `count_x`*`count_y`*`count_z`. Existing data is removed.
// Can be used for linear, planar or volumetric data, but linear data is limited to 1D coordinates. You can convert planar data into linear data using the DS_REARRANGE and DS_SPLIT attributes.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_data(ds_index int, data []f64, count_x int, count_y int, count_z int) &Mgl_Plot {
	C.IupMglPlotSetData(mgl_plot, ds_index, data.data, count_x, count_y, count_z)
	return mgl_plot
}

// mgl_plot_load_data same as `mgl_plot_set_data` but loads the data from `filename`. The file must contains space (' ') separated numeric data in text format. The text can contains line comments starting with '#'.
// DS_COUNT is set to count_x*count_y*count_z. Existing data is removed. Linear data is limited to 1D coordinates.
// If any count_* is 0 all their values are automatically calculated. The number of elements in the first line defines `count_x`, the number of lines before an empty line or before a form feed ('\f') defines `count_y`, and the number of empty lines or the number of form feeds ('\f') defines `count_z`.
// Can be used for linear, planar or volumetric data, but linear data is limited to 1D coordinates. You can convert planar data into linear data using the DS_REARRANGE and DS_SPLIT attributes.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_load_data(ds_index int, filename string, count_x int, count_y int, count_z int) &Mgl_Plot {
	C.IupMglPlotLoadData(mgl_plot, ds_index, filename.str, count_x, count_y, count_z)
	return mgl_plot
}

// mgl_plot_set_from_formula same as `mgl_plot_set_data` but data is generated from a `formula`. If all `count_*` are 0 the current size remains, and the existing data is preserved but overwritten if the `formula` results that. If any `count_*` is NOT zero then the existing data size is removed. The variables of the formulas must be 'x', 'y' and/or 'z'. Coordinates are evaluated in the [AXS_?MIN, AXS_?MAX] interval. There is no difference between lower or upper case in formulas.
// The operators and functions can be:
// + - * / ^      ('^' is 'integer power')
// < > = & |      (logical operators, '&' is 'and', '|' is 'or')
// sqrt(a)  pow(a,b)  log(a,b)  ln(a)    lg(a)            (ln(a)=log(e,a)  lg(a)=log(10,a)
// abs(a)   sign(a)   mod(a,b)  step(a)  int(a)   rnd      pi
// sin(a)   cos(a)    tan(a)    asin(a)  acos(a)  atan(a)
// sinh(a)   cosh(a)  tanh(a)   asinh(a) acosh(a) atanh(a)
// DS_COUNT is set to count_x*count_x*count_y.
// Can be used for linear, planar or volumetric data, but linear data is limited to 1D coordinates. You can convert planar data into linear data using the DS_REARRANGE and DS_SPLIT attributes.
pub fn (mgl_plot &Mgl_Plot) mgl_plot_set_from_formula(ds_index int, formula string, count_x int, count_y int, count_z int) &Mgl_Plot {
	C.IupMglPlotSetFromFormula(mgl_plot, ds_index, formula.str, count_x, count_y, count_z)
	return mgl_plot
}

// mgl_plot_transform converts coordinates from plot coordinates to pixels. It can be used only inside PREDRAW_CB and POSTDRAW_CB callbacks
pub fn (mgl_plot &Mgl_Plot) mgl_plot_transform(x f64, y f64, z f64) (int, int) {
	mut ix := int(0)
	mut iy := int(0)
	C.IupMglPlotTransform(mgl_plot, x, y, z, &ix, &iy)
	return ix, iy
}

// mgl_plot_transform_to converts coordinates from pixels to plot coordinates. It can be used only inside PREDRAW_CB and POSTDRAW_CB callbacks
pub fn (mgl_plot &Mgl_Plot) mgl_plot_transform_to(ix int, iy int) (f64, f64, f64) {
	mut x := f64(0)
	mut y := f64(0)
	mut z := f64(0)
	C.IupMglPlotTransformTo(mgl_plot, ix, iy, &x, &y, &z)
	return x, y, z
}

// mgl_plot_draw_mark draws a mark at given position in plot coordinates. It can be used only inside PREDRAW_CB and POSTDRAW_CB callbacks. The attributes DRAWCOLOR, DRAWMARKSTYLE and DRAWMARKSIZE can be used to control mark appearance
pub fn (mgl_plot &Mgl_Plot) mgl_plot_draw_mark(x f64, y f64, z f64) &Mgl_Plot {
	C.IupMglPlotDrawMark(mgl_plot, x, y, z)
	return mgl_plot
}

// mgl_plot_draw_line draws a line from position 1 to position 2 in plot coordinates. It can be used only inside PREDRAW_CB and POSTDRAW_CB callbacks. The attributes DRAWCOLOR, DRAWLINESTYLE and DRAWLINEWIDTH can be used to control line appearance
pub fn (mgl_plot &Mgl_Plot) mgl_plot_draw_line(x1 f64, y1 f64, z1 f64, x2 f64, y2 f64, z2 f64) &Mgl_Plot {
	C.IupMglPlotDrawLine(mgl_plot, x1, y1, z1, x2, y2, z2)
	return mgl_plot
}

// mgl_plot_draw_text draws a text at given position in plot coordinates. It can be used only inside PREDRAW_CB and POSTDRAW_CB callbacks. The attributes DRAWCOLOR, DRAWFONT, DRAWFONTSTYLE and DRAWFONTSIZE (a factor) can be used to control text appearance. DRAWFONTSTYLE can be a combination of Plain (Regular), Bold, Italic (Oblique), Wired, Underline, Strikeout, Left, Center and Right
pub fn (mgl_plot &Mgl_Plot) mgl_plot_draw_text(text string, x f64, y f64, z f64) &Mgl_Plot {
	C.IupMglPlotDrawText(mgl_plot, text.str, x, y, z)
	return mgl_plot
}

// mgl_plot_paint_to plots to a metafile or a bitmap instead of the display canvas. `format` will define the interpretation of the `data` parameter. `format` can be: "EPS", "SVG", "RGB", or "RGBA". When `format` is EPS or SVG, `data` is a filename string. When `format` is RGB or RGBA `data` is the image buffer where the pixels will be copied, must be already allocated. `w` and `h` is the size in pixels, and `dpi` is the resolution in dots or pixels per inch. If `w`, `h` or `dpi` are 0 the screen equivalent is used
pub fn (mgl_plot &Mgl_Plot) mgl_plot_paint_to(format string, w int, h int, dpi f64, data voidptr) &Mgl_Plot {
	C.IupMglPlotPaintTo(mgl_plot, format.str, w, h, dpi, data)
	return mgl_plot
}

// mgl_label creates a label interface element using MathGL so it can display TeX symbols, `title` to be shown on the label
pub fn mgl_label(title string, attrs ...string) &Mgl_Plot {
	mgl_label := C.IupMglLabel(title.str)
	mgl_label.set_attrs(...attrs)
	return mgl_label
}

// set_handle is a helper function for `Mgl_Plot` that calls the global
// `set_handle` function. Returns back an instance of `Mgl_Plot` for chaining
pub fn (mgl_plot &Mgl_Plot) set_handle(name string) &Mgl_Plot {
	C.IupSetHandle(name.str, &Ihandle(mgl_plot))
	return mgl_plot
}

// get_mgl_plot_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_mgl_plot_handle(handle string) &Mgl_Plot {
	return &Mgl_Plot(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Mgl_Plot` and
// returns `Mgl_Plot` back for chaining
pub fn (mgl_plot &Mgl_Plot) set_attr(name string, value string) &Mgl_Plot {
	C.IupSetStrAttribute(&Ihandle(mgl_plot), name.to_upper().trim_space().str, value.trim_space().str)

	return mgl_plot
}

// set_attrs takes all x=x values and applies them to `Mgl_Plot` and
// returns `Mgl_Plot` back for chaining
pub fn (mgl_plot &Mgl_Plot) set_attrs(attrs ...string) &Mgl_Plot {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		mgl_plot.set_attr(split[0], split[1])
	}

	return mgl_plot
}

// set_data associates the provided `data` with `Mgl_Plot` and
// returns `Mgl_Plot` back for chaining
pub fn (mgl_plot &Mgl_Plot) set_data(name string, data voidptr) &Mgl_Plot {
	C.IupSetAttribute(&Ihandle(mgl_plot), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return mgl_plot
}

// unset_attr clears the provided attribute
pub fn (mgl_plot &Mgl_Plot) unset_attr(name string) &Mgl_Plot {
	C.IupSetAttribute(&Ihandle(mgl_plot), name.to_upper().trim_space().str, C.NULL)
	return mgl_plot
}
