module plot

import viup { FuncResult }

fn C.IupSetCallback(voidptr, charptr, voidptr)

pub type IFidle = fn () FuncResult // idle

pub type IFentry = fn () // entry

pub type IFi = fn (int) // globalentermodal_cb, globalleavemodal_cb

pub type IFs = fn (charptr) // openurl_cb

pub type IFii = fn (int, int) // globalkeypress_cb

pub type IFiis = fn (int, int) // globalmotion_cb, openfiles_cb

pub type IFiiiis = fn (int, int, int, int, charptr) // globalbutton_cb

pub type IFfiis = fn (f32, int, int, charptr) // globalwheel_cb

pub type IFvs = fn (voidptr, charptr) // handleadd_cb, handleremove_cb, imagecreate_cb, imagedestroy_cb

pub type IFn = fn (&Plot) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Plot, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Plot, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Plot, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Plot, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Plot, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Plot, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Plot, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Plot, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Plot, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Plot, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Plot, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Plot, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Plot, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Plot, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Plot, &Plot, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Plot, &Plot) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Plot, &Plot, &Plot) FuncResult // tabchange_cb

pub type IFnss = fn (&Plot, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Plot, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Plot, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Plot, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Plot, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Plot, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Plot, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Plot, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Plot, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Plot, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Plot, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Plot, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Plot, int, int, &Plot, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Plot, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Plot, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Plot, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Plot, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Plot, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Plot, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Plot, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Plot, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Plot, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Plot, &Plot, int) FuncResult

pub type SIFnii = fn (&Plot, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Plot, int) charptr // cell_cb

pub type SIFniis = fn (&Plot, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Plot, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Plot, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Plot, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Plot, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Plot, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Plot, voidptr) FuncResult

pub fn (plot &Plot) set_callback(name string, func voidptr) &Plot {
	C.IupSetCallback(plot, name.str, func)
	return plot
}

// https://iup.sourceforge.net/en/ctrl/iup_plot.html
// ==============Plot==============

// on_click_sample action generated when a sample is clicked. Called when the mouse button is released, with no Ctrl key and IUP_BUTTON3 only when Shift is pressed, to avoid conflict with zoom and context menu situations. The sample is searched using IupPlotFindSample
pub fn (plot &Plot) on_click_sample(func IFniiddi) &Plot {
	C.IupSetCallback(plot, c'CLICKSAMPLE_CB', func)
	return plot
}

// on_click_segment action generated when a segment is clicked. The segment is identified by the two samples that connects the segment. Called when the mouse button is released, with no Ctrl key and IUP_BUTTON3 only when Shift is pressed, to avoid conflict with zoom and context menu situations. If a sample is clicked this callback is ignored. The segment is searched using IupPlotFindSegment
pub fn (plot &Plot) on_click_segment(func IFniiddddi) &Plot {
	C.IupSetCallback(plot, c'CLICKSEGMENT_CB', func)
	return plot
}

// on_edit_sample action generated when a sample coordinates are changed in the "Data Set Values..." dialog if EDITABLEVALUES=Yes
pub fn (plot &Plot) on_edit_sample(func IFniidd) &Plot {
	C.IupSetCallback(plot, c'EDITSAMPLE_CB', func)
	return plot
}

// on_delete action generated when the Del key is pressed to removed a sample from a dataset. If multiple samples are selected it is called once for each selected sample
pub fn (plot &Plot) on_delete(func IFniidd) &Plot {
	C.IupSetCallback(plot, c'DELETE_CB', func)
	return plot
}

// on_delete_begin actions generated when a delete operation will begin
pub fn (plot &Plot) on_delete_begin(func IFn) &Plot {
	C.IupSetCallback(plot, c'DELETEBEGIN_CB', func)
	return plot
}

// on_delete_end actions generated when a delete operation will end
pub fn (plot &Plot) on_delete_end(func IFn) &Plot {
	C.IupSetCallback(plot, c'DELETEEND_CB', func)
	return plot
}

// on_draw_sample action generated when a sample is drawn. When the plot is redraw, it is called for each sample, then it is called again for all selected samples, and this repeats for each data set, and this repeats for each data set
pub fn (plot &Plot) on_draw_sample(func IFniiddi) &Plot {
	C.IupSetCallback(plot, c'DRAWSAMPLE_CB', func)
	return plot
}

// on_menu_context action generated after the context menu (right click) is created but before it is displayed, so the application can add or removed items from the menu. Called when the mouse button is pressed, with no Ctrl nor Shift keys. Only shown if MENUCONTEXT=Yes
pub fn (plot &Plot) on_menu_context(func IFnnii) &Plot {
	C.IupSetCallback(plot, c'MENUCONTEXT_CB', func)
	return plot
}

// on_menu_context_close same as `MENUCONTEXT_CB`, but called after the context menu is closed. Only shown if MENUCONTEXT=Yes
pub fn (plot &Plot) on_menu_context_close(func IFnnii) &Plot {
	C.IupSetCallback(plot, c'MENUCONTEXTCLOSE_CB', func)
	return plot
}

// on_ds_properties_changed called after the user changed dataset attributes using the "Data Set Properties..." dialog
pub fn (plot &Plot) on_ds_properties_changed(func IFni) &Plot {
	C.IupSetCallback(plot, c'DSPROPERTIESCHANGED_CB', func)
	return plot
}

