module scintilla

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

pub type IFn = fn (&Scintilla) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Scintilla, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Scintilla, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Scintilla, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Scintilla, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Scintilla, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Scintilla, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Scintilla, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Scintilla, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Scintilla, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Scintilla, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Scintilla, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Scintilla, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Scintilla, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Scintilla, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Scintilla, &Scintilla, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Scintilla, &Scintilla) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Scintilla, &Scintilla, &Scintilla) FuncResult // tabchange_cb

pub type IFnss = fn (&Scintilla, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Scintilla, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Scintilla, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Scintilla, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Scintilla, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Scintilla, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Scintilla, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Scintilla, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Scintilla, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Scintilla, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Scintilla, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Scintilla, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Scintilla, int, int, &Scintilla, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Scintilla, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Scintilla, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Scintilla, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Scintilla, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Scintilla, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Scintilla, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Scintilla, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Scintilla, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Scintilla, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Scintilla, &Scintilla, int) FuncResult

pub type SIFnii = fn (&Scintilla, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Scintilla, int) charptr // cell_cb

pub type SIFniis = fn (&Scintilla, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Scintilla, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Scintilla, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Scintilla, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Scintilla, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Scintilla, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Scintilla, voidptr) FuncResult

pub fn (scintilla_control &Scintilla) set_callback(name string, func voidptr) &Scintilla {
	C.IupSetCallback(scintilla_control, name.str, func)
	return scintilla_control
}

// ==============Scintilla==============

// on_text_edit generated when the text is edited, but before its value is actually changed. Can be generated when using the keyboard, undo/redo system or from the clipboard
pub fn (scintilla_control &Scintilla) on_text_edit(func IFniiis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'ACTION_CB', func)
	return scintilla_control
}

// on_auto_cselection generated when the user has selected an item in an auto-completion list. It is sent before the selection is inserted. Automatic insertion can be cancelled by setting the AUTOCCANCEL attribute before returning from the callback
pub fn (scintilla_control &Scintilla) on_auto_cselection(func IFnis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'AUTOCSELECTION_CB', func)
	return scintilla_control
}

// on_auto_ccancelled called after the user has cancelled an auto-completion list
pub fn (scintilla_control &Scintilla) on_auto_ccancelled(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'AUTOCCANCELLED_CB', func)
	return scintilla_control
}

// on_auto_cchar_deleted called after the user deleted a character while auto-completion list was active
pub fn (scintilla_control &Scintilla) on_auto_cchar_deleted(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'AUTOCCHARDELETED_CB', func)
	return scintilla_control
}

// on_button generated when any mouse button is pressed or released. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
pub fn (scintilla_control &Scintilla) on_button(func IFniiiis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'BUTTON_CB', func)
	return scintilla_control
}

// on_caret generated when the caret/cursor position is changed
pub fn (scintilla_control &Scintilla) on_caret(func IFniii) &Scintilla {
	C.IupSetCallback(scintilla_control, c'CARET_CB', func)
	return scintilla_control
}

// on_insert_check generated before some text is inserted. Inside the callback the attribute CHANGEINSERT can be set to change the inserted text
pub fn (scintilla_control &Scintilla) on_insert_check(func IFniis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'INSERTCHECK_CB', func)
	return scintilla_control
}

// on_drop_files generated when one or more files are dropped in the element
pub fn (scintilla_control &Scintilla) on_drop_files(func IFnsiii) &Scintilla {
	C.IupSetCallback(scintilla_control, c'DROPFILES_CB', func)
	return scintilla_control
}

// on_dwell generated when the user keeps the mouse in one position for the dwell period defined in MOUSEDWELLTIME
pub fn (scintilla_control &Scintilla) on_dwell(func IFniiii) &Scintilla {
	C.IupSetCallback(scintilla_control, c'DWELL_CB', func)
	return scintilla_control
}

// on_hotspot_click generated when the user clicks or double clicks on text that is in a style with the hotspot attribute set
pub fn (scintilla_control &Scintilla) on_hotspot_click(func IFniiis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'HOTSPOTCLICK_CB', func)
	return scintilla_control
}

