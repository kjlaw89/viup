module viup

// https://www.tecgraf.puc-rio.br/iup/en/elem

fn C.IupSetCallback(&Ihandle, charptr, voidptr)
fn C.IupGetCallback(&Ihandle, charptr) voidptr
fn C.IupSetFunction(charptr, voidptr)

pub type IFidle = fn () FuncResult // idle

pub type IFentry = fn () // entry

pub type IFi = fn (int) // globalentermodal_cb, globalleavemodal_cb

pub type IFs = fn (charptr) // openurl_cb

pub type IFii = fn (int, int) // globalkeypress_cb

pub type IFiis = fn (int, int) // globalmotion_cb, openfiles_cb

pub type IFiiiis = fn (int, int, int, int, charptr) // globalbutton_cb

pub type IFfiis = fn (f32, int, int, charptr) // globalwheel_cb

pub type IFvs = fn (voidptr, charptr) // handleadd_cb, handleremove_cb, imagecreate_cb, imagedestroy_cb

pub type IFn = fn (&Ihandle) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Ihandle, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Ihandle, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Ihandle, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Ihandle, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Ihandle, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Ihandle, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Ihandle, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Ihandle, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Ihandle, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Ihandle, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Ihandle, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Ihandle, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Ihandle, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Ihandle, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Ihandle, &Ihandle, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Ihandle, &Ihandle) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Ihandle, &Ihandle, &Ihandle) FuncResult // tabchange_cb

pub type IFnss = fn (&Ihandle, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Ihandle, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Ihandle, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Ihandle, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Ihandle, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Ihandle, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Ihandle, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Ihandle, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Ihandle, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Ihandle, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Ihandle, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Ihandle, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Ihandle, int, int, &Ihandle, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Ihandle, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Ihandle, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Ihandle, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Ihandle, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Ihandle, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Ihandle, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Ihandle, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Ihandle, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Ihandle, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Ihandle, &Ihandle, int) FuncResult

pub type SIFnii = fn (&Ihandle, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Ihandle, int) charptr // cell_cb

pub type SIFniis = fn (&Ihandle, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Ihandle, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Ihandle, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Ihandle, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Ihandle, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Ihandle, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Ihandle, voidptr) FuncResult

pub fn (control &Ihandle) set_callback(name string, func voidptr) &Ihandle {
	C.IupSetCallback(control, name.str, func)
	return unsafe { control }
}

pub fn (control &Ihandle) get_callback(name string) voidptr {
	ptr := C.IupGetCallback(control, name.str)
	return ptr
}

// common Callbacks

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (control &Ihandle) on_map(func IFn) &Ihandle {
	C.IupSetCallback(control, c'MAP_CB', func)
	return unsafe { control }
}

// on_unmap called right before an element is unmapped
pub fn (control &Ihandle) on_unmap(func IFn) &Ihandle {
	C.IupSetCallback(control, c'UNMAP_CB', func)
	return unsafe { control }
}

// on_destroy called right before an element is destroyed
pub fn (control &Ihandle) on_destroy(func IFn) &Ihandle {
	C.IupSetCallback(control, c'DESTROY_CB', func)
	return unsafe { control }
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (control &Ihandle) on_focused(func IFn) &Ihandle {
	C.IupSetCallback(control, c'GETFOCUS_CB', func)
	return unsafe { control }
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (control &Ihandle) on_unfocused(func IFn) &Ihandle {
	C.IupSetCallback(control, c'KILLFOCUS_CB', func)
	return unsafe { control }
}

// on_entered action generated when the mouse enters the native element
pub fn (control &Ihandle) on_entered(func IFn) &Ihandle {
	C.IupSetCallback(control, c'ENTERWINDOW_CB', func)
	return unsafe { control }
}

// on_exited action generated when the mouse leaves the native element
pub fn (control &Ihandle) on_exited(func IFn) &Ihandle {
	C.IupSetCallback(control, c'LEAVEWINDOW_CB', func)
	return unsafe { control }
}

// on_key action generated when a keyboard event occurs
pub fn (control &Ihandle) on_key(func IFni) &Ihandle {
	C.IupSetCallback(control, c'K_ANY', func)
	return unsafe { control }
}

// on_help action generated when the user press F1 at a control. In Motif is also activated by the Help button in some workstations keyboard
pub fn (control &Ihandle) on_help(func IFn) &Ihandle {
	C.IupSetCallback(control, c'HELP_CB', func)
	return unsafe { control }
}

// ==============Button==============

// on_action is triggered when the primary function of the element is performed (e.g. clicking a button)
// button: Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
pub fn (control &Ihandle) on_action(func IFn) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// on_button occurs when a button is clicked
// button: Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used
pub fn (control &Ihandle) on_button(func IFniiiis) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return unsafe { control }
}

// ==============Calendar==============

// on_value_changed occurs when the value of an element is modified
pub fn (control &Ihandle) on_value_changed(func IFn) &Ihandle {
	C.IupSetCallback(control, c'VALUECHANGED_CB', func)
	return unsafe { control }
}

// ==============Canvas==============

// on_redraw Action generated when the canvas needs to be redrawn
pub fn (control &Ihandle) on_redraw(func IFnff) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// BUTTON_CB: Action generated when any mouse button is pressed or released

// on_drop_files action generated when one or more files are dropped in the element
pub fn (control &Ihandle) on_drop_files(func IFnsiii) &Ihandle {
	C.IupSetCallback(control, c'DROPFILES_CB', func)
	return unsafe { control }
}

// on_focus called when the canvas gets or looses the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (control &Ihandle) on_focus(func IFni) &Ihandle {
	C.IupSetCallback(control, c'FOCUS_CB', func)
	return unsafe { control }
}