// on_ds_properties_validate called when the user pressed OK to change dataset attributes using the "Data Set Properties..." dialog. Called only once
pub fn (plot &Plot) on_ds_properties_validate(func IFnni) &Plot {
	C.IupSetCallback(plot, c'DSPROPERTIESVALIDATE_CB', func)
	return plot
}

// on_properties_changed called when the user changed plot attributes using the "Properties..." dialog
pub fn (plot &Plot) on_properties_changed(func IFn) &Plot {
	C.IupSetCallback(plot, c'PROPERTIESCHANGED_CB', func)
	return plot
}

// on_properties_validate called for each attribute in the page, when the user pressed Apply to change plot attributes using the "Properties..." dialog
pub fn (plot &Plot) on_properties_validate(func IFnss) &Plot {
	C.IupSetCallback(plot, c'PROPERTIESVALIDATE_CB', func)
	return plot
}

// on_select action generated when a sample is selected. If multiple samples are selected it is called once for each new selected sample. It is called only if the selection state of the sample is about to be changed
pub fn (plot &Plot) on_select(func IFniiddi) &Plot {
	C.IupSetCallback(plot, c'SELECT_CB', func)
	return plot
}

// on_select_begin actions generated when a selection operation will begin
pub fn (plot &Plot) on_select_begin(func IFn) &Plot {
	C.IupSetCallback(plot, c'SELECTBEGIN_CB', func)
	return plot
}

// on_select_end actions generated when a selection operation will end
pub fn (plot &Plot) on_select_end(func IFn) &Plot {
	C.IupSetCallback(plot, c'SELECTEND_CB', func)
	return plot
}

// on_plot_button similar to BUTTON_CB but coordinates are in plot scale with double precision. It is called before the internal processing, if returns IUP_IGNORE internal processing will not be done
pub fn (plot &Plot) on_plot_button(func IFniidds) &Plot {
	C.IupSetCallback(plot, c'PLOTBUTTON_CB', func)
	return plot
}

// on_plot_motion similar to MOTION_CB but coordinates are in plot scale with double precision. It is called before the internal processing, if returns IUP_IGNORE internal processing will not be done
pub fn (plot &Plot) on_plot_motion(func IFndds) &Plot {
	C.IupSetCallback(plot, c'PLOTMOTION_CB', func)
	return plot
}

// on_xtick_format_number allows to modify the displayed string of a tick number in the X axis. If the callback is not defined the internal function is used
pub fn (plot &Plot) on_xtick_format_number(func IFnssds) &Plot {
	C.IupSetCallback(plot, c'XTICKFORMATNUMBER_CB', func)
	return plot
}

// on_ytick_format_number allows to modify the displayed string of a tick number in the Y axis. If the callback is not defined the internal function is used
pub fn (plot &Plot) on_ytick_format_number(func IFnssds) &Plot {
	C.IupSetCallback(plot, c'YTICKFORMATNUMBER_CB', func)
	return plot
}

// on_pre_draw actions generated before the draw operation. Predraw can be used to draw a different background. Predraw is called after the background is drawn. To position primitives in plot units, use the IupPlotTransform function
pub fn (plot &Plot) on_pre_draw(func IFnv) &Plot {
	C.IupSetCallback(plot, c'PREDRAW_CB', func)
	return plot
}

// on_post_draw actions generated after the draw operation. Postdraw can be used to draw additional information in the plot. Postdraw is clipped to the dataset area. Postdraw is called before the legend and title are drawn (the last drawn elements). To position primitives in plot units, use the IupPlotTransform function
pub fn (plot &Plot) on_post_draw(func IFnv) &Plot {
	C.IupSetCallback(plot, c'POSTDRAW_CB', func)
	return plot
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (plot &Plot) on_map(func IFn) &Plot {
	C.IupSetCallback(plot, c'MAP_CB', func)
	return plot
}

// on_unmap called right before an element is unmapped
pub fn (plot &Plot) on_unmap(func IFn) &Plot {
	C.IupSetCallback(plot, c'UNMAP_CB', func)
	return plot
}

// on_destroy called right before an element is destroyed
pub fn (plot &Plot) on_destroy(func IFn) &Plot {
	C.IupSetCallback(plot, c'DESTROY_CB', func)
	return plot
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (plot &Plot) on_focused(func IFn) &Plot {
	C.IupSetCallback(plot, c'GETFOCUS_CB', func)
	return plot
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (plot &Plot) on_unfocused(func IFn) &Plot {
	C.IupSetCallback(plot, c'KILLFOCUS_CB', func)
	return plot
}

// on_entered action generated when the mouse enters the native element
pub fn (plot &Plot) on_entered(func IFn) &Plot {
	C.IupSetCallback(plot, c'ENTERWINDOW_CB', func)
	return plot
}

// on_exited action generated when the mouse leaves the native element
pub fn (plot &Plot) on_exited(func IFn) &Plot {
	C.IupSetCallback(plot, c'LEAVEWINDOW_CB', func)
	return plot
}

// on_key action generated when a keyboard event occurs
pub fn (plot &Plot) on_key(func IFni) &Plot {
	C.IupSetCallback(plot, c'K_ANY', func)
	return plot
}

// on_help action generated when the user press F1 at a plot. In Motif is also activated by the Help button in some workstations keyboard
pub fn (plot &Plot) on_help(func IFn) &Plot {
	C.IupSetCallback(plot, c'HELP_CB', func)
	return plot
}
