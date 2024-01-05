module plot

import viup { Ihandle, cleanup_iup, init_iup }
import viup.canvas { Canvas }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liup_plot -lcd -lcdcontextplus -lcdgl
#include "iup.h"
#include "iup_plot.h"

// `Plot` inherits from `Canvas`
@[heap]
pub struct Plot {
	Canvas
}

fn C.IupPlotOpen()
fn C.IupPlot() &Plot
fn C.IupPlotBegin(&Plot, int)
fn C.IupPlotAdd(&Plot, f64, f64)
fn C.IupPlotAddSegment(&Plot, f64, f64)
fn C.IupPlotAddStr(&Plot, charptr, f64)
fn C.IupPlotEnd(&Plot) int
fn C.IupPlotLoadData(&Plot, charptr, int) int
fn C.IupPlotInsert(&Plot, int, int, f64, f64)
fn C.IupPlotInsertSegment(&Plot, int, int, f64, f64)
fn C.IupPlotInsertStr(&Plot, int, int, charptr, f64)
fn C.IupPlotInsertSamples(&Plot, int, int, &f64, &f64, int)
fn C.IupPlotInsertStrSamples(&Plot, int, int, voidptr, &f64, int)
fn C.IupPlotAddSamples(&Plot, int, &f64, &f64, int)
fn C.IupPlotAddStrSamples(&Plot, int, voidptr, &f64, int)
fn C.IupPlotGetSample(&Plot, int, int, &f64, &f64)
fn C.IupPlotGetSampleStr(&Plot, int, int, voidptr, &f64)
fn C.IupPlotGetSampleSelection(&Plot, int, int) int
fn C.IupPlotGetSampleExtra(&Plot, int, int) f64
fn C.IupPlotSetSample(&Plot, int, int, f64, f64)
fn C.IupPlotSetSampleStr(&Plot, int, int, charptr, f64)
fn C.IupPlotSetSampleSelection(&Plot, int, int, int)
fn C.IupPlotSetSampleExtra(&Plot, int, int, f64)
fn C.IupPlotTransform(&Plot, f64, f64, &f64, &f64)
fn C.IupPlotTransformTo(&Plot, f64, f64, &f64, &f64)
fn C.IupPlotFindSample(&Plot, f64, f64, &int, &int) int
fn C.IupPlotFindSegment(&Plot, f64, f64, &int, &int, &int) int
fn C.IupPlotPaintTo(&Plot, voidptr)

// fn C.IupPlotSetFormula(&Plot,int,charptr,charptr)

// plot_open must be called after a `open`
fn init() {
	init_iup()
	C.IupPlotOpen()
}

fn cleanup() {
	cleanup_iup()
}

// plot create a plot control
pub fn plot(attrs ...string) &Plot {
	plot_control := C.IupPlot()
	plot_control.set_attrs(...attrs)
	return plot_control
}

// plot_begin prepares a dataset to receive samples. If `str_xdata` is true then the X axis value is a string
pub fn (plot_control &Plot) plot_begin(str_xdata bool) &Plot {
	str_xdata_int := if str_xdata { 1 } else { 0 }
	C.IupPlotBegin(plot_control, str_xdata_int)
	return plot_control
}

// plot_add adds a sample(`x`,`y`) to the dataset. Can only be called if `plot_begin` was called with `str_xdata`=false
pub fn (plot_control &Plot) plot_add(x f64, y f64) &Plot {
	C.IupPlotAdd(plot_control, x, y)
	return plot_control
}

// plot_add_segment same as `plot_add`, but the sample starts a new segment. In drawing mode where samples are connected by lines this will create an empty space
pub fn (plot_control &Plot) plot_add_segment(x f64, y f64) &Plot {
	C.IupPlotAddSegment(plot_control, x, y)
	return plot_control
}

// plot_add_str same as `plot_add`, but allows to use a string as the X axis value. Can only be called if `plot_begin` was called with `str_xdata`=true. Strings will be shown only in linear scale, they will not be shown in Logarithm scale
pub fn (plot_control &Plot) plot_add_str(x string, y f64) &Plot {
	C.IupPlotAddStr(plot_control, x.str, y)
	return plot_control
}