// on_motion action generated when the mouse is moved
pub fn (control &Ihandle) on_motion(func IFniis) &Ihandle {
	C.IupSetCallback(control, c'MOTION_CB', func)
	return unsafe { control }
}

// on_key_press action generated when a key is pressed or released. It is called after the common callback K_ANY
pub fn (control &Ihandle) on_key_press(func IFii) &Ihandle {
	C.IupSetCallback(control, c'KEYPRESS_CB', func)
	return unsafe { control }
}

// on_resize action generated when the canvas size is changed
pub fn (control &Ihandle) on_resize(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'RESIZE_CB', func)
	return unsafe { control }
}

// on_scroll called when the scrollbar is manipulated
pub fn (control &Ihandle) on_scroll(func IFniff) &Ihandle {
	C.IupSetCallback(control, c'SCROLL_CB', func)
	return unsafe { control }
}

// TOUCH_CB: Windows 7 Only
// MULTITOUCH_CB: Windows 7 Only

// on_wheel action generated when the mouse wheel is rotated
pub fn (control &Ihandle) on_wheel(func IFnfiis) &Ihandle {
	C.IupSetCallback(control, c'WHEEL_CB', func)
	return unsafe { control }
}

// WOM_CB: Windows Only

// on_drag_begin notifies source that drag started. It is called when the mouse starts a drag operation
pub fn (control &Ihandle) on_drag_begin(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'DRAGBEGIN_CB', func)
	return unsafe { control }
}

// on_drag_data_size request for size of drag data from source. It is called when the data is dropped, before the DRAGDATA_CB callback
pub fn (control &Ihandle) on_drag_data_size(func IFnsVi) &Ihandle {
	C.IupSetCallback(control, c'DRAGDATASIZE_CB', func)
	return unsafe { control }
}

// on_drag_data request for drag data from source. It is called when the data is dropped
pub fn (control &Ihandle) on_drag_data(func IFns) &Ihandle {
	C.IupSetCallback(control, c'DRAGDATA_CB', func)
	return unsafe { control }
}

// on_drag_end notifies source that drag is done. The only drag callback that is optional. It is called after the data has been dropped
pub fn (control &Ihandle) on_drag_end(func IFni) &Ihandle {
	C.IupSetCallback(control, c'DRAGEND_CB', func)
	return unsafe { control }
}

// on_drop_data source has sent target the requested data. It is called when the data is dropped. If both drag and drop would be in the same application it would be called after the DRAGDATA_CB callback
pub fn (control &Ihandle) on_drop_data(func IFnsViii) &Ihandle {
	C.IupSetCallback(control, c'DROPDATA_CB', func)
	return unsafe { control }
}

// on_drop_motion notifies destination about drag pointer motion. The only drop callback that is optional. It is called when the mouse moves over any valid drop site
pub fn (control &Ihandle) on_drop_motion(func IFniis) &Ihandle {
	C.IupSetCallback(control, c'DROPMOTION_CB', func)
	return unsafe { control }
}

// ==============Colorbar==============

