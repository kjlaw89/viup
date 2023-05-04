module tuio

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

pub type IFn = fn (&TUIO) FuncResult // default definition, same as Icallback

pub type IFni = fn (&TUIO, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&TUIO, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&TUIO, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&TUIO, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&TUIO, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&TUIO, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&TUIO, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&TUIO, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&TUIO, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&TUIO, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&TUIO, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&TUIO, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&TUIO, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&TUIO, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&TUIO, &TUIO, int, int) FuncResult // drop_cb

pub type IFnn = fn (&TUIO, &TUIO) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&TUIO, &TUIO, &TUIO) FuncResult // tabchange_cb

pub type IFnss = fn (&TUIO, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&TUIO, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&TUIO, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&TUIO, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&TUIO, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&TUIO, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&TUIO, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&TUIO, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&TUIO, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&TUIO, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&TUIO, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&TUIO, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&TUIO, int, int, &TUIO, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&TUIO, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&TUIO, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&TUIO, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&TUIO, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&TUIO, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&TUIO, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&TUIO, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&TUIO, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&TUIO, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&TUIO, &TUIO, int) FuncResult

pub type SIFnii = fn (&TUIO, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&TUIO, int) charptr // cell_cb

pub type SIFniis = fn (&TUIO, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&TUIO, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&TUIO, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&TUIO, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&TUIO, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&TUIO, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&TUIO, voidptr) FuncResult

pub fn (tuio_client &TUIO) set_callback(name string, func voidptr) &TUIO {
	C.IupSetCallback(tuio_client, name.str, func)
	return tuio_client
}

// ==============TUIO==============

// on_touch generated when a touch event occurred. Multiple touch events will trigger several calls
pub fn (tuio_client &TUIO) on_touch(func IFniiis) &TUIO {
	C.IupSetCallback(tuio_client, c'TOUCH_CB', func)
	return tuio_client
}

// on_multi_touch generated when multiple touch events occurred
pub fn (tuio_client &TUIO) on_multi_touch(func IFniIIII) &TUIO {
	C.IupSetCallback(tuio_client, c'MULTITOUCH_CB', func)
	return tuio_client
}