// plot_end adds a 2D dataset to the plot and returns the dataset index. The data set can be empty. Redraw is NOT done until the REDRAW attribute is set. Also it will change the current dataset index to the return value. You can only set attributes of a dataset AFTER you added the dataset.  Can only be called if `plot_begin` was called. Whenever you create a dataset all its "DS_*" attributes will be set to the default values
pub fn (plot_control &Plot) plot_end(attrs ...string) int {
	plot_control.set_attrs(...attrs)
	return C.IupPlotEnd(plot_control)
}

// plot_load_data creates new datasets from data stored in a file `filename`. The file must contains space (' '), tab ('\t') or semicolon (';') separated numeric data in text format. The text can contains line comments starting with '#'. The file can have more than one dataset but the first column will always be the X coordinate of all datasets. If `str_xdata`=true then the first column is treated as a string. The first line will define the number of datasets. The file must have at least two columns of data. Returns a non zero value is successful, or a zero value if failed. Notice that if it fails during data read, but after the fist line, the datasets were already created and they will not be destroyed when the function returns
pub fn (plot_control &Plot) plot_load_data(filename string, str_xdata bool) int {
	str_xdata_int := if str_xdata { 1 } else { 0 }
	return C.IupPlotLoadData(plot_control, filename.str, str_xdata_int)
}

// plot_insert inserts a sample in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_insert(ds_index int, sample_index int, x f64, y f64) &Plot {
	C.IupPlotInsert(plot_control, ds_index, sample_index, x, y)
	return plot_control
}

// plot_insert_segment inserts a sample in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_insert_segment(ds_index int, sample_index int, x f64, y f64) &Plot {
	C.IupPlotInsertSegment(plot_control, ds_index, sample_index, x, y)
	return plot_control
}

// plot_insert_str inserts a sample in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_insert_str(ds_index int, sample_index int, x string, y f64) &Plot {
	C.IupPlotInsertStr(plot_control, ds_index, sample_index, x.str, y)
	return plot_control
}

// plot_insert_samples inserts an array of samples in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_insert_samples(ds_index int, sample_index int, x []f64, y []f64) &Plot {
	assert x.len == y.len
	C.IupPlotInsertSamples(plot_control, ds_index, sample_index, x.data, y.data, x.len)
	return plot_control
}

// plot_insert_str_samples inserts an array of samples in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_insert_str_samples(ds_index int, sample_index int, x []string, y []f64) &Plot {
	assert x.len == y.len
	C.IupPlotInsertStrSamples(plot_control, ds_index, sample_index, x.data, y.data, x.len)
	return plot_control
}

// plot_add_samples adds an array of samples in a dataset at the end. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_add_samples(ds_index int, x []f64, y []f64) &Plot {
	assert x.len == y.len
	C.IupPlotAddSamples(plot_control, ds_index, x.data, y.data, x.len)
	return plot_control
}

// plot_add_str_samples adds an array of samples in a dataset at the end. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_add_str_samples(ds_index int, x []string, y []f64) &Plot {
	assert x.len == y.len
	C.IupPlotAddStrSamples(plot_control, ds_index, x.data, y.data, x.len)
	return plot_control
}

// plot_get_sample returns the sample value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_get_sample(ds_index int, sample_index int) (f64, f64) {
	mut x := f64(0)
	mut y := f64(0)
	C.IupPlotGetSample(plot_control, ds_index, sample_index, &x, &y)
	return x, y
}

// plot_get_sample_str returns the sample value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_get_sample_str(ds_index int, sample_index int) (string, f64) {
	mut ptr := charptr(0)
	mut y := f64(0)
	C.IupPlotGetSampleStr(plot_control, ds_index, sample_index, ptr, &y)
	x := unsafe { cstring_to_vstring(ptr) }
	return x, y
}

// plot_get_sample_selection returns the sample selected state in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot. By default all samples are not selected. Returns -1 if an error occurred
pub fn (plot_control &Plot) plot_get_sample_selection(ds_index int, sample_index int) int {
	return C.IupPlotGetSampleSelection(plot_control, ds_index, sample_index)
}