// on_cell called when the user double clicks a color cell to change its value
pub fn (control &Ihandle) on_cell(func SIFni) &Ihandle {
	C.IupSetCallback(control, c'CELL_CB', func)
	return unsafe { control }
}

// on_extended called when the user right click a cell with the Shift key pressed. It is independent of the SHOW_SECONDARY attribute
pub fn (control &Ihandle) on_extended(func IFni) &Ihandle {
	C.IupSetCallback(control, c'EXTENDED_CB', func)
	return unsafe { control }
}

// on_select called when a color is selected. The primary color is selected with the left mouse button, and if existent the secondary is selected with the right mouse button
pub fn (control &Ihandle) on_select(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'SELECT_CB', func)
	return unsafe { control }
}

// on_switch called when the user double clicks the preview area outside the preview cells to switch the primary and secondary selections. It is only called if SHOW_SECONDARY=YES
pub fn (control &Ihandle) on_switch(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'SWITCH_CB', func)
	return unsafe { control }
}

// ==============ColorBrowser==============

// on_change called when the user releases the left mouse button over the control, defining the selected color
pub fn (control &Ihandle) on_change(func IFnccc) &Ihandle {
	C.IupSetCallback(control, c'CHANGE_CB', func)
	return unsafe { control }
}

// on_drag called several times while the color is being changed by dragging the mouse over the control
pub fn (control &Ihandle) on_drag(func IFnccc) &Ihandle {
	C.IupSetCallback(control, c'DRAG_CB', func)
	return unsafe { control }
}

// VALUECHANGED_CB : called after the value was interactively changed by the user. It is called whenever a CHANGE_CB or a DRAG_CB would also be called, it is just  called after them

// ==============DatePick==============

// VALUECHANGED_CB : called after the value was interactively changed by the user

// ==============DetachBox==============

// on_detached callback called when the box is detached
pub fn (control &Ihandle) on_detached(func IFnnii) &Ihandle {
	C.IupSetCallback(control, c'DETACHED_CB', func)
	return unsafe { control }
}

// on_restored callback called when the box is restored if RESTOREWHENCLOSED=Yes
pub fn (control &Ihandle) on_restored(func IFnnii) &Ihandle {
	C.IupSetCallback(control, c'RESTORED_CB', func)
	return unsafe { control }
}

// ==============Dial==============

// on_button_press called when the user presses the left mouse button over the dial. The angle here is always zero, except for the circular dial
pub fn (control &Ihandle) on_button_press(func IFnd) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_PRESS_CB', func)
	return unsafe { control }
}

// on_button_release called when the user releases the left mouse button after pressing it over the dial
pub fn (control &Ihandle) on_button_release(func IFnd) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_RELEASE_CB', func)
	return unsafe { control }
}

// on_mouse_move called each time the user moves the dial with the mouse button pressed. The angle the dial rotated since it was initialized is passed as a parameter
pub fn (control &Ihandle) on_mouse_move(func IFnd) &Ihandle {
	C.IupSetCallback(control, c'MOUSEMOVE_CB', func)
	return unsafe { control }
}

// VALUECHANGED_CB : Called after the value was interactively changed by the user. It is called whenever a BUTTON_PRESS_CB, a BUTTON_RELEASE_CB or a MOUSEMOVE_CB would also be called, but if defined those callbacks will not be called

// ==============DropButton==============

// on_flat_action action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area. Called only when DROPONARROW=Yes
pub fn (control &Ihandle) on_flat_action(func IFn) &Ihandle {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return unsafe { control }
}

// on_drop_down action generated right before the drop child is shown or hidden. This callback is also called when SHOWDROPDOWN is set
pub fn (control &Ihandle) on_drop_down(func IFni) &Ihandle {
	C.IupSetCallback(control, c'DROPDOWN_CB', func)
	return unsafe { control }
}

// on_drop_show action generated right after the drop child is shown or hidden. This callback is also called when SHOWDROPDOWN is set
pub fn (control &Ihandle) on_drop_show(func IFni) &Ihandle {
	C.IupSetCallback(control, c'DROPSHOW_CB', func)
	return unsafe { control }
}

// ==============Expander==============

// ACTION : Action generated after the expander state is interactively changed

// on_open_close action generated before the expander state is interactively changed
pub fn (control &Ihandle) on_open_close(func IFni) &Ihandle {
	C.IupSetCallback(control, c'OPENCLOSE_CB', func)
	return unsafe { control }
}

