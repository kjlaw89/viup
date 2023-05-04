module viup

// https://www.tecgraf.puc-rio.br/iup/en/elem

fn C.IupSetCallback(voidptr, charptr, voidptr)
fn C.IupGetCallback(voidptr, charptr) voidptr
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

pub type IFn = fn (&Control) FuncResult // default definition, same as Icallback

pub type IFni = fn (&Control, int) FuncResult // k_any, show_cb, toggle_action, spin_cb, branchopen_cb, branchclose_cb, executeleaf_cb, showrename_cb, rightclick_cb, extended_cb, height_cb, width_cb

pub type IFnii = fn (&Control, int, int) FuncResult // resize_cb, caret_cb, matrix_mousemove_cb, enteritem_cb, leaveitem_cb, scrolltop_cb, dropcheck_cb, selection_cb, select_cb, switch_cb, scrolling_cb, vspan_cb, hspan_cb

pub type IFniii = fn (&Control, int, int, int) FuncResult // trayclick_cb, edition_cb

pub type IFniiii = fn (&Control, int, int, int, int) FuncResult // dragdrop_cb

pub type IFniiiiiiC = fn (&Control, int, int, int, int, int, int, voidptr) FuncResult // draw_cb

pub type IFniiiiii = fn (&Control, int, int, int, int, int, int) FuncResult // OLD draw_cb

pub type IFnsidv = fn (&Control, charptr, int, f64, voidptr) FuncResult // postmessage_cb

pub type IFnff = fn (&Control, f32, f32) FuncResult // canvas_action

pub type IFniff = fn (&Control, int, f32, f32) FuncResult // scroll_cb

pub type IFnfiis = fn (&Control, f32, int, int, charptr) FuncResult // wheel_cb

pub type IFnsVi = fn (&Control, charptr, voidptr, int) FuncResult // dragdata_cb

pub type IFnsViii = fn (&Control, charptr, voidptr, int, int, int) FuncResult // dropdata_cb

pub type IFnsiii = fn (&Control, charptr, int, int, int) FuncResult // dropfiles_cb

pub type IFnssi = fn (&Control, charptr, charptr, int) FuncResult // dragfilecreatename_cb

pub type IFnnii = fn (&Control, &Control, int, int) FuncResult // drop_cb

pub type IFnn = fn (&Control, &Control) FuncResult // savemarkers_cb, restoremarkers_cb

pub type IFnnn = fn (&Control, &Control, &Control) FuncResult // tabchange_cb

pub type IFnss = fn (&Control, charptr, charptr) FuncResult // file_cb

pub type IFns = fn (&Control, charptr) FuncResult // multiselect_cb

pub type IFnsi = fn (&Control, charptr, int) FuncResult // copydata_cb

pub type IFnis = fn (&Control, int, charptr) FuncResult // text_action, multiline_action, edit_cb, rename_cb

pub type IFnsii = fn (&Control, charptr, int, int) FuncResult // list_action

pub type IFniis = fn (&Control, int, int, charptr) FuncResult // motion_cb, click_cb, value_edit_cb

pub type IFniiis = fn (&Control, int, int, int, charptr) FuncResult // touch_cb, dblclick_cb

pub type IFniiiis = fn (&Control, int, int, int, int, charptr) FuncResult // button_cb, matrix_action, mousemotion_cb

pub type IFniiiiiis = fn (&Control, int, int, int, int, int, int, charptr) FuncResult // mouseclick_cb

pub type IFnIi = fn (&Control, &int, int) FuncResult // multiselection_cb, multiunselection_cb

pub type IFnd = fn (&Control, f64) FuncResult // mousemove_cb, button_press_cb, button_release_cb

pub type IFniiIII = fn (&Control, int, int, &int, &int, &int) FuncResult // fgcolor_cb, bgcolor_cb

pub type IFniinsii = fn (&Control, int, int, &Control, charptr, int, int) FuncResult // dropselect_cb

pub type IFnccc = fn (&Control, u8, u8, u8) FuncResult // drag_cb, change_cb

pub type IFniIIII = fn (&Control, int, &int, &int, &int, &int) FuncResult // multitouch_cb

pub type IFnC = fn (&Control, voidptr) FuncResult // postdraw_cb, predraw_cb

pub type IFniidd = fn (&Control, int, int, f64, f64) FuncResult // delete_cb

