module mgl_plot

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

pub type IFn = fn (&Mgl_Plot) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Mgl_Plot, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Mgl_Plot, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Mgl_Plot, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Mgl_Plot, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Mgl_Plot, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Mgl_Plot, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Mgl_Plot, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Mgl_Plot, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Mgl_Plot, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Mgl_Plot, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Mgl_Plot, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Mgl_Plot, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Mgl_Plot, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Mgl_Plot, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Mgl_Plot, &Mgl_Plot, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Mgl_Plot, &Mgl_Plot) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Mgl_Plot, &Mgl_Plot, &Mgl_Plot) FuncResult // tabchange_cb

pub type IFnss = fn (&Mgl_Plot, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Mgl_Plot, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Mgl_Plot, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Mgl_Plot, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Mgl_Plot, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Mgl_Plot, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Mgl_Plot, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Mgl_Plot, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Mgl_Plot, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Mgl_Plot, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Mgl_Plot, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Mgl_Plot, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Mgl_Plot, int, int, &Mgl_Plot, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Mgl_Plot, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Mgl_Plot, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Mgl_Plot, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Mgl_Plot, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Mgl_Plot, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Mgl_Plot, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Mgl_Plot, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Mgl_Plot, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Mgl_Plot, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Mgl_Plot, &Mgl_Plot, int) FuncResult

pub type SIFnii = fn (&Mgl_Plot, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Mgl_Plot, int) charptr // cell_cb

pub type SIFniis = fn (&Mgl_Plot, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Mgl_Plot, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Mgl_Plot, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Mgl_Plot, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Mgl_Plot, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Mgl_Plot, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Mgl_Plot, voidptr) FuncResult

pub fn (mgl_plot_control &Mgl_Plot) set_callback(name string, func voidptr) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, name.str, func)
	return mgl_plot_control
}

// on_pre_draw generated before the redraw operation. It can be used to draw additional information in the plot. Use only the IupMglPlotDraw* functions. For display output OpenGL primitives can also be used
pub fn (mgl_plot_control &Mgl_Plot) on_pre_draw(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'PREDRAW_CB', func)
	return mgl_plot_control
}

// on_post_draw generated after the redraw operation. It can be used to draw additional information in the plot. Use only the IupMglPlotDraw* functions. For display output OpenGL primitives can also be used
pub fn (mgl_plot_control &Mgl_Plot) on_post_draw(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'POSTDRAW_CB', func)
	return mgl_plot_control
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (mgl_plot_control &Mgl_Plot) on_map(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'MAP_CB', func)
	return mgl_plot_control
}

// on_unmap called right before an element is unmapped
pub fn (mgl_plot_control &Mgl_Plot) on_unmap(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'UNMAP_CB', func)
	return mgl_plot_control
}

// on_destroy called right before an element is destroyed
pub fn (mgl_plot_control &Mgl_Plot) on_destroy(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'DESTROY_CB', func)
	return mgl_plot_control
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (mgl_plot_control &Mgl_Plot) on_focused(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'GETFOCUS_CB', func)
	return mgl_plot_control
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (mgl_plot_control &Mgl_Plot) on_unfocused(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'KILLFOCUS_CB', func)
	return mgl_plot_control
}

// on_entered action generated when the mouse enters the native element
pub fn (mgl_plot_control &Mgl_Plot) on_entered(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'ENTERWINDOW_CB', func)
	return mgl_plot_control
}

// on_exited action generated when the mouse leaves the native element
pub fn (mgl_plot_control &Mgl_Plot) on_exited(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'LEAVEWINDOW_CB', func)
	return mgl_plot_control
}

// on_key action generated when a keyboard event occurs
pub fn (mgl_plot_control &Mgl_Plot) on_key(func IFni) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'K_ANY', func)
	return mgl_plot_control
}

// on_help action generated when the user press F1 at a mgl_plot. In Motif is also activated by the Help button in some workstations keyboard
pub fn (mgl_plot_control &Mgl_Plot) on_help(func IFn) &Mgl_Plot {
	C.IupSetCallback(mgl_plot_control, c'HELP_CB', func)
	return mgl_plot_control
}