// on_extra_button action generated when any mouse button is pressed or released
pub fn (control &Ihandle) on_extra_button(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'EXTRABUTTON_CB', func)
	return unsafe { control }
}

// ==============FlatButton==============

// FLAT_ACTION : Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
// VALUECHANGED_CB : Called after the value was interactively changed by the user. Called only when TOGGLE=Yes. Called after the ACTION callback, but under the same context

// ==============FlatList==============

// FLAT_ACTION : Action generated when the state of an item in the list is interactively changed

// on_dbl_click action generated when the user double click an item
pub fn (control &Ihandle) on_dbl_click(func IFnis) &Ihandle {
	C.IupSetCallback(control, c'DBLCLICK_CB', func)
	return unsafe { control }
}

// on_drag_drop action generated when an internal drag and drop is executed. Only active if SHOWDRAGDROP=YES
pub fn (control &Ihandle) on_drag_drop(func IFniiii) &Ihandle {
	C.IupSetCallback(control, c'DRAGDROP_CB', func)
	return unsafe { control }
}

// on_multi_select action generated when the state of an item in the multiple selection list is interactively changed. But it is called only when the interaction is over
pub fn (control &Ihandle) on_multi_select(func IFns) &Ihandle {
	C.IupSetCallback(control, c'MULTISELECT_CB', func)
	return unsafe { control }
}

// VALUECHANGED_CB : Called after the selection was interactively changed

// ==============FlatScrollBox==============

// on_layout_update action generated when the layout is updated after a scroll operation
pub fn (control &Ihandle) on_layout_update(func IFn) &Ihandle {
	C.IupSetCallback(control, c'LAYOUTUPDATE_CB', func)
	return unsafe { control }
}

// ==============FlatSeparator ==============
// Inherits all callbacks of the IupCanvas, but redefines the ACTION callback.

// ==============FlatTabs==============

// on_tab_change called when the user changes the current tab
pub fn (control &Ihandle) on_tab_change(func IFnnn) &Ihandle {
	C.IupSetCallback(control, c'TABCHANGE_CB', func)
	return unsafe { control }
}

// on_tab_change_pos called when the user changes the current tab. Called only when TABCHANGE_CB is not defined
pub fn (control &Ihandle) on_tab_change_pos(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'TABCHANGEPOS_CB', func)
	return unsafe { control }
}

// on_tab_close called when the user clicks on the close button. Called only when SHOWCLOSE=Yes
pub fn (control &Ihandle) on_tab_close(func IFni) &Ihandle {
	C.IupSetCallback(control, c'TABCLOSE_CB', func)
	return unsafe { control }
}

// on_right_click called when the user clicks on some tab using the right mouse button
pub fn (control &Ihandle) on_right_click(func IFni) &Ihandle {
	C.IupSetCallback(control, c'RIGHTCLICK_CB', func)
	return unsafe { control }
}

// EXTRABUTTON_CB : Action generated when any mouse button is pressed or released

// ==============FlatToggle==============

// FLAT_ACTION : Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
// VALUECHANGED_CB : called after the value was interactively changed by the user. Called after the ACTION callback, but under the same context

// ==============FlatTree==============

// on_selection action generated when an node is selected or deselected
pub fn (control &Ihandle) on_selection(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'SELECTION_CB', func)
	return unsafe { control }
}

// on_multi_selection action generated when multiple nodes are selected with the mouse and the shift key pressed
pub fn (control &Ihandle) on_multi_selection(func IFnIi) &Ihandle {
	C.IupSetCallback(control, c'MULTISELECTION_CB', func)
	return unsafe { control }
}

// on_multi_unselect action generated before multiple nodes are unselected in one single operation
pub fn (control &Ihandle) on_multi_unselect(func IFnIi) &Ihandle {
	C.IupSetCallback(control, c'MULTIUNSELECTION_CB', func)
	return unsafe { control }
}

// on_branch_open action generated when a branch is expanded
pub fn (control &Ihandle) on_branch_open(func IFni) &Ihandle {
	C.IupSetCallback(control, c'BRANCHOPEN_CB', func)
	return unsafe { control }
}

// on_branch_close action generated when a branch is collapsed
pub fn (control &Ihandle) on_branch_close(func IFni) &Ihandle {
	C.IupSetCallback(control, c'BRANCHCLOSE_CB', func)
	return unsafe { control }
}

