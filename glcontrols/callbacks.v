module gl_controls

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

pub type IFn = fn (&GL_Controls) FuncResult // default definition, same as Icallback

pub type IFni = fn (&GL_Controls, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&GL_Controls, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&GL_Controls, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&GL_Controls, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&GL_Controls, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&GL_Controls, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&GL_Controls, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&GL_Controls, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&GL_Controls, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&GL_Controls, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&GL_Controls, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&GL_Controls, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&GL_Controls, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&GL_Controls, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&GL_Controls, &GL_Controls, int, int) FuncResult // drop_cb

pub type IFnn = fn (&GL_Controls, &GL_Controls) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&GL_Controls, &GL_Controls, &GL_Controls) FuncResult // tabchange_cb

pub type IFnss = fn (&GL_Controls, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&GL_Controls, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&GL_Controls, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&GL_Controls, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&GL_Controls, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&GL_Controls, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&GL_Controls, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&GL_Controls, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&GL_Controls, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&GL_Controls, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&GL_Controls, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&GL_Controls, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&GL_Controls, int, int, &GL_Controls, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&GL_Controls, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&GL_Controls, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&GL_Controls, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&GL_Controls, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&GL_Controls, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&GL_Controls, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&GL_Controls, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&GL_Controls, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&GL_Controls, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&GL_Controls, &GL_Controls, int) FuncResult

pub type SIFnii = fn (&GL_Controls, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&GL_Controls, int) charptr // cell_cb

pub type SIFniis = fn (&GL_Controls, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&GL_Controls, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&GL_Controls, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&GL_Controls, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&GL_Controls, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&GL_Controls, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&GL_Controls, voidptr) FuncResult

pub fn (gl_control &GL_Controls) set_callback(name string, func voidptr) &GL_Controls {
	C.IupSetCallback(gl_control, name.str, func)
	return gl_control
}

// on_redraw generated when the canvas needs to be redrawn
pub fn (gl_control &GL_Controls) on_redraw(func IFnff) &GL_Controls {
	C.IupSetCallback(gl_control, c'ACTION', func)
	return gl_control
}

// on_action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
pub fn (gl_control &GL_Controls) on_action(func IFnff) &GL_Controls {
	C.IupSetCallback(gl_control, c'ACTION', func)
	return gl_control
}

// on_button generated when any mouse button is pressed or released
pub fn (gl_control &GL_Controls) on_button(func IFniiiis) &GL_Controls {
	C.IupSetCallback(gl_control, c'BUTTON_CB', func)
	return gl_control
}

// on_drop_files [Windows and GTK Only]: generated when one or more files are dropped in the element
pub fn (gl_control &GL_Controls) on_drop_files(func IFnsiii) &GL_Controls {
	C.IupSetCallback(gl_control, c'DROPFILES_CB', func)
	return gl_control
}

// on_focus when the canvas gets or looses the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (gl_control &GL_Controls) on_focus(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'FOCUS_CB', func)
	return gl_control
}

// on_motion generated when the mouse is moved
pub fn (gl_control &GL_Controls) on_motion(func IFniis) &GL_Controls {
	C.IupSetCallback(gl_control, c'MOTION_CB', func)
	return gl_control
}

// on_key_press generated when a key is pressed or released. It is called after the common callback K_ANY
// When the canvas has the focus, pressing the arrow keys may change the focus to another gl_control in some systems. If your callback process the arrow keys, we recommend you to return IUP_IGNORE so it will not lose its focus
pub fn (gl_control &GL_Controls) on_key_press(func IFnii) &GL_Controls {
	C.IupSetCallback(gl_control, c'KEYPRESS_CB', func)
	return gl_control
}

// on_resize generated when the canvas size is changed
pub fn (gl_control &GL_Controls) on_resize(func IFnii) &GL_Controls {
	C.IupSetCallback(gl_control, c'RESIZE_CB', func)
	return gl_control
}

// on_scroll when the scrollbar is manipulated. (GTK 2.8) Also the POSX and POSY values will not be correctly updated for older GTK versions
pub fn (gl_control &GL_Controls) on_scroll(func IFniff) &GL_Controls {
	C.IupSetCallback(gl_control, c'SCROLL_CB', func)
	return gl_control
}

// on_touch [Windows 7 Only]: Action generated when a touch event occurred. Multiple touch events will trigger several calls. Must set TOUCH=Yes to receive this event
pub fn (gl_control &GL_Controls) on_touch(func IFniiis) &GL_Controls {
	C.IupSetCallback(gl_control, c'TOUCH_CB', func)
	return gl_control
}

// on_multi_touch [Windows 7 Only]: Action generated when multiple touch events occurred. Must set TOUCH=Yes to receive this event
pub fn (gl_control &GL_Controls) on_multi_touch(func IFniIIII) &GL_Controls {
	C.IupSetCallback(gl_control, c'MULTITOUCH_CB', func)
	return gl_control
}

// on_wheel generated when the mouse wheel is rotated
pub fn (gl_control &GL_Controls) on_wheel(func IFnfiis) &GL_Controls {
	C.IupSetCallback(gl_control, c'WHEEL_CB', func)
	return gl_control
}

// on_wom [Windows Only]: Action generated when an audio device receives an event
pub fn (gl_control &GL_Controls) on_wom(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'WOM_CB', func)
	return gl_control
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (gl_control &GL_Controls) on_map(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'MAP_CB', func)
	return gl_control
}

// on_unmap called right before an element is unmapped
pub fn (gl_control &GL_Controls) on_unmap(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'UNMAP_CB', func)
	return gl_control
}