// plot_get_sample_extra returns the sample extra value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot. By default all samples have an extra of 0. Returns -1 if an error occurred
pub fn (plot_control &Plot) plot_get_sample_extra(ds_index int, sample_index int) f64 {
	return C.IupPlotGetSampleExtra(plot_control, ds_index, sample_index)
}

// plot_set_sample changes the sample value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_set_sample(ds_index int, sample_index int, x f64, y f64) &Plot {
	C.IupPlotSetSample(plot_control, ds_index, sample_index, x, y)
	return plot_control
}

// plot_set_sample_str changes the sample value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_set_sample_str(ds_index int, sample_index int, x string, y f64) &Plot {
	C.IupPlotSetSampleStr(plot_control, ds_index, sample_index, x.str, y)
	return plot_control
}

// plot_set_sample_selection changes the sample selected state in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_set_sample_selection(ds_index int, sample_index int, selected bool) &Plot {
	selected_int := if selected { 1 } else { 0 }
	C.IupPlotSetSampleSelection(plot_control, ds_index, sample_index, selected_int)
	return plot_control
}

// plot_set_sample_extra changes the sample extra value in a dataset at the given `sample_index`. Can be used only after the dataset is added to the plot
pub fn (plot_control &Plot) plot_set_sample_extra(ds_index int, sample_index int, extra f64) &Plot {
	C.IupPlotSetSampleExtra(plot_control, ds_index, sample_index, extra)
	return plot_control
}

// plot_transform converts coordinates in plot units to pixels. It should be used inside callbacks only. Output variables can be NULL if not used. Y canvas coordinates is in CD bottom to top orientation
pub fn (plot_control &Plot) plot_transform(x f64, y f64) (f64, f64) {
	mut cnv_x := f64(0)
	mut cnv_y := f64(0)
	C.IupPlotTransform(plot_control, x, y, &cnv_x, &cnv_y)
	return cnv_x, cnv_y
}

// plot_transform_to converts coordinates from pixels to plot coordinates. It should be used inside callbacks only. Output variables can be NULL if not used. Y canvas coordinates is in CD bottom to top orientation
pub fn (plot_control &Plot) plot_transform_to(cnv_x f64, cnv_y f64) (f64, f64) {
	mut x := f64(0)
	mut y := f64(0)
	C.IupPlotTransformTo(plot_control, cnv_x, cnv_y, &x, &y)
	return x, y
}

// plot_find_sample returns the nearest sample of the nearest dataset within a tolerance neighborhood. Tolerance can be set in SCREENTPlotRANCE attribute. Returns a non zero value is successful, or a zero value if failed. It should be used inside callbacks only. Output variables can be NULL if not used. The datasets are searched in reverse order they are drawn. Y canvas coordinates is in CD bottom to top orientation
pub fn (plot_control &Plot) plot_find_sample(cnv_x f64, cnv_y f64) (int, int, int) {
	mut ds_index := int(0)
	mut sample_index := int(0)
	return C.IupPlotFindSample(plot_control, cnv_x, cnv_y, &ds_index, &sample_index), ds_index, sample_index
}

// plot_find_segment returns the nearest segment of the nearest dataset within a tolerance neighborhood. Tolerance can be set in SCREENTPlotRANCE attribute. Returns a non zero value is successful, or a zero value if failed. It should be used inside callbacks only. Output variables can be NULL if not used. The datasets are searched in reverse order they are drawn. Y canvas coordinates is in CD bottom to top orientation. Only works when DS_MODE is LINE, MARKLINE, AREA, STEP or ERRORBAR
pub fn (plot_control &Plot) plot_find_segment(cnv_x f64, cnv_y f64) (int, int, int, int) {
	mut ds_index := int(0)
	mut sample_index1 := int(0)
	mut sample_index2 := int(0)
	return C.IupPlotFindSegment(plot_control, cnv_x, cnv_y, &ds_index, &sample_index1,
		&sample_index2), ds_index, sample_index1, sample_index2
}