// on_execute_leaf action generated when a leaf is executed
pub fn (control &Ihandle) on_execute_leaf(func IFni) &Ihandle {
	C.IupSetCallback(control, c'EXECUTELEAF_CB', func)
	return unsafe { control }
}

// on_execute_branch action generated when a branch is executed
pub fn (control &Ihandle) on_execute_branch(func IFni) &Ihandle {
	C.IupSetCallback(control, c'EXECUTEBRANCH_CB', func)
	return unsafe { control }
}

// on_show_rename action generated before a node is renamed
pub fn (control &Ihandle) on_show_rename(func IFni) &Ihandle {
	C.IupSetCallback(control, c'SHOWRENAME_CB', func)
	return unsafe { control }
}

// on_rename action generated after a node is renamed
pub fn (control &Ihandle) on_rename(func IFnis) &Ihandle {
	C.IupSetCallback(control, c'RENAME_CB', func)
	return unsafe { control }
}

// DRAGDROP_CB : action generated when an internal drag & drop is executed

// on_node_removed action generated when a node is about to be removed
pub fn (control &Ihandle) on_node_removed(func IFnC) &Ihandle {
	C.IupSetCallback(control, c'NODEREMOVED_CB', func)
	return unsafe { control }
}

// RIGHTCLICK_CB : Action generated when the right mouse button is pressed over a node

// on_toggle_value action generated when the toggle's state was changed. The callback also receives the new toggle's state
pub fn (control &Ihandle) on_toggle_value(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'TOGGLEVALUE_CB', func)
	return unsafe { control }
}

// Drag & Drop attributes and callbacks are supported, but SHOWDRAGDROP must be set to NO

// ==============FlatVal==============

// VALUECHANGED_CB : Called after the value was interactively changed by the user

// on_value_changing called when the value starts or ends to be interactively changed by the user
pub fn (control &Ihandle) on_value_changing(func IFni) &Ihandle {
	C.IupSetCallback(control, c'VALUECHANGING_CB', func)
	return unsafe { control }
}

// ==============Frame==============

// FOCUS_CB : Called when a child of the container gets or looses the focus. It is called only if PROPAGATEFOCUS is defined in the child

// ==============Gauge==============
// MAP_CB, UNMAP_CB, DESTROY_CB: common callbacks are supported.

// ==============Item==============

// ACTION : Action generated when the item is selected. IUP_CLOSE will be processed. Even if inside a popup menu when IUP_CLOSE is returned, the current popup dialog or the main loop will be closed

// on_highlight action generated when the item is highlighted
pub fn (control &Ihandle) on_highlight(func IFn) &Ihandle {
	C.IupSetCallback(control, c'HIGHLIGHT_CB', func)
	return unsafe { control }
}

// ==============Label==============

// BUTTON_CB : Action generated when any mouse button is pressed or released
// MOTION_CB : Action generated when the mouse is moved
// DROPFILES_CB : Action generated when one or more files are dropped in the element
// MAP_CB, UNMAP_CB, DESTROY_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB: common callbacks are supported.

// ==============Link==============

// on_link action generated when the link is activated
pub fn (control &Ihandle) on_link(func IFns) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// ==============List==============

// on_list_item action generated when the state of an item in the list is changed. Also provides information on the changed item
pub fn (control &Ihandle) on_list_item(func IFnsii) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// BUTTON_CB : Action generated when any mouse button is pressed or released inside the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position

// on_caret action generated when the caret/cursor position is changed.  Valid only when EDITBOX=YES
pub fn (control &Ihandle) on_caret(func IFnii) &Ihandle {
	C.IupSetCallback(control, c'CARET_CB', func)
	return unsafe { control }
}

// DBLCLICK_CB : Action generated when the user double click an item. Called only when DROPDOWN=NO
// DRAGDROP_CB : Action generated when an internal drag and drop is executed. Only active if SHOWDRAGDROP=YES
// DROPDOWN_CB : Action generated when the list of a dropdown is shown or hidden. Called only when DROPDOWN=YES
// DROPFILES_CB : Action generated when one or more files are dropped in the element
// on_edit Action generated when the text in the text box is manually changed by the user, but before its value is actually updated. Valid only when EDITBOX=YES
pub fn (control &Ihandle) on_edit(func IFnis) &Ihandle {
	C.IupSetCallback(control, c'EDIT_CB', func)
	return unsafe { control }
}

