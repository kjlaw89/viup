module ole

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

pub type IFn = fn (&OLE) FuncResult // default definition, same as Icallback

pub type IFni = fn (&OLE, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&OLE, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&OLE, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&OLE, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&OLE, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&OLE, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&OLE, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&OLE, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&OLE, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&OLE, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&OLE, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&OLE, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&OLE, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&OLE, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&OLE, &OLE, int, int) FuncResult // drop_cb

pub type IFnn = fn (&OLE, &OLE) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&OLE, &OLE, &OLE) FuncResult // tabchange_cb

pub type IFnss = fn (&OLE, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&OLE, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&OLE, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&OLE, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&OLE, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&OLE, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&OLE, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&OLE, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&OLE, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&OLE, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&OLE, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&OLE, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&OLE, int, int, &OLE, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&OLE, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&OLE, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&OLE, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&OLE, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&OLE, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&OLE, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&OLE, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&OLE, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&OLE, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&OLE, &OLE, int) FuncResult

pub type SIFnii = fn (&OLE, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&OLE, int) charptr // cell_cb

pub type SIFniis = fn (&OLE, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&OLE, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&OLE, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&OLE, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&OLE, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&OLE, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&OLE, voidptr) FuncResult

pub fn (ole &OLE) set_callback(name string, func voidptr) &OLE {
	C.IupSetCallback(ole, name.str, func)
	return ole
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (ole &OLE) on_map(func IFn) &OLE {
	C.IupSetCallback(ole, c'MAP_CB', func)
	return ole
}

// on_unmap called right before an element is unmapped
pub fn (ole &OLE) on_unmap(func IFn) &OLE {
	C.IupSetCallback(ole, c'UNMAP_CB', func)
	return ole
}

// on_destroy called right before an element is destroyed
pub fn (ole &OLE) on_destroy(func IFn) &OLE {
	C.IupSetCallback(ole, c'DESTROY_CB', func)
	return ole
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (ole &OLE) on_focused(func IFn) &OLE {
	C.IupSetCallback(ole, c'GETFOCUS_CB', func)
	return ole
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (ole &OLE) on_unfocused(func IFn) &OLE {
	C.IupSetCallback(ole, c'KILLFOCUS_CB', func)
	return ole
}

// on_entered action generated when the mouse enters the native element
pub fn (ole &OLE) on_entered(func IFn) &OLE {
	C.IupSetCallback(ole, c'ENTERWINDOW_CB', func)
	return ole
}

// on_exited action generated when the mouse leaves the native element
pub fn (ole &OLE) on_exited(func IFn) &OLE {
	C.IupSetCallback(ole, c'LEAVEWINDOW_CB', func)
	return ole
}