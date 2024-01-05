module canvas

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

pub type IFn = fn (&Canvas) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Canvas, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Canvas, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Canvas, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Canvas, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Canvas, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Canvas, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Canvas, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Canvas, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Canvas, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Canvas, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Canvas, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Canvas, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Canvas, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Canvas, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Canvas, &Canvas, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Canvas, &Canvas) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Canvas, &Canvas, &Canvas) FuncResult // tabchange_cb

pub type IFnss = fn (&Canvas, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Canvas, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Canvas, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Canvas, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Canvas, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Canvas, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Canvas, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Canvas, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Canvas, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Canvas, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Canvas, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Canvas, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Canvas, int, int, &Canvas, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Canvas, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Canvas, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Canvas, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Canvas, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Canvas, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Canvas, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Canvas, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Canvas, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Canvas, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Canvas, &Canvas, int) FuncResult

pub type SIFnii = fn (&Canvas, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Canvas, int) charptr // cell_cb

pub type SIFniis = fn (&Canvas, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Canvas, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Canvas, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Canvas, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Canvas, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Canvas, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Canvas, voidptr) FuncResult

pub fn (canvas_control &Canvas) set_callback(name string, func voidptr) &Canvas {
	C.IupSetCallback(canvas_control, name.str, func)
	return canvas_control
}

// on_redraw generated when the canvas needs to be redrawn
pub fn (canvas_control &Canvas) on_redraw(func IFnff) &Canvas {
	C.IupSetCallback(canvas_control, c'ACTION', func)
	return canvas_control
}

// on_button generated when any mouse button is pressed or released
pub fn (canvas_control &Canvas) on_button(func IFniiiis) &Canvas {
	C.IupSetCallback(canvas_control, c'BUTTON_CB', func)
	return canvas_control
}

// on_drop_files [Windows and GTK Only]: generated when one or more files are dropped in the element
pub fn (canvas_control &Canvas) on_drop_files(func IFnsiii) &Canvas {
	C.IupSetCallback(canvas_control, c'DROPFILES_CB', func)
	return canvas_control
}

// on_focus when the canvas gets or looses the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (canvas_control &Canvas) on_focus(func IFni) &Canvas {
	C.IupSetCallback(canvas_control, c'FOCUS_CB', func)
	return canvas_control
}

// on_motion generated when the mouse is moved
pub fn (canvas_control &Canvas) on_motion(func IFniis) &Canvas {
	C.IupSetCallback(canvas_control, c'MOTION_CB', func)
	return canvas_control
}

// on_key_press generated when a key is pressed or released. It is called after the common callback K_ANY
// When the canvas has the focus, pressing the arrow keys may change the focus to another cavas in some systems. If your callback process the arrow keys, we recommend you to return IUP_IGNORE so it will not lose its focus
pub fn (canvas_control &Canvas) on_key_press(func IFnii) &Canvas {
	C.IupSetCallback(canvas_control, c'KEYPRESS_CB', func)
	return canvas_control
}

// on_resize generated when the canvas size is changed
pub fn (canvas_control &Canvas) on_resize(func IFnii) &Canvas {
	C.IupSetCallback(canvas_control, c'RESIZE_CB', func)
	return canvas_control
}

// on_scroll when the scrollbar is manipulated. (GTK 2.8) Also the POSX and POSY values will not be correctly updated for older GTK versions
pub fn (canvas_control &Canvas) on_scroll(func IFniff) &Canvas {
	C.IupSetCallback(canvas_control, c'SCROLL_CB', func)
	return canvas_control
}

// on_touch [Windows 7 Only]: Action generated when a touch event occurred. Multiple touch events will trigger several calls. Must set TOUCH=Yes to receive this event
pub fn (canvas_control &Canvas) on_touch(func IFniiis) &Canvas {
	C.IupSetCallback(canvas_control, c'TOUCH_CB', func)
	return canvas_control
}

// on_multi_touch [Windows 7 Only]: Action generated when multiple touch events occurred. Must set TOUCH=Yes to receive this event
pub fn (canvas_control &Canvas) on_multi_touch(func IFniIIII) &Canvas {
	C.IupSetCallback(canvas_control, c'MULTITOUCH_CB', func)
	return canvas_control
}

// on_wheel generated when the mouse wheel is rotated
pub fn (canvas_control &Canvas) on_wheel(func IFnfiis) &Canvas {
	C.IupSetCallback(canvas_control, c'WHEEL_CB', func)
	return canvas_control
}

// on_wom [Windows Only]: Action generated when an audio device receives an event
pub fn (canvas_control &Canvas) on_wom(func IFni) &Canvas {
	C.IupSetCallback(canvas_control, c'WOM_CB', func)
	return canvas_control
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (canvas_control &Canvas) on_map(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'MAP_CB', func)
	return canvas_control
}

// on_unmap called right before an element is unmapped
pub fn (canvas_control &Canvas) on_unmap(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'UNMAP_CB', func)
	return canvas_control
}

// on_destroy called right before an element is destroyed
pub fn (canvas_control &Canvas) on_destroy(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'DESTROY_CB', func)
	return canvas_control
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (canvas_control &Canvas) on_focused(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'GETFOCUS_CB', func)
	return canvas_control
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (canvas_control &Canvas) on_unfocused(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'KILLFOCUS_CB', func)
	return canvas_control
}

// on_entered action generated when the mouse enters the native element
pub fn (canvas_control &Canvas) on_entered(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'ENTERWINDOW_CB', func)
	return canvas_control
}

// on_exited action generated when the mouse leaves the native element
pub fn (canvas_control &Canvas) on_exited(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'LEAVEWINDOW_CB', func)
	return canvas_control
}

// on_key action generated when a keyboard event occurs
pub fn (canvas_control &Canvas) on_key(func IFni) &Canvas {
	C.IupSetCallback(canvas_control, c'K_ANY', func)
	return canvas_control
}

// on_help action generated when the user press F1 at a canvas. In Motif is also activated by the Help button in some workstations keyboard
pub fn (canvas_control &Canvas) on_help(func IFn) &Canvas {
	C.IupSetCallback(canvas_control, c'HELP_CB', func)
	return canvas_control
}