// on_destroy called right before an element is destroyed
pub fn (gl_control &GL_Controls) on_destroy(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'DESTROY_CB', func)
	return gl_control
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (gl_control &GL_Controls) on_focused(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'GETFOCUS_CB', func)
	return gl_control
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (gl_control &GL_Controls) on_unfocused(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'KILLFOCUS_CB', func)
	return gl_control
}

// on_entered action generated when the mouse enters the native element
pub fn (gl_control &GL_Controls) on_entered(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'ENTERWINDOW_CB', func)
	return gl_control
}

// on_exited action generated when the mouse leaves the native element
pub fn (gl_control &GL_Controls) on_exited(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'LEAVEWINDOW_CB', func)
	return gl_control
}

// on_key action generated when a keyboard event occurs
pub fn (gl_control &GL_Controls) on_key(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'K_ANY', func)
	return gl_control
}

// on_help action generated when the user press F1 at a gl_control. In Motif is also activated by the Help button in some workstations keyboard
pub fn (gl_control &GL_Controls) on_help(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'HELP_CB', func)
	return gl_control
}

// on_swap_buffers generated when IupGLSwapBuffers is called
pub fn (gl_control &GL_Controls) on_swap_buffers(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'SWAPBUFFERS_CB', func)
	return gl_control
}

// =====================GLSubCanvas=====================
// on_gl_redraw generated when the sub-canvas needs to be redrawn. The transformation matrix is already set to the subcanvas rectangular region. Also, do not call IupGLMakeCurrent nor IupGLSwapBuffers, the IupCanvasBox management will take care of that
pub fn (gl_control &GL_Controls) on_gl_redraw(func IFnff) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_ACTION', func)
	return gl_control
}

// on_gl_button generated when any mouse button is pressed or released. Same parameters as BUTTON_CB. If IUP_CONTINUE is returned the application callback is called even the user clicked on the sub-canvas
pub fn (gl_control &GL_Controls) on_gl_button(func IFniiiis) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_BUTTON_CB', func)
	return gl_control
}

// on_gl_entered generated when the mouse enters the element. Same parameters as ENTERWINDOW_CB
pub fn (gl_control &GL_Controls) on_gl_entered(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_ENTERWINDOW_CB', func)
	return gl_control
}

// on_gl_exited generated when the mouse leaves the element. Same parameters as LEAVEWINDOW_CB
pub fn (gl_control &GL_Controls) on_gl_exited(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_LEAVEWINDOW_CB', func)
	return gl_control
}

// on_gl_motion generated when the mouse is moved. Same parameters as MOTION_CB.  If IUP_CONTINUE is returned the application callback is called even the user moved the cursor on the sub-canvas
pub fn (gl_control &GL_Controls) on_gl_motion(func IFniis) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_MOTION_CB', func)
	return gl_control
}

// on_gl_wheel generated when the mouse wheel is rotated. Same parameters as WHEEL_CB.  If IUP_CONTINUE is returned the application callback is called even the user clicked on the sub-canvas
pub fn (gl_control &GL_Controls) on_gl_wheel(func IFnfiis) &GL_Controls {
	C.IupSetCallback(gl_control, c'GL_WHEEL_CB', func)
	return gl_control
}

// =====================GLButton=====================
// ACTION: Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area

// =====================GLExpander=====================
// ACTION: Action generated after the expander state is interactively changed.

// on_move called after the frame was moved on the IupGLCanvasBox, when MOVEABLE=Yes. The coordinates are the same as the POSITION attribute
pub fn (gl_control &GL_Controls) on_move(func IFnii) &GL_Controls {
	C.IupSetCallback(gl_control, c'MOVE_CB', func)
	return gl_control
}

// on_open_close generated before the expander state is interactively changed
pub fn (gl_control &GL_Controls) on_open_close(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'OPENCLOSE_CB', func)
	return gl_control
}

// on_extra_button generated when any mouse button is pressed and released
pub fn (gl_control &GL_Controls) on_extra_button(func IFnii) &GL_Controls {
	C.IupSetCallback(gl_control, c'EXTRABUTTON_CB', func)
	return gl_control
}

// =====================GLFrame=====================
// MOVE_CB: Called after the frame was moved on the IupGLCanvasBox, when MOVEABLE=Yes. The coordinates are the same as the POSITION attribute

// =====================GLLink=====================
// on_link generated when the link is activated
pub fn (gl_control &GL_Controls) on_link(func IFns) &GL_Controls {
	C.IupSetCallback(gl_control, c'ACTION_CB', func)
	return gl_control
}

// =====================GLText=====================
// on_value_changed called after the value was interactively changed by the user
pub fn (gl_control &GL_Controls) on_value_changed(func IFn) &GL_Controls {
	C.IupSetCallback(gl_control, c'VALUECHANGED_CB', func)
	return gl_control
}

// =====================GLToggle=====================
// on_toggle generated when the toggle's state (on/off) was changed. The callback also receives the toggle's state
pub fn (gl_control &GL_Controls) on_toggle(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'ACTION_CB', func)
	return gl_control
}

// VALUECHANGED_CB: Called after the value was interactively changed by the user. Called after the ACTION callback, but under the same context

// =====================GLVal=====================
// VALUECHANGED_CB: Called after the value was interactively changed by the user
// on_value_changing called when the value starts or ends to be interactively changed by the user
pub fn (gl_control &GL_Controls) on_value_changing(func IFni) &GL_Controls {
	C.IupSetCallback(gl_control, c'VALUECHANGING_CB', func)
	return gl_control
}