// MOTION_CB : Action generated when the mouse is moved over the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position
// MULTISELECT_CB : Action generated when the state of an item in the multiple selection list is changed. But it is called only when the interaction is over
// VALUECHANGED_CB : Called after the value was interactively changed by the user. Called when the selection is changed or when the text is edited
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported.
// Drag & Drop attributes and callbacks are supported, but SHOWDRAGDROP must be set to NO.

// ==============Menu==============

// on_open called just before the menu is opened
pub fn (control &Ihandle) on_open(func IFn) &Ihandle {
	C.IupSetCallback(control, c'OPEN_CB', func)
	return unsafe { control }
}

// on_menu_close called just after the menu is closed
pub fn (control &Ihandle) on_menu_close(func IFn) &Ihandle {
	C.IupSetCallback(control, c'MENUCLOSE_CB', func)
	return unsafe { control }
}

// MAP_CB, UNMAP_CB, DESTROY_CB : common callbacks are supported.

// ==============ParamBox==============

// on_param
pub fn (control &Ihandle) on_param(func IFniv) &Ihandle {
	C.IupSetCallback(control, c'PARAM_CB', func)
	return unsafe { control }
}

// ==============ProgressBar==============

// MAP_CB, UNMAP_CB, DESTROY_CB: common callbacks are supported.

// ==============ScrollBox==============

// LAYOUTUPDATE_CB : Action generated when the layout is updated after a scroll operation

// ==============Spin & SpinBox==============

// on_spin called each time the user clicks in the buttons. It will increment 1 and decrement -1 by default. Holding the Shift key will set a factor of 2, holding Ctrl a factor of 10, and both a factor of 100
pub fn (control &Ihandle) on_spin(func IFni) &Ihandle {
	C.IupSetCallback(control, c'SPIN_CB', func)
	return unsafe { control }
}

// ==============Split==============

// VALUECHANGED_CB : Called after the value was interactively changed by the user

// ==============Submenu==============

// HIGHLIGHT_CB : Action generated when the submenu is highlighted
// MAP_CB, UNMAP_CB, DESTROY_CB: common callbacks are supported.

// ==============Tabs==============

// TABCHANGE_CB : Callback called when the user changes the current tab. It is not called when the current tab is programmatically changed or removed
// TABCHANGEPOS_CB : Callback called when the user changes the current tab. Called only when TABCHANGE_CB is not defined
// TABCLOSE_CB : Callback called when the user clicks on the close button (since 3.10). Called only when SHOWCLOSE=Yes
// FOCUS_CB : Called when a child of the container gets or looses the focus. It is called only if PROPAGATEFOCUS is defined in the child
// RIGHTCLICK_CB : Callback called when the user clicks on some tab using the right mouse button
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported.

// ==============Text==============

// on_text_edit action generated when the text is edited, but before its value is actually changed. Can be generated when using the keyboard, undo system or from the clipboard
pub fn (control &Ihandle) on_text_edit(func IFnis) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// BUTTON_CB : Action generated when any mouse button is pressed or released. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
// CARET_CB : Action generated when the caret/cursor position is changed
// DROPFILES_CB : Action generated when one or more files are dropped in the element
// MOTION_CB : Action generated when the mouse is moved. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
// SPIN_CB : Action generated when a spin button is pressed. Valid only when SPIN=YES. When this callback is called the ACTION callback is not called. The VALUE attribute can be changed during this callback only if SPINAUTO=NO
// VALUECHANGED_CB : Called after the value was interactively changed by the user
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported

// ==============Thread==============

// on_thread action generated when the thread is started. If this callback returns or does not exist the thread is terminated
pub fn (control &Ihandle) on_thread(func IFn) &Ihandle {
	C.IupSetCallback(control, c'THREAD_CB', func)
	return unsafe { control }
}

// ==============Timer==============

// ACTION: called every time the defined time interval is reached. To stop the callback from being called simply stop de timer with RUN=NO. Inside the callback the attribute ELAPSEDTIME returns the time elapsed since the timer was started in milliseconds

// ==============Tree==============