pub type IFniiddi = fn (&Control, int, int, f64, f64, int) FuncResult // select_cb

pub type IFniiddiddi = fn (&Control, int, int, f64, f64, int, f64, f64, int) FuncResult // clicksegment_cb

pub type IFniidds = fn (&Control, int, int, f64, f64, charptr) FuncResult // plotbutton_cb

pub type IFndds = fn (&Control, f64, f64, charptr) FuncResult // plotmotion_cb

pub type IFnssds = fn (&Control, charptr, charptr, f64, charptr) FuncResult // plottickformat_cb

pub type IFnni = fn (&Control, &Control, int) FuncResult

pub type SIFnii = fn (&Control, int, int) charptr // value_cb, font_cb

pub type SIFni = fn (&Control, int) charptr // cell_cb

pub type SIFniis = fn (&Control, int, int, charptr) charptr // translatevalue_cb

pub type DIFnii = fn (&Control, int, int) f64 // numericgetvalue_cb

pub type IFniid = fn (&Control, int, int, f64) int // numericsetvalue_cb

pub type IFniiv = fn (&Control, int, int, voidptr) // android_onactivityresult_cb

pub type IFniv = fn (&Control, int, voidptr) FuncResult // param_cb

pub type IFniiddddi = fn (&Control, int, int, f64, f64, f64, f64, int) FuncResult

pub type IFnv = fn (&Control, voidptr) FuncResult

pub fn (control &Control) set_callback(name string, func voidptr) &Control {
	C.IupSetCallback(control, name.str, func)
	return control
}

pub fn (control &Control) get_callback(name string) voidptr {
	ptr := C.IupGetCallback(control, name.str)
	return ptr
}

// common Callbacks

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (control &Control) on_map(func IFn) &Control {
	C.IupSetCallback(control, c'MAP_CB', func)
	return control
}

// on_unmap called right before an element is unmapped
pub fn (control &Control) on_unmap(func IFn) &Control {
	C.IupSetCallback(control, c'UNMAP_CB', func)
	return control
}