// plot_paint_to plots to the given CD `canvas` instead of the display canvas. The element does not need to be mapped neither to be inside a dialog for this function to work
pub fn (plot_control &Plot) plot_paint_to(the_canvas voidptr) &Plot {
	C.IupPlotPaintTo(plot_control, the_canvas)
	return plot_control
}

// set_handle is a helper function for `Plot` that calls the global
// `set_handle` function. Returns back an instance of `Plot` for chaining
pub fn (plot_control &Plot) set_handle(name string) &Plot {
	C.IupSetHandle(name.str, &Ihandle(plot_control))
	return plot_control
}

// get_plot_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_plot_handle(handle string) &Plot {
	return &Plot(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Plot` and
// returns `Plot` back for chaining
pub fn (plot_control &Plot) set_attr(name string, value string) &Plot {
	C.IupSetStrAttribute(&Ihandle(plot_control), name.to_upper().trim_space().str, value.trim_space().str)

	return plot_control
}

// set_attrs takes all x=x values and applies them to `Plot` and
// returns `Plot` back for chaining
pub fn (plot_control &Plot) set_attrs(attrs ...string) &Plot {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		plot_control.set_attr(split[0], split[1])
	}

	return plot_control
}

// set_data associates the provided `data` with `Plot` and
// returns `Plot` back for chaining
pub fn (plot_control &Plot) set_data(name string, data voidptr) &Plot {
	C.IupSetAttribute(&Ihandle(plot_control), '${name}_data'.to_upper().trim_space().str,
		charptr(data))

	return plot_control
}

// unset_attr clears the provided attribute
pub fn (plot_control &Plot) unset_attr(name string) &Plot {
	C.IupSetAttribute(&Ihandle(plot_control), name.to_upper().trim_space().str, C.NULL)
	return plot_control
}

// plot_set_formula creates a new dataset and generate samples using the `formula` (since 3.13). The `formula` is executed for each sample within the dataset. Internally uses Lua to parse the formula. `init` is an optional Lua initialization code that is called only once (can be NULL). The callback "int FORMULAINIT_CB(Ihandle* ih, lua_State *L);" can also be used to initialize the Lua state. All Lua standard libraries are pre-loaded.
// This function is available in the "iupluaplot" library but it does not requires an active Lua context, because it uses a temporary Lua context. If called from Lua it will also be independent from the application's Lua context. To use it in C/C++ you must link also with Lua and iuplua even when not using theses libraries directly.
// The formula will be encapsulated within an internal Lua function so it will not affect the call of subsequent samples. This internal function receives two parameters "sample_index" and "x" correspondent to the current sample being processed during script execution. "y" will be calculated by the formula. The formula can contain only one valid Lua statement that will be retuned by the internal Lua function. The formula can evaluate to numbers only. The x parameter will vary from FORMULA_MIN and FORMULA_MAX attributes those default values are 0.0 and 1.0. The interval will be divided in `sample_count`-1 steps.
// If the attribute FORMULA_PARAMETRIC is set to Yes, then the second attribute is replaced by "t". The interval and the steps are the same BUT the formula must then return 2 numeric parameters: "x, y".
// The most commonly used tokens are:
// +  (addition)
// -  (subtraction and negation)
// *  (multiplication)
// /  (division)
// %  (modulo)
// ^  (exponentiation)
// == (equal)
// ~= (different)
// <  (less than)
// >  (greater than)
// <= (less than or equal)
// >= (greater than or equal)
// and (logical and)
// or  (logical or)
// not (logical not)
// The Lua Math Functions are loaded also at the global level, so there is no need for the "math." prefix. The most commonly used functions are:
//
// abs(x)    acos(x)    asin(x)    atan(x)    atan2(y,x)    ceil(x)    cos(x)
// deg(x)    exp(x)     floor(x)   log(x)     min(x,...)    max(x,...) pow(x,y)
// sin(x)    sqrt(x)    tan(x)
// Some formula examples:
//
// "cos(pi*x)"
// "x^2"
// "cos(t), sin(t)"
/*
pub fn (plot_control &Plot)plot_set_formula(sample_count int, formula string, init charptr) &Plot{
	C.IupPlotSetFormula(plot_control,sample_count,formula.str,init)
	return plot_control
}
*/