// SELECTION_CB : Action generated when an node is selected or deselected
// MULTISELECTION_CB: Action generated when multiple nodes are selected with the mouse and the shift key pressed.
// MULTIUNSELECTION_CB: Action generated before multiple nodes are unselected in one single operation.
// BRANCHOPEN_CB: Action generated when a branch is expanded.
// BRANCHCLOSE_CB: Action generated when a branch is collapsed.
// EXECUTELEAF_CB: Action generated when a leaf is executed.
// EXECUTEBRANCH_CB: Action generated when a branch is executed.
// SHOWRENAME_CB: Action generated before a node is renamed.
// RENAME_CB: Action generated after a node is renamed.
// DRAGDROP_CB: Action generated when an internal drag & drop is executed.
// NODEREMOVED_CB: Action generated when a node is about to be removed.
// RIGHTCLICK_CB: Action generated when the right mouse button is pressed over a node.
// TOGGLEVALUE_CB: Action generated when the toggle's state was changed. The callback also receives the new toggle's state.

// ==============Val==============

// VALUECHANGED_CB : Called after the value was interactively changed by the user
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported.

// https://iup.sourceforge.net/en/ctrl/iup_plot.html
// ==============Plot==============

// on_plot_click_sample action generated when a sample is clicked. Called when the mouse button is released, with no Ctrl key and IUP_BUTTON3 only when Shift is pressed, to avoid conflict with zoom and context menu situations. The sample is searched using IupPlotFindSample
pub fn (control &Ihandle) on_plot_click_sample(func IFniiddi) &Ihandle {
	C.IupSetCallback(control, c'CLICKSAMPLE_CB', func)
	return unsafe { control }
}

// on_plot_click_segment action generated when a segment is clicked. The segment is identified by the two samples that connects the segment. Called when the mouse button is released, with no Ctrl key and IUP_BUTTON3 only when Shift is pressed, to avoid conflict with zoom and context menu situations. If a sample is clicked this callback is ignored. The segment is searched using IupPlotFindSegment
pub fn (control &Ihandle) on_plot_click_segment(func IFniiddddi) &Ihandle {
	C.IupSetCallback(control, c'CLICKSEGMENT_CB', func)
	return unsafe { control }
}

// on_plot_edit_sample action generated when a sample coordinates are changed in the "Data Set Values..." dialog if EDITABLEVALUES=Yes
pub fn (control &Ihandle) on_plot_edit_sample(func IFniidd) &Ihandle {
	C.IupSetCallback(control, c'EDITSAMPLE_CB', func)
	return unsafe { control }
}

// on_plot_delete action generated when the Del key is pressed to removed a sample from a dataset. If multiple samples are selected it is called once for each selected sample
pub fn (control &Ihandle) on_plot_delete(func IFniidd) &Ihandle {
	C.IupSetCallback(control, c'DELETE_CB', func)
	return unsafe { control }
}

// on_plot_delete_begin actions generated when a delete operation will begin
pub fn (control &Ihandle) on_plot_delete_begin(func IFn) &Ihandle {
	C.IupSetCallback(control, c'DELETEBEGIN_CB', func)
	return unsafe { control }
}

// on_plot_delete_end actions generated when a delete operation will end
pub fn (control &Ihandle) on_plot_delete_end(func IFn) &Ihandle {
	C.IupSetCallback(control, c'DELETEEND_CB', func)
	return unsafe { control }
}

// on_plot_draw_sample action generated when a sample is drawn. When the plot is redraw, it is called for each sample, then it is called again for all selected samples, and this repeats for each data set, and this repeats for each data set
pub fn (control &Ihandle) on_plot_draw_sample(func IFniiddi) &Ihandle {
	C.IupSetCallback(control, c'DRAWSAMPLE_CB', func)
	return unsafe { control }
}

// on_plot_menu_context action generated after the context menu (right click) is created but before it is displayed, so the application can add or removed items from the menu. Called when the mouse button is pressed, with no Ctrl nor Shift keys. Only shown if MENUCONTEXT=Yes
pub fn (control &Ihandle) on_plot_menu_context(func IFnnii) &Ihandle {
	C.IupSetCallback(control, c'MENUCONTEXT_CB', func)
	return unsafe { control }
}

// on_plot_menu_context_close same as `MENUCONTEXT_CB`, but called after the context menu is closed. Only shown if MENUCONTEXT=Yes
pub fn (control &Ihandle) on_plot_menu_context_close(func IFnnii) &Ihandle {
	C.IupSetCallback(control, c'MENUCONTEXTCLOSE_CB', func)
	return unsafe { control }
}