// on_destroy called right before an element is destroyed
pub fn (control &Control) on_destroy(func IFn) &Control {
	C.IupSetCallback(control, c'DESTROY_CB', func)
	return control
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (control &Control) on_focused(func IFn) &Control {
	C.IupSetCallback(control, c'GETFOCUS_CB', func)
	return control
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (control &Control) on_unfocused(func IFn) &Control {
	C.IupSetCallback(control, c'KILLFOCUS_CB', func)
	return control
}

// on_entered action generated when the mouse enters the native element
pub fn (control &Control) on_entered(func IFn) &Control {
	C.IupSetCallback(control, c'ENTERWINDOW_CB', func)
	return control
}

// on_exited action generated when the mouse leaves the native element
pub fn (control &Control) on_exited(func IFn) &Control {
	C.IupSetCallback(control, c'LEAVEWINDOW_CB', func)
	return control
}

// on_key action generated when a keyboard event occurs
pub fn (control &Control) on_key(func IFni) &Control {
	C.IupSetCallback(control, c'K_ANY', func)
	return control
}

// on_help action generated when the user press F1 at a control. In Motif is also activated by the Help button in some workstations keyboard
pub fn (control &Control) on_help(func IFn) &Control {
	C.IupSetCallback(control, c'HELP_CB', func)
	return control
}

// on_action is triggered when the primary function of the element is performed (e.g. clicking a button)
pub fn (control &Control) on_action(func IFn) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// ==============Button==============
// on_left_button_click generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
pub fn (control &Control) on_left_button_click(func IFn) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// on_button occurs when a button is clicked
// button: Action generated when any mouse button is pressed and when it is released. Both calls occur before the ACTION callback when button 1 is being used
pub fn (control &Control) on_button(func IFniiiis) &Control {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return control
}

// ==============Calendar==============

// on_value_changed occurs when the value of an element is modified
pub fn (control &Control) on_value_changed(func IFn) &Control {
	C.IupSetCallback(control, c'VALUECHANGED_CB', func)
	return control
}

// ==============Canvas==============
// on_redraw generated when the canvas needs to be redrawn
pub fn (control &Control) on_redraw(func IFn) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// BUTTON_CB: Action generated when any mouse button is pressed or released

// on_drop_files action generated when one or more files are dropped in the element
pub fn (control &Control) on_drop_files(func IFnsiii) &Control {
	C.IupSetCallback(control, c'DROPFILES_CB', func)
	return control
}

// on_focus called when the canvas gets or looses the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (control &Control) on_focus(func IFni) &Control {
	C.IupSetCallback(control, c'FOCUS_CB', func)
	return control
}

// on_motion action generated when the mouse is moved
pub fn (control &Control) on_motion(func IFniis) &Control {
	C.IupSetCallback(control, c'MOTION_CB', func)
	return control
}

// on_key_press action generated when a key is pressed or released. It is called after the common callback K_ANY
pub fn (control &Control) on_key_press(func IFii) &Control {
	C.IupSetCallback(control, c'KEYPRESS_CB', func)
	return control
}

// on_resize action generated when the canvas size is changed
pub fn (control &Control) on_resize(func IFnii) &Control {
	C.IupSetCallback(control, c'RESIZE_CB', func)
	return control
}

// on_scroll called when the scrollbar is manipulated
pub fn (control &Control) on_scroll(func IFniff) &Control {
	C.IupSetCallback(control, c'SCROLL_CB', func)
	return control
}

// on_touch [Windows 7 Only]: Action generated when a touch event occurred. Multiple touch events will trigger several calls. Must set TOUCH=Yes to receive this event
pub fn (control &Control) on_touch(func IFniiis) &Control {
	C.IupSetCallback(control, c'TOUCH_CB', func)
	return control
}

// on_multi_touch [Windows 7 Only]: Action generated when multiple touch events occurred. Must set TOUCH=Yes to receive this event
pub fn (control &Control) on_multi_touch(func IFniIIII) &Control {
	C.IupSetCallback(control, c'MULTITOUCH_CB', func)
	return control
}

// on_wheel action generated when the mouse wheel is rotated
pub fn (control &Control) on_wheel(func IFnfiis) &Control {
	C.IupSetCallback(control, c'WHEEL_CB', func)
	return control
}

// on_wom [Windows Only]: Action generated when an audio device receives an event
pub fn (control &Control) on_wom(func IFni) &Control {
	C.IupSetCallback(control, c'WOM_CB', func)
	return control
}

// on_drag_begin notifies source that drag started. It is called when the mouse starts a drag operation
pub fn (control &Control) on_drag_begin(func IFnii) &Control {
	C.IupSetCallback(control, c'DRAGBEGIN_CB', func)
	return control
}

// on_drag_data_size request for size of drag data from source. It is called when the data is dropped, before the DRAGDATA_CB callback
pub fn (control &Control) on_drag_data_size(func IFnsVi) &Control {
	C.IupSetCallback(control, c'DRAGDATASIZE_CB', func)
	return control
}

// on_drag_data request for drag data from source. It is called when the data is dropped
pub fn (control &Control) on_drag_data(func IFns) &Control {
	C.IupSetCallback(control, c'DRAGDATA_CB', func)
	return control
}

// on_drag_end notifies source that drag is done. The only drag callback that is optional. It is called after the data has been dropped
pub fn (control &Control) on_drag_end(func IFni) &Control {
	C.IupSetCallback(control, c'DRAGEND_CB', func)
	return control
}

// on_drop_data source has sent target the requested data. It is called when the data is dropped. If both drag and drop would be in the same application it would be called after the DRAGDATA_CB callback
pub fn (control &Control) on_drop_data(func IFnsViii) &Control {
	C.IupSetCallback(control, c'DROPDATA_CB', func)
	return control
}

// on_drop_motion notifies destination about drag pointer motion. The only drop callback that is optional. It is called when the mouse moves over any valid drop site
pub fn (control &Control) on_drop_motion(func IFniis) &Control {
	C.IupSetCallback(control, c'DROPMOTION_CB', func)
	return control
}

// ==============Colorbar==============

// on_cell called when the user double clicks a color cell to change its value
pub fn (control &Control) on_cell(func SIFni) &Control {
	C.IupSetCallback(control, c'CELL_CB', func)
	return control
}

// on_extended called when the user right click a cell with the Shift key pressed. It is independent of the SHOW_SECONDARY attribute
pub fn (control &Control) on_extended(func IFni) &Control {
	C.IupSetCallback(control, c'EXTENDED_CB', func)
	return control
}

// on_select called when a color is selected. The primary color is selected with the left mouse button, and if existent the secondary is selected with the right mouse button
pub fn (control &Control) on_select(func IFnii) &Control {
	C.IupSetCallback(control, c'SELECT_CB', func)
	return control
}

// on_switch called when the user double clicks the preview area outside the preview cells to switch the primary and secondary selections. It is only called if SHOW_SECONDARY=YES
pub fn (control &Control) on_switch(func IFnii) &Control {
	C.IupSetCallback(control, c'SWITCH_CB', func)
	return control
}

// ==============ColorBrowser==============

// on_change called when the user releases the left mouse button over the control, defining the selected color
pub fn (control &Control) on_change(func IFnccc) &Control {
	C.IupSetCallback(control, c'CHANGE_CB', func)
	return control
}

// on_drag called several times while the color is being changed by dragging the mouse over the control
pub fn (control &Control) on_drag(func IFnccc) &Control {
	C.IupSetCallback(control, c'DRAG_CB', func)
	return control
}

// VALUECHANGED_CB : called after the value was interactively changed by the user. It is called whenever a CHANGE_CB or a DRAG_CB would also be called, it is just  called after them

// ==============DatePick==============

// VALUECHANGED_CB : called after the value was interactively changed by the user

// ==============DetachBox==============

// on_detached callback called when the box is detached
pub fn (control &Control) on_detached(func IFnnii) &Control {
	C.IupSetCallback(control, c'DETACHED_CB', func)
	return control
}

// on_restored callback called when the box is restored if RESTOREWHENCLOSED=Yes
pub fn (control &Control) on_restored(func IFnnii) &Control {
	C.IupSetCallback(control, c'RESTORED_CB', func)
	return control
}

// ==============Dial==============

// on_button_press called when the user presses the left mouse button over the dial. The angle here is always zero, except for the circular dial
pub fn (control &Control) on_button_press(func IFnd) &Control {
	C.IupSetCallback(control, c'BUTTON_PRESS_CB', func)
	return control
}

// on_button_release called when the user releases the left mouse button after pressing it over the dial
pub fn (control &Control) on_button_release(func IFnd) &Control {
	C.IupSetCallback(control, c'BUTTON_RELEASE_CB', func)
	return control
}

// on_mouse_move called each time the user moves the dial with the mouse button pressed. The angle the dial rotated since it was initialized is passed as a parameter
pub fn (control &Control) on_mouse_move(func IFnd) &Control {
	C.IupSetCallback(control, c'MOUSEMOVE_CB', func)
	return control
}

// VALUECHANGED_CB : Called after the value was interactively changed by the user. It is called whenever a BUTTON_PRESS_CB, a BUTTON_RELEASE_CB or a MOUSEMOVE_CB would also be called, but if defined those callbacks will not be called

// ==============DropButton==============

// on_flat_action action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area. Called only when DROPONARROW=Yes
pub fn (control &Control) on_flat_action(func IFn) &Control {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return control
}

// on_drop_down action generated right before the drop child is shown or hidden. This callback is also called when SHOWDROPDOWN is set
pub fn (control &Control) on_drop_down(func IFni) &Control {
	C.IupSetCallback(control, c'DROPDOWN_CB', func)
	return control
}

// on_drop_show action generated right after the drop child is shown or hidden. This callback is also called when SHOWDROPDOWN is set
pub fn (control &Control) on_drop_show(func IFni) &Control {
	C.IupSetCallback(control, c'DROPSHOW_CB', func)
	return control
}

// ==============Expander==============

// ACTION : Action generated after the expander state is interactively changed

// on_open_close action generated before the expander state is interactively changed
pub fn (control &Control) on_open_close(func IFni) &Control {
	C.IupSetCallback(control, c'OPENCLOSE_CB', func)
	return control
}

// on_extra_button action generated when any mouse button is pressed or released
pub fn (control &Control) on_extra_button(func IFnii) &Control {
	C.IupSetCallback(control, c'EXTRABUTTON_CB', func)
	return control
}

// ==============FlatButton==============

// FLAT_ACTION : Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
// VALUECHANGED_CB : Called after the value was interactively changed by the user. Called only when TOGGLE=Yes. Called after the ACTION callback, but under the same context

// on_flat_button will be called when key pressed or mouse button pressed
pub fn (control &Control) on_flat_button(func IFniiiis) &Control {
	C.IupSetCallback(control, c'FLAT_BUTTON_CB', func)
	return control
}

// ==============FlatList==============

// on_item_state : Action generated when the state of an item in the list is interactively changed
pub fn (control &Control) on_item_state(func IFnsii) &Control {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return control
}

// on_dbl_click action generated when the user double click an item
pub fn (control &Control) on_dbl_click(func IFnis) &Control {
	C.IupSetCallback(control, c'DBLCLICK_CB', func)
	return control
}

// on_drag_drop action generated when an internal drag and drop is executed. Only active if SHOWDRAGDROP=YES
pub fn (control &Control) on_drag_drop(func IFniiii) &Control {
	C.IupSetCallback(control, c'DRAGDROP_CB', func)
	return control
}

// on_multi_select action generated when the state of an item in the multiple selection list is interactively changed. But it is called only when the interaction is over
pub fn (control &Control) on_multi_select(func IFns) &Control {
	C.IupSetCallback(control, c'MULTISELECT_CB', func)
	return control
}

// VALUECHANGED_CB : Called after the selection was interactively changed

// ==============FlatScrollBox==============

// on_layout_update action generated when the layout is updated after a scroll operation
pub fn (control &Control) on_layout_update(func IFn) &Control {
	C.IupSetCallback(control, c'LAYOUTUPDATE_CB', func)
	return control
}

// ==============FlatSeparator ==============
// Inherits all callbacks of the IupCanvas, but redefines the ACTION callback.

// ==============FlatTabs==============

// on_tab_change called when the user changes the current tab
pub fn (control &Control) on_tab_change(func IFnnn) &Control {
	C.IupSetCallback(control, c'TABCHANGE_CB', func)
	return control
}

// on_tab_change_pos called when the user changes the current tab. Called only when TABCHANGE_CB is not defined
pub fn (control &Control) on_tab_change_pos(func IFnii) &Control {
	C.IupSetCallback(control, c'TABCHANGEPOS_CB', func)
	return control
}

// on_tab_close called when the user clicks on the close button. Called only when SHOWCLOSE=Yes
pub fn (control &Control) on_tab_close(func IFni) &Control {
	C.IupSetCallback(control, c'TABCLOSE_CB', func)
	return control
}

// on_right_click called when the user clicks on some tab using the right mouse button
pub fn (control &Control) on_right_click(func IFni) &Control {
	C.IupSetCallback(control, c'RIGHTCLICK_CB', func)
	return control
}

// EXTRABUTTON_CB : Action generated when any mouse button is pressed or released

// ==============FlatToggle==============
// on_flat_toggle : Action generated when the button 1 (usually left) is selected. This callback is called only after the mouse is released and when it is released inside the button area
pub fn (control &Control) on_flat_toggle(func IFni) &Control {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return control
}

// VALUECHANGED_CB : called after the value was interactively changed by the user. Called after the ACTION callback, but under the same context

// ==============FlatTree==============

// on_selection action generated when an node is selected or deselected
pub fn (control &Control) on_selection(func IFnii) &Control {
	C.IupSetCallback(control, c'SELECTION_CB', func)
	return control
}

// on_multi_selection action generated when multiple nodes are selected with the mouse and the shift key pressed
pub fn (control &Control) on_multi_selection(func IFnIi) &Control {
	C.IupSetCallback(control, c'MULTISELECTION_CB', func)
	return control
}

// on_multi_unselect action generated before multiple nodes are unselected in one single operation
pub fn (control &Control) on_multi_unselect(func IFnIi) &Control {
	C.IupSetCallback(control, c'MULTIUNSELECTION_CB', func)
	return control
}

// on_branch_open action generated when a branch is expanded
pub fn (control &Control) on_branch_open(func IFni) &Control {
	C.IupSetCallback(control, c'BRANCHOPEN_CB', func)
	return control
}

// on_branch_close action generated when a branch is collapsed
pub fn (control &Control) on_branch_close(func IFni) &Control {
	C.IupSetCallback(control, c'BRANCHCLOSE_CB', func)
	return control
}

// on_execute_leaf action generated when a leaf is executed
pub fn (control &Control) on_execute_leaf(func IFni) &Control {
	C.IupSetCallback(control, c'EXECUTELEAF_CB', func)
	return control
}

// on_execute_branch action generated when a branch is executed
pub fn (control &Control) on_execute_branch(func IFni) &Control {
	C.IupSetCallback(control, c'EXECUTEBRANCH_CB', func)
	return control
}

// on_show_rename action generated before a node is renamed
pub fn (control &Control) on_show_rename(func IFni) &Control {
	C.IupSetCallback(control, c'SHOWRENAME_CB', func)
	return control
}

// on_rename action generated after a node is renamed
pub fn (control &Control) on_rename(func IFnis) &Control {
	C.IupSetCallback(control, c'RENAME_CB', func)
	return control
}

// DRAGDROP_CB : action generated when an internal drag & drop is executed

// on_node_removed action generated when a node is about to be removed
pub fn (control &Control) on_node_removed(func IFnC) &Control {
	C.IupSetCallback(control, c'NODEREMOVED_CB', func)
	return control
}

// RIGHTCLICK_CB : Action generated when the right mouse button is pressed over a node

// on_toggle_value action generated when the toggle's state was changed. The callback also receives the new toggle's state
pub fn (control &Control) on_toggle_value(func IFnii) &Control {
	C.IupSetCallback(control, c'TOGGLEVALUE_CB', func)
	return control
}

// Drag & Drop attributes and callbacks are supported, but SHOWDRAGDROP must be set to NO

// ==============FlatVal==============

// VALUECHANGED_CB : Called after the value was interactively changed by the user

// on_value_changing called when the value starts or ends to be interactively changed by the user
pub fn (control &Control) on_value_changing(func IFni) &Control {
	C.IupSetCallback(control, c'VALUECHANGING_CB', func)
	return control
}

// ==============Frame==============

// FOCUS_CB : Called when a child of the container gets or looses the focus. It is called only if PROPAGATEFOCUS is defined in the child

// ==============Gauge==============
// MAP_CB, UNMAP_CB, DESTROY_CB: common callbacks are supported.

// ==============Label==============

// BUTTON_CB : Action generated when any mouse button is pressed or released
// MOTION_CB : Action generated when the mouse is moved
// DROPFILES_CB : Action generated when one or more files are dropped in the element
// MAP_CB, UNMAP_CB, DESTROY_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB: common callbacks are supported.

// ==============Link==============

// on_link action generated when the link is activated
pub fn (control &Control) on_link(func IFns) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// ==============List==============

// on_list_item action generated when the state of an item in the list is changed. Also provides information on the changed item
pub fn (control &Control) on_list_item(func IFnsii) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// BUTTON_CB : Action generated when any mouse button is pressed or released inside the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position

// on_caret action generated when the caret/cursor position is changed.  Valid only when EDITBOX=YES
pub fn (control &Control) on_caret(func IFnii) &Control {
	C.IupSetCallback(control, c'CARET_CB', func)
	return control
}

// DBLCLICK_CB : Action generated when the user double click an item. Called only when DROPDOWN=NO
// DRAGDROP_CB : Action generated when an internal drag and drop is executed. Only active if SHOWDRAGDROP=YES
// DROPDOWN_CB : Action generated when the list of a dropdown is shown or hidden. Called only when DROPDOWN=YES
// DROPFILES_CB : Action generated when one or more files are dropped in the element
// on_edit Action generated when the text in the text box is manually changed by the user, but before its value is actually updated. Valid only when EDITBOX=YES
pub fn (control &Control) on_edit(func IFnis) &Control {
	C.IupSetCallback(control, c'EDIT_CB', func)
	return control
}

// MOTION_CB : Action generated when the mouse is moved over the list. Called only when DROPDOWN=NO. If the list has an editbox the message is called when cursor is at the listbox only (ignored at the editbox). Use IupConvertXYToPos to convert (x,y) coordinates in item position
// MULTISELECT_CB : Action generated when the state of an item in the multiple selection list is changed. But it is called only when the interaction is over
// VALUECHANGED_CB : Called after the value was interactively changed by the user. Called when the selection is changed or when the text is edited
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported.
// Drag & Drop attributes and callbacks are supported, but SHOWDRAGDROP must be set to NO.

// ==============ParamBox==============

// on_param
pub fn (control &Control) on_param(func IFniv) &Control {
	C.IupSetCallback(control, c'PARAM_CB', func)
	return control
}

// ==============ProgressBar==============

// MAP_CB, UNMAP_CB, DESTROY_CB: common callbacks are supported.

// ==============ScrollBox==============

// LAYOUTUPDATE_CB : Action generated when the layout is updated after a scroll operation

// ==============Spin & SpinBox==============

// on_spin called each time the user clicks in the buttons. It will increment 1 and decrement -1 by default. Holding the Shift key will set a factor of 2, holding Ctrl a factor of 10, and both a factor of 100
pub fn (control &Control) on_spin(func IFni) &Control {
	C.IupSetCallback(control, c'SPIN_CB', func)
	return control
}

// ==============Split==============

// VALUECHANGED_CB : Called after the value was interactively changed by the user

// ==============Tabs==============

// TABCHANGE_CB : Callback called when the user changes the current tab. It is not called when the current tab is programmatically changed or removed
// TABCHANGEPOS_CB : Callback called when the user changes the current tab. Called only when TABCHANGE_CB is not defined
// TABCLOSE_CB : Callback called when the user clicks on the close button (since 3.10). Called only when SHOWCLOSE=Yes
// FOCUS_CB : Called when a child of the container gets or looses the focus. It is called only if PROPAGATEFOCUS is defined in the child
// RIGHTCLICK_CB : Callback called when the user clicks on some tab using the right mouse button
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported.

// ==============Text==============

// on_text_edit action generated when the text is edited, but before its value is actually changed. Can be generated when using the keyboard, undo system or from the clipboard
pub fn (control &Control) on_text_edit(func IFnis) &Control {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

// BUTTON_CB : Action generated when any mouse button is pressed or released. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
// on_text_caret action generated when the caret/cursor position is changed.  Valid only when EDITBOX=YES
pub fn (control &Control) on_text_caret(func IFniii) &Control {
	C.IupSetCallback(control, c'CARET_CB', func)
	return control
}

// DROPFILES_CB : Action generated when one or more files are dropped in the element
// MOTION_CB : Action generated when the mouse is moved. Use IupConvertXYToPos to convert (x,y) coordinates in character positioning
// SPIN_CB : Action generated when a spin button is pressed. Valid only when SPIN=YES. When this callback is called the ACTION callback is not called. The VALUE attribute can be changed during this callback only if SPINAUTO=NO
// VALUECHANGED_CB : Called after the value was interactively changed by the user
// MAP_CB, UNMAP_CB, DESTROY_CB, GETFOCUS_CB, KILLFOCUS_CB, ENTERWINDOW_CB, LEAVEWINDOW_CB, K_ANY, HELP_CB: All common callbacks are supported

// ==============Thread==============

// on_thread action generated when the thread is started. If this callback returns or does not exist the thread is terminated
pub fn (control &Control) on_thread(func IFn) &Control {
	C.IupSetCallback(control, c'THREAD_CB', func)
	return control
}

// ==============Timer==============

// on_timer called every time the defined time interval is reached. To stop the callback from being called simply stop de timer with RUN=NO. Inside the callback the attribute ELAPSEDTIME returns the time elapsed since the timer was started in milliseconds
pub fn (control &Control) on_timer(func IFn) &Control {
	C.IupSetCallback(control, c'ACTION_CB', func)
	return control
}

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

// ==============Dialog==============

// on_close called just before a dialog is closed when the user clicks the close button of the title bar or an equivalent action.
pub fn (dialog &Dialog) on_close(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'CLOSE_CB', func)
	return dialog
}

// on_copy_data [Windows Only]: Called at the first instance, when a second instance is running. Must set the global attribute SINGLEINSTANCE to be called
pub fn (dialog &Dialog) on_copy_data(func IFnsi) &Dialog {
	C.IupSetCallback(dialog, c'COPYDATA_CB', func)
	return dialog
}

// on_drop_files [Windows and GTK Only]: Action generated when one or more files are dropped in the dialog
pub fn (dialog &Dialog) on_drop_files(func IFnsiii) &Dialog {
	C.IupSetCallback(dialog, c'DROPFILES_CB', func)
	return dialog
}

// on_custom_frame [Windows Only]: Called when the dialog must be redraw. Although it is designed for drawing the frame elements, all the dialog must be painted. Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined. The dialog can be used just like an IupCanvas to draw its elements, the HDC_WMPAINT and CLIPRECT attributes are defined during the callback. For mouse callbacks use the same callbacks as IupCanvas, such as BUTTON_CB and MOTION_CB
pub fn (dialog &Dialog) on_custom_frame(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'CUSTOMFRAME_CB', func)
	return dialog
}