// on_lines_changed called after the number of lines was interactively changed by the user
pub fn (scintilla_control &Scintilla) on_lines_changed(func IFnii) &Scintilla {
	C.IupSetCallback(scintilla_control, c'LINESCHANGED_CB', func)
	return scintilla_control
}

// on_margin_click generated when the mouse button is clicked inside a margin that is marked as sensitive
pub fn (scintilla_control &Scintilla) on_margin_click(func IFniis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'MARGINCLICK_CB', func)
	return scintilla_control
}

// on_motion generated when the mouse is moved. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
pub fn (scintilla_control &Scintilla) on_motion(func IFniis) &Scintilla {
	C.IupSetCallback(scintilla_control, c'MOTION_CB', func)
	return scintilla_control
}

// on_save_point notifies the application that a save point was reached (1) or left (0). Can be used to control whether to display a saved or modified document. To set the save point use the SAVEPOINT attribute
pub fn (scintilla_control &Scintilla) on_save_point(func IFni) &Scintilla {
	C.IupSetCallback(scintilla_control, c'SAVEPOINT_CB', func)
	return scintilla_control
}

// on_update_content called when contents, styling or markers have been changed
pub fn (scintilla_control &Scintilla) on_update_content(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'UPDATECONTENT_CB', func)
	return scintilla_control
}

// on_update_selection called when selection has been changed
pub fn (scintilla_control &Scintilla) on_update_selection(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'UPDATESELECTION_CB', func)
	return scintilla_control
}

// on_update_hscroll called when the document was scrolled horizontally
pub fn (scintilla_control &Scintilla) on_update_hscroll(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'UPDATEHSCROLL_CB', func)
	return scintilla_control
}

// on_update_vscroll called when the document was scrolled vertically
pub fn (scintilla_control &Scintilla) on_update_vscroll(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'UPDATEVSCROLL_CB', func)
	return scintilla_control
}

// on_value_changed called after the value was interactively changed by the user
pub fn (scintilla_control &Scintilla) on_value_changed(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'VALUECHANGED_CB', func)
	return scintilla_control
}

// on_zoom notifies the application when the user zooms the display using the keyboard or the ZOOM attribute. Can be used to recalculate positions, such as the width of the line number margin to maintain sizes in terms of characters rather than pixels
pub fn (scintilla_control &Scintilla) on_zoom(func IFni) &Scintilla {
	C.IupSetCallback(scintilla_control, c'ZOOM_CB', func)
	return scintilla_control
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (scintilla_control &Scintilla) on_map(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'MAP_CB', func)
	return scintilla_control
}

// on_unmap called right before an element is unmapped
pub fn (scintilla_control &Scintilla) on_unmap(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'UNMAP_CB', func)
	return scintilla_control
}

// on_destroy called right before an element is destroyed
pub fn (scintilla_control &Scintilla) on_destroy(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'DESTROY_CB', func)
	return scintilla_control
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (scintilla_control &Scintilla) on_focused(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'GETFOCUS_CB', func)
	return scintilla_control
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (scintilla_control &Scintilla) on_unfocused(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'KILLFOCUS_CB', func)
	return scintilla_control
}

// on_entered action generated when the mouse enters the native element
pub fn (scintilla_control &Scintilla) on_entered(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'ENTERWINDOW_CB', func)
	return scintilla_control
}

// on_exited action generated when the mouse leaves the native element
pub fn (scintilla_control &Scintilla) on_exited(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'LEAVEWINDOW_CB', func)
	return scintilla_control
}

// on_key action generated when a keyboard event occurs
pub fn (scintilla_control &Scintilla) on_key(func IFni) &Scintilla {
	C.IupSetCallback(scintilla_control, c'K_ANY', func)
	return scintilla_control
}

// on_help action generated when the user press F1 at a scintilla. In Motif is also activated by the Help button in some workstations keyboard
pub fn (scintilla_control &Scintilla) on_help(func IFn) &Scintilla {
	C.IupSetCallback(scintilla_control, c'HELP_CB', func)
	return scintilla_control
}
