module gl

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

pub type IFn = fn (&GL_Canvas) FuncResult // default definition, same as Icallback

pub type IFni = fn (&GL_Canvas, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&GL_Canvas, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&GL_Canvas, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&GL_Canvas, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&GL_Canvas, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&GL_Canvas, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&GL_Canvas, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&GL_Canvas, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&GL_Canvas, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&GL_Canvas, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&GL_Canvas, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&GL_Canvas, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&GL_Canvas, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&GL_Canvas, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&GL_Canvas, &GL_Canvas, int, int) FuncResult // drop_cb

pub type IFnn = fn (&GL_Canvas, &GL_Canvas) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&GL_Canvas, &GL_Canvas, &GL_Canvas) FuncResult // tabchange_cb

pub type IFnss = fn (&GL_Canvas, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&GL_Canvas, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&GL_Canvas, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&GL_Canvas, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&GL_Canvas, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&GL_Canvas, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&GL_Canvas, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&GL_Canvas, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&GL_Canvas, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&GL_Canvas, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&GL_Canvas, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&GL_Canvas, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&GL_Canvas, int, int, &GL_Canvas, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&GL_Canvas, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&GL_Canvas, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&GL_Canvas, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&GL_Canvas, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&GL_Canvas, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&GL_Canvas, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&GL_Canvas, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&GL_Canvas, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&GL_Canvas, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&GL_Canvas, &GL_Canvas, int) FuncResult

pub type SIFnii = fn (&GL_Canvas, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&GL_Canvas, int) charptr // cell_cb

pub type SIFniis = fn (&GL_Canvas, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&GL_Canvas, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&GL_Canvas, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&GL_Canvas, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&GL_Canvas, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&GL_Canvas, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&GL_Canvas, voidptr) FuncResult

pub fn (gl_canvas &GL_Canvas) set_callback(name string, func voidptr) &GL_Canvas {
	C.IupSetCallback(gl_canvas, name.str, func)
	return gl_canvas
}

// on_redraw generated when the canvas needs to be redrawn
pub fn (gl_canvas &GL_Canvas) on_redraw(func IFnff) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'ACTION', func)
	return gl_canvas
}

// on_button generated when any mouse button is pressed or released
pub fn (gl_canvas &GL_Canvas) on_button(func IFniiiis) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'BUTTON_CB', func)
	return gl_canvas
}

// on_drop_files [Windows and GTK Only]: generated when one or more files are dropped in the element
pub fn (gl_canvas &GL_Canvas) on_drop_files(func IFnsiii) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'DROPFILES_CB', func)
	return gl_canvas
}

// on_focus when the canvas gets or looses the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (gl_canvas &GL_Canvas) on_focus(func IFni) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'FOCUS_CB', func)
	return gl_canvas
}

// on_motion generated when the mouse is moved
pub fn (gl_canvas &GL_Canvas) on_motion(func IFniis) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'MOTION_CB', func)
	return gl_canvas
}

// on_key_press generated when a key is pressed or released. It is called after the common callback K_ANY
// When the canvas has the focus, pressing the arrow keys may change the focus to another gl_canvas in some systems. If your callback process the arrow keys, we recommend you to return IUP_IGNORE so it will not lose its focus
pub fn (gl_canvas &GL_Canvas) on_key_press(func IFnii) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'KEYPRESS_CB', func)
	return gl_canvas
}

// on_resize generated when the canvas size is changed
pub fn (gl_canvas &GL_Canvas) on_resize(func IFnii) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'RESIZE_CB', func)
	return gl_canvas
}

// on_scroll when the scrollbar is manipulated. (GTK 2.8) Also the POSX and POSY values will not be correctly updated for older GTK versions
pub fn (gl_canvas &GL_Canvas) on_scroll(func IFniff) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'SCROLL_CB', func)
	return gl_canvas
}

// on_touch [Windows 7 Only]: Action generated when a touch event occurred. Multiple touch events will trigger several calls. Must set TOUCH=Yes to receive this event
pub fn (gl_canvas &GL_Canvas) on_touch(func IFniiis) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'TOUCH_CB', func)
	return gl_canvas
}

// on_multi_touch [Windows 7 Only]: Action generated when multiple touch events occurred. Must set TOUCH=Yes to receive this event
pub fn (gl_canvas &GL_Canvas) on_multi_touch(func IFniIIII) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'MULTITOUCH_CB', func)
	return gl_canvas
}

// on_wheel generated when the mouse wheel is rotated
pub fn (gl_canvas &GL_Canvas) on_wheel(func IFnfiis) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'WHEEL_CB', func)
	return gl_canvas
}

// on_wom [Windows Only]: Action generated when an audio device receives an event
pub fn (gl_canvas &GL_Canvas) on_wom(func IFni) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'WOM_CB', func)
	return gl_canvas
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (gl_canvas &GL_Canvas) on_map(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'MAP_CB', func)
	return gl_canvas
}

// on_unmap called right before an element is unmapped
pub fn (gl_canvas &GL_Canvas) on_unmap(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'UNMAP_CB', func)
	return gl_canvas
}

// on_destroy called right before an element is destroyed
pub fn (gl_canvas &GL_Canvas) on_destroy(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'DESTROY_CB', func)
	return gl_canvas
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (gl_canvas &GL_Canvas) on_focused(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'GETFOCUS_CB', func)
	return gl_canvas
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (gl_canvas &GL_Canvas) on_unfocused(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'KILLFOCUS_CB', func)
	return gl_canvas
}

// on_entered action generated when the mouse enters the native element
pub fn (gl_canvas &GL_Canvas) on_entered(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'ENTERWINDOW_CB', func)
	return gl_canvas
}

// on_exited action generated when the mouse leaves the native element
pub fn (gl_canvas &GL_Canvas) on_exited(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'LEAVEWINDOW_CB', func)
	return gl_canvas
}

// on_key action generated when a keyboard event occurs
pub fn (gl_canvas &GL_Canvas) on_key(func IFni) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'K_ANY', func)
	return gl_canvas
}

// on_help action generated when the user press F1 at a gl_canvas. In Motif is also activated by the Help button in some workstations keyboard
pub fn (gl_canvas &GL_Canvas) on_help(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'HELP_CB', func)
	return gl_canvas
}

// on_swap_buffers generated when IupGLSwapBuffers is called
pub fn (gl_canvas &GL_Canvas) on_swap_buffers(func IFn) &GL_Canvas {
	C.IupSetCallback(gl_canvas, c'SWAPBUFFERS_CB', func)
	return gl_canvas
}