// on_custom_frame_activate [Windows Only]: Called when the dialog active state is changed (for instance the user Alt+Tab to another application, or clicked in another window). Works only when CUSTOMFRAME or CUSTOMFRAMEEX is defined
pub fn (dialog &Dialog) on_custom_frame_activate(func IFni) &Dialog {
	C.IupSetCallback(dialog, c'CUSTOMFRAMEACTIVATE_CB', func)
	return dialog
}

// on_focus called when the dialog or any of its children gets the focus, or when another dialog or any control in another dialog gets the focus. It is called after the common callbacks GETFOCUS_CB and KILL_FOCUS_CB
pub fn (dialog &Dialog) on_focus(func IFni) &Dialog {
	C.IupSetCallback(dialog, c'FOCUS_CB', func)
	return dialog
}

// on_mdi_activate [Windows Only]: Called when a MDI child window is activated. Only the MDI child receive this message. It is not called when the child is shown for the first time
pub fn (dialog &Dialog) on_mdi_activate(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'MDIACTIVATE_CB', func)
	return dialog
}

// on_move [Windows and GTK Only]: Called after the dialog was moved on screen. The coordinates are the same as the SCREENPOSITION attribute
pub fn (dialog &Dialog) on_move(func IFnii) &Dialog {
	C.IupSetCallback(dialog, c'MOVE_CB', func)
	return dialog
}