// on_plot_ds_properties_changed called after the user changed dataset attributes using the "Data Set Properties..." dialog
pub fn (control &Ihandle) on_plot_ds_properties_changed(func IFni) &Ihandle {
	C.IupSetCallback(control, c'DSPROPERTIESCHANGED_CB', func)
	return unsafe { control }
}

// on_plot_ds_properties_validate called when the user pressed OK to change dataset attributes using the "Data Set Properties..." dialog. Called only once
pub fn (control &Ihandle) on_plot_ds_properties_validate(func IFnni) &Ihandle {
	C.IupSetCallback(control, c'DSPROPERTIESVALIDATE_CB', func)
	return unsafe { control }
}

// on_plot_properties_changed called when the user changed plot attributes using the "Properties..." dialog
pub fn (control &Ihandle) on_plot_properties_changed(func IFn) &Ihandle {
	C.IupSetCallback(control, c'PROPERTIESCHANGED_CB', func)
	return unsafe { control }
}

// on_plot_properties_validate called for each attribute in the page, when the user pressed Apply to change plot attributes using the "Properties..." dialog
pub fn (control &Ihandle) on_plot_properties_validate(func IFnss) &Ihandle {
	C.IupSetCallback(control, c'PROPERTIESVALIDATE_CB', func)
	return unsafe { control }
}

// on_plot_select action generated when a sample is selected. If multiple samples are selected it is called once for each new selected sample. It is called only if the selection state of the sample is about to be changed
pub fn (control &Ihandle) on_plot_select(func IFniiddi) &Ihandle {
	C.IupSetCallback(control, c'SELECT_CB', func)
	return unsafe { control }
}

// on_plot_select_begin actions generated when a selection operation will begin
pub fn (control &Ihandle) on_plot_select_begin(func IFn) &Ihandle {
	C.IupSetCallback(control, c'SELECTBEGIN_CB', func)
	return unsafe { control }
}

// on_plot_select_end actions generated when a selection operation will end
pub fn (control &Ihandle) on_plot_select_end(func IFn) &Ihandle {
	C.IupSetCallback(control, c'SELECTEND_CB', func)
	return unsafe { control }
}

// on_plot_plot_button similar to BUTTON_CB but coordinates are in plot scale with double precision. It is called before the internal processing, if returns IUP_IGNORE internal processing will not be done
pub fn (control &Ihandle) on_plot_plot_button(func IFniidds) &Ihandle {
	C.IupSetCallback(control, c'PLOTBUTTON_CB', func)
	return unsafe { control }
}

// on_plot_plot_motion similar to MOTION_CB but coordinates are in plot scale with double precision. It is called before the internal processing, if returns IUP_IGNORE internal processing will not be done
pub fn (control &Ihandle) on_plot_plot_motion(func IFndds) &Ihandle {
	C.IupSetCallback(control, c'PLOTMOTION_CB', func)
	return unsafe { control }
}

// on_plot_xtick_format_number allows to modify the displayed string of a tick number in the X axis. If the callback is not defined the internal function is used
pub fn (control &Ihandle) on_plot_xtick_format_number(func IFnssds) &Ihandle {
	C.IupSetCallback(control, c'XTICKFORMATNUMBER_CB', func)
	return unsafe { control }
}

// on_plot_ytick_format_number allows to modify the displayed string of a tick number in the Y axis. If the callback is not defined the internal function is used
pub fn (control &Ihandle) on_plot_ytick_format_number(func IFnssds) &Ihandle {
	C.IupSetCallback(control, c'YTICKFORMATNUMBER_CB', func)
	return unsafe { control }
}

// on_plot_pre_draw actions generated before the draw operation. Predraw can be used to draw a different background. Predraw is called after the background is drawn. To position primitives in plot units, use the IupPlotTransform function
pub fn (control &Ihandle) on_plot_pre_draw(func IFnv) &Ihandle {
	C.IupSetCallback(control, c'PREDRAW_CB', func)
	return unsafe { control }
}

// on_plot_post_draw actions generated after the draw operation. Postdraw can be used to draw additional information in the plot. Postdraw is clipped to the dataset area. Postdraw is called before the legend and title are drawn (the last drawn elements). To position primitives in plot units, use the IupPlotTransform function
pub fn (control &Ihandle) on_plot_post_draw(func IFnv) &Ihandle {
	C.IupSetCallback(control, c'POSTDRAW_CB', func)
	return unsafe { control }
}
