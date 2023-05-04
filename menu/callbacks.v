module menu

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

pub type IFn = fn (&Menu) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Menu, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Menu, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Menu, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Menu, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Menu, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Menu, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Menu, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Menu, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Menu, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Menu, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Menu, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Menu, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Menu, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Menu, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Menu, &Menu, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Menu, &Menu) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Menu, &Menu, &Menu) FuncResult // tabchange_cb

pub type IFnss = fn (&Menu, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Menu, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Menu, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Menu, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Menu, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Menu, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Menu, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Menu, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Menu, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Menu, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Menu, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Menu, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Menu, int, int, &Menu, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Menu, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Menu, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Menu, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Menu, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Menu, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Menu, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Menu, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Menu, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Menu, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Menu, &Menu, int) FuncResult

pub type SIFnii = fn (&Menu, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Menu, int) charptr // cell_cb

pub type SIFniis = fn (&Menu, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Menu, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Menu, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Menu, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Menu, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Menu, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Menu, voidptr) FuncResult

pub fn (menu &Menu) set_callback(name string, func voidptr) &Menu {
	C.IupSetCallback(menu, name.str, func)
	return menu
}

// =====================Item=====================
// on_selected generated when the item is selected. IUP_CLOSE will be processed. Even if inside a popup menu when IUP_CLOSE is returned, the current popup dialog or the main loop will be closed
pub fn (menu &Menu) on_selected(func IFn) &Menu {
	C.IupSetCallback(menu, c'ACTION', func)
	return menu
}

// on_highlight generated when the item is highlighted
pub fn (menu &Menu) on_highlight(func IFn) &Menu {
	C.IupSetCallback(menu, c'HIGHLIGHT_CB', func)
	return menu
}

// =====================Menu=====================
// on_menu_open called just before the menu is opened
pub fn (menu &Menu) on_menu_open(func IFn) &Menu {
	C.IupSetCallback(menu, c'OPEN_CB', func)
	return menu
}

// on_menu_close called just after the menu is closed
pub fn (menu &Menu) on_menu_close(func IFn) &Menu {
	C.IupSetCallback(menu, c'MENUCLOSE_CB', func)
	return menu
}

// =====================Submenu=====================
// HIGHLIGHT_CB: Action generated when the submenu is highlighted
pub fn (menu &Menu) on_action(func IFnff) &Menu {
	C.IupSetCallback(menu, c'ACTION', func)
	return menu
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (menu &Menu) on_map(func IFn) &Menu {
	C.IupSetCallback(menu, c'MAP_CB', func)
	return menu
}

// on_unmap called right before an element is unmapped
pub fn (menu &Menu) on_unmap(func IFn) &Menu {
	C.IupSetCallback(menu, c'UNMAP_CB', func)
	return menu
}

// on_destroy called right before an element is destroyed
pub fn (menu &Menu) on_destroy(func IFn) &Menu {
	C.IupSetCallback(menu, c'DESTROY_CB', func)
	return menu
}