// on_resize generated when the dialog size is changed
pub fn (dialog &Dialog) on_resize(func IFnii) &Dialog {
	C.IupSetCallback(dialog, c'RESIZE_CB', func)
	return dialog
}

// on_show called right after the dialog is showed, hidden, maximized, minimized or restored from minimized/maximized.
pub fn (dialog &Dialog) on_show(func IFni) &Dialog {
	C.IupSetCallback(dialog, c'SHOW_CB', func)
	return dialog
}

// on_tray_click [Windows and GTK Only]: Called right after the mouse button is pressed or released over the tray icon
pub fn (dialog &Dialog) on_tray_click(func IFniii) &Dialog {
	C.IupSetCallback(dialog, c'TRAYCLICK_CB', func)
	return dialog
}

// on_map called right after an element is mapped and its attributes updated in IupMap.
// When the element is a dialog, it is called after the layout is updated. For all other elements is called before the layout is updated, so the element current size will still be 0x0 during MAP_CB
pub fn (dialog &Dialog) on_map(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'MAP_CB', func)
	return dialog
}

// on_unmap called right before an element is unmapped
pub fn (dialog &Dialog) on_unmap(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'UNMAP_CB', func)
	return dialog
}

// on_destroy called right before an element is destroyed
pub fn (dialog &Dialog) on_destroy(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'DESTROY_CB', func)
	return dialog
}

// on_focused action generated when an element is given keyboard focus. This callback is called after the KILLFOCUS_CB of the element that loosed the focus. The IupGetFocus function during the callback returns the element that loosed the focus
pub fn (dialog &Dialog) on_focused(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'GETFOCUS_CB', func)
	return dialog
}

// on_unfocused action generated when an element loses keyboard focus. This callback is called before the GETFOCUS_CB of the element that gets the focus
pub fn (dialog &Dialog) on_unfocused(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'KILLFOCUS_CB', func)
	return dialog
}

// on_entered action generated when the mouse enters the native element
pub fn (dialog &Dialog) on_entered(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'ENTERWINDOW_CB', func)
	return dialog
}

// on_exited action generated when the mouse leaves the native element
pub fn (dialog &Dialog) on_exited(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'LEAVEWINDOW_CB', func)
	return dialog
}

// on_key action generated when a keyboard event occurs
pub fn (dialog &Dialog) on_key(func IFni) &Dialog {
	C.IupSetCallback(dialog, c'K_ANY', func)
	return dialog
}

// on_help action generated when the user press F1 at a dialog. In Motif is also activated by the Help button in some workstations keyboard
pub fn (dialog &Dialog) on_help(func IFn) &Dialog {
	C.IupSetCallback(dialog, c'HELP_CB', func)
	return dialog
}
