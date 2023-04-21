module viup

fn C.IupSetCallback(voidptr, charptr, voidptr)
fn C.IupSetFunction(charptr, voidptr)

pub type ActionFunc = fn (&IHandle) FuncResult

pub type BranchOpenFunc = fn (&IHandle, int) FuncResult

pub type BranchCloseFunc = fn (&IHandle, int) FuncResult

pub type ButtonFunc = fn (&IHandle) FuncResult

pub type ButtonPressFunc = fn (&IHandle, f64) FuncResult

pub type ButtonReleaseFunc = fn (&IHandle, f64) FuncResult

pub type CaretFunc = fn (&IHandle, int, int, int) FuncResult

pub type CellFunc = fn (&IHandle, int) FuncResult

pub type ChangeFunc = fn (&IHandle, byte, byte, byte) FuncResult

pub type DblClickFunc = fn (&IHandle, int, charptr) FuncResult

pub type DestroyFunc = fn (&IHandle) FuncResult

pub type DetachedFunc = fn (&IHandle, &IHandle, int, int) FuncResult

pub type DragFunc = fn (&IHandle, byte, byte, byte) FuncResult

pub type DragDropFunc = fn (&IHandle, int, int, int, int) FuncResult

pub type DrawFunc = fn (&IHandle, f32, f32) FuncResult

pub type DropDownFunc = fn (&IHandle, int) FuncResult

pub type DropFilesFunc = fn (&IHandle, charptr, int, int, int) FuncResult

pub type EditFunc = fn (&IHandle, int, charptr) FuncResult

pub type EnteredFunc = fn (&IHandle) FuncResult

pub type EntryFunc = fn ()

pub type ExecuteBranchFunc = fn (&IHandle, int) FuncResult

pub type ExecuteLeafFunc = fn (&IHandle, int) FuncResult

pub type ExitFunc = fn ()

pub type ExitedFunc = fn (&IHandle) FuncResult

pub type ExtendedFunc = fn (&IHandle) FuncResult

pub type ExtraButtonFunc = fn (&IHandle, int, bool) FuncResult

pub type FlatActionFunc = fn (&IHandle) FuncResult

pub type FocusedFunc = fn (&IHandle) FuncResult

pub type HelpFunc = fn (&IHandle) FuncResult

pub type IdleFunc = fn ()

pub type KeyFunc = fn (&IHandle, int) FuncResult

pub type KeyPressFunc = fn (&IHandle, int, int) FuncResult

pub type LayoutUpdateFunc = fn (&IHandle) FuncResult

pub type MapFunc = fn (&IHandle) int

pub type MotionFunc = fn (&IHandle, int, int, charptr) FuncResult

pub type MouseButtonFunc = fn (&IHandle, MouseButton, bool, int, int, charptr) FuncResult

pub type MouseMoveFunc = fn (&IHandle, f64) FuncResult

pub type MultiSelectFunc = fn (&IHandle, charptr) FuncResult

pub type MultiSelectionFunc = fn (&IHandle, voidptr, int) FuncResult

pub type MultiUnselectionFunc = fn (&IHandle, voidptr, int) FuncResult

pub type NodeRemovedFunc = fn (&IHandle, voidptr) FuncResult

pub type MenuCloseFunc = fn (&IHandle) FuncResult

pub type MenuOpenFunc = fn (&IHandle) FuncResult

pub type OpenCloseFunc = fn (&IHandle, int) FuncResult

pub type RenameFunc = fn (&IHandle, int, charptr) FuncResult

pub type ResizeFunc = fn (&IHandle, int, int) FuncResult

pub type RestoredFunc = fn (&IHandle, &IHandle, int, int) FuncResult

pub type RightClickFunc = fn (&IHandle, int) FuncResult

pub type SelectFunc = fn (&IHandle, int, int) FuncResult

pub type SelectionFunc = fn (&IHandle, int, int) FuncResult

pub type ShowRenameFunc = fn (&IHandle, int) FuncResult

pub type ScrollFunc = fn (&IHandle, int, f32, f32) FuncResult

pub type SpinFunc = fn (&IHandle, int) FuncResult

pub type SwitchFunc = fn (&IHandle, int, int) FuncResult

pub type TabChangeFunc = fn (&IHandle, &IHandle, &IHandle) FuncResult

pub type TabChangePosFunc = fn (&IHandle, int, int) FuncResult

pub type TabCloseFunc = fn (&IHandle, int) FuncResult

pub type ToggleValueFunc = fn (&IHandle, int, int) FuncResult

pub type UnfocusedFunc = fn (&IHandle)

pub type UnmapFunc = fn (&IHandle) FuncResult

pub type ValueChangedFunc = fn (&IHandle) FuncResult

pub type ValueChangingFunc = fn (&IHandle, int) FuncResult

pub type WheelFunc = fn (&IHandle, f32, int, int, charptr) FuncResult

// on_action is triggered when the primary function of the element is performed (e.g. clicking a button)
pub fn (control &IHandle) on_action(func ActionFunc) &IHandle {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

pub fn (control &IHandle) on_branch_open(func BranchOpenFunc) &IHandle {
	C.IupSetCallback(control, c'BRANCHOPEN_CB', func)
	return control
}

pub fn (control &IHandle) on_branch_close(func BranchCloseFunc) &IHandle {
	C.IupSetCallback(control, c'BRANCHCLOSE_CB', func)
	return control
}

// on_button occurs when a button is clicked
pub fn (control &IHandle) on_button(func ButtonFunc) &IHandle {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return control
}

// on_button_press occurs when a button is pressed, but not released
pub fn (control &IHandle) on_button_press(func ButtonPressFunc) &IHandle {
	C.IupSetCallback(control, c'BUTTON_PRESS_CB', func)
	return control
}

// on_button_release occurs when a button is pressed and then released
pub fn (control &IHandle) on_button_release(func ButtonReleaseFunc) &IHandle {
	C.IupSetCallback(control, c'BUTTON_RELEASE_CB', func)
	return control
}

pub fn (control &IHandle) on_caret(func CaretFunc) &IHandle {
	C.IupSetCallback(control, c'CARET_CB', func)
	return control
}

pub fn (control &IHandle) on_cell(func CellFunc) &IHandle {
	C.IupSetCallback(control, c'CELL_CB', func)
	return control
}

// on_change occurs when the value in an input is changed
pub fn (control &IHandle) on_change(func ChangeFunc) &IHandle {
	C.IupSetCallback(control, c'CHANGE_CB', func)
	return control
}

// on_dbl_click occurs when an element is double-clicked
pub fn (control &IHandle) on_dbl_click(func DblClickFunc) &IHandle {
	C.IupSetCallback(control, c'DBLCLICK_CB', func)
	return control
}

// on_destroy occurs when an element is freed
pub fn (control &IHandle) on_destroy(func DestroyFunc) &IHandle {
	C.IupSetCallback(control, c'DESTROY_CB', func)
	return control
}

pub fn (control &IHandle) on_detached(func DetachedFunc) &IHandle {
	C.IupSetCallback(control, c'DETACHED_CB', func)
	return control
}

// on_drag occurs when an element is being dragged
pub fn (control &IHandle) on_drag(func DragFunc) &IHandle {
	C.IupSetCallback(control, c'DRAG_CB', func)
	return control
}

// on_drag_drop occurs when an element is dragged and then dropped
pub fn (control &IHandle) on_drag_drop(func DragDropFunc) &IHandle {
	C.IupSetCallback(control, c'DRAGDROP_CB', func)
	return control
}

// on_draw occurs when an element needs to be redrawn (applies to Canvas elements)
pub fn (control &IHandle) on_draw(func DrawFunc) &IHandle {
	C.IupSetCallback(control, c'ACTION', func)
	return control
}

pub fn (control &IHandle) on_drop_down(func DropDownFunc) &IHandle {
	C.IupSetCallback(control, c'DROPDOWN_CB', func)
	return control
}

pub fn (control &IHandle) on_drop_files(func DropFilesFunc) &IHandle {
	C.IupSetCallback(control, c'DROPFILES_CB', func)
	return control
}

// on_edit occurs when an element is being edited
pub fn (control &IHandle) on_edit(func EditFunc) &IHandle {
	C.IupSetCallback(control, c'EDIT_CB', func)
	return control
}

pub fn (control &IHandle) on_entered(func EnteredFunc) &IHandle {
	C.IupSetCallback(control, c'ENTERWINDOW_CB', func)
	return control
}

pub fn (control &IHandle) on_execute_branch(func ExecuteBranchFunc) &IHandle {
	C.IupSetCallback(control, c'EXECUTEBRANCH_CB', func)
	return control
}

pub fn (control &IHandle) on_execute_left(func ExecuteLeafFunc) &IHandle {
	C.IupSetCallback(control, c'EXECUTELEAF_CB', func)
	return control
}

pub fn (control &IHandle) on_exited(func ExitedFunc) &IHandle {
	C.IupSetCallback(control, c'LEAVEWINDOW_CB', func)
	return control
}

pub fn (control &IHandle) on_extended(func ExtendedFunc) &IHandle {
	C.IupSetCallback(control, c'EXTENDED_CB', func)
	return control
}

pub fn (control &IHandle) on_extra_button(func ExtraButtonFunc) &IHandle {
	C.IupSetCallback(control, c'EXTRABUTTON_CB', func)
	return control
}

pub fn (control &IHandle) on_flat_action(func FlatActionFunc) &IHandle {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return control
}

// on_focused occurs when an element receives focus
pub fn (control &IHandle) on_focused(func FocusedFunc) &IHandle {
	C.IupSetCallback(control, c'GETFOCUS_CB', func)
	return control
}

// on_help occurs when the focused element has the "help" method called on it
pub fn (control &IHandle) on_help(func HelpFunc) &IHandle {
	C.IupSetCallback(control, c'HELP_CB', func)
	return control
}

// on_key occurs when any key is pressed down
pub fn (control &IHandle) on_key(func KeyFunc) &IHandle {
	C.IupSetCallback(control, c'K_ANY', func)
	return control
}

// on_key_press occurs when a key is fully pressed and released
pub fn (control &IHandle) on_key_press(func KeyPressFunc) &IHandle {
	C.IupSetCallback(control, c'KEYPRESS_CB', func)
	return control
}

pub fn (control &IHandle) on_map(func MapFunc) &IHandle {
	C.IupSetCallback(control, c'MAP_CB', func)
	return control
}

pub fn (control &IHandle) on_motion(func MotionFunc) &IHandle {
	C.IupSetCallback(control, c'MOTION_CB', func)
	return control
}

// on_mouse_button occurs when any mouse button is pressed
pub fn (control &IHandle) on_mouse_button(func MouseButtonFunc) &IHandle {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return control
}

// on_mouse_move occurs whenever mouse movement has happened
pub fn (control &IHandle) on_mouse_move(func MouseMoveFunc) &IHandle {
	C.IupSetCallback(control, c'MOUSEMOVE_CB', func)
	return control
}

pub fn (control &IHandle) on_multiselect(func MultiSelectFunc) &IHandle {
	C.IupSetCallback(control, c'MULTISELECT_CB', func)
	return control
}

pub fn (control &IHandle) on_multiselection(func MultiSelectionFunc) &IHandle {
	C.IupSetCallback(control, c'MULTISELECTION_CB', func)
	return control
}

pub fn (control &IHandle) on_multiunselect(func MultiUnselectionFunc) &IHandle {
	C.IupSetCallback(control, c'MULTIUNSELECTION_CB', func)
	return control
}

pub fn (control &IHandle) on_node_removed(func NodeRemovedFunc) &IHandle {
	C.IupSetCallback(control, c'NODEREMOVED_CB', func)
	return control
}

pub fn (control &IHandle) on_open_close(func OpenCloseFunc) &IHandle {
	C.IupSetCallback(control, c'OPENCLOSE_CB', func)
	return control
}

pub fn (control &IHandle) on_rename(func RenameFunc) &IHandle {
	C.IupSetCallback(control, c'RENAME_CB', func)
	return control
}

// on_resize occurs whenever an element is resized
pub fn (control &IHandle) on_resize(func ResizeFunc) &IHandle {
	C.IupSetCallback(control, c'RESIZE_CB', func)
	return control
}

// on_right_click occurs whenever a right-click even is detected
pub fn (control &IHandle) on_right_click(func RightClickFunc) &IHandle {
	C.IupSetCallback(control, c'RIGHTCLICK_CB', func)
	return control
}

pub fn (control &IHandle) on_restored(func RestoredFunc) &IHandle {
	C.IupSetCallback(control, c'RESTORED_CB', func)
	return control
}

// on_select occurs whenever a value is selected in an element
pub fn (control &IHandle) on_select(func SelectFunc) &IHandle {
	C.IupSetCallback(control, c'SELECT_CB', func)
	return control
}

pub fn (control &IHandle) on_selection(func SelectionFunc) &IHandle {
	C.IupSetCallback(control, c'SELECTION_CB', func)
	return control
}

pub fn (control &IHandle) on_scroll(func ScrollFunc) &IHandle {
	C.IupSetCallback(control, c'SCROLL_CB', func)
	return control
}

pub fn (control &IHandle) on_show_rename(func ShowRenameFunc) &IHandle {
	C.IupSetCallback(control, c'SHOWRENAME_CB', func)
	return control
}

pub fn (control &IHandle) on_switch(func SwitchFunc) &IHandle {
	C.IupSetCallback(control, c'SWITCH_CB', func)
	return control
}

// on_tab_change occurs when a tab is selected
pub fn (control &IHandle) on_tab_change(func TabChangeFunc) &IHandle {
	C.IupSetCallback(control, c'TABCHANGE_CB', func)
	return control
}

pub fn (control &IHandle) on_tab_change_pos(func TabChangePosFunc) &IHandle {
	C.IupSetCallback(control, c'TABCHANGEPOS_CB', func)
	return control
}

// on_tab_close occurs when a tab is closed
pub fn (control &IHandle) on_tab_close(func TabCloseFunc) &IHandle {
	C.IupSetCallback(control, c'TABCLOSE_CB', func)
	return control
}

// on_toggle_value occurs when a toggle element is changed
pub fn (control &IHandle) on_toggle_value(func ToggleValueFunc) &IHandle {
	C.IupSetCallback(control, c'TOGGLEVALUE_CB', func)
	return control
}

// on_unfocused occurs when an element loses focus
pub fn (control &IHandle) on_unfocused(func UnfocusedFunc) &IHandle {
	C.IupSetCallback(control, c'KILLFOCUS_CB', func)
	return control
}

pub fn (control &IHandle) on_unmap(func UnmapFunc) &IHandle {
	C.IupSetCallback(control, c'UNMAP_CB', func)
	return control
}

// on_value_changed occurs when the value of an element is modified
pub fn (control &IHandle) on_value_changed(func ValueChangedFunc) &IHandle {
	C.IupSetCallback(control, c'VALUECHANGED_CB', func)
	return control
}

// on_value_changing occurs when the value of an element is being actively changed
// (but the element still has focus so 'change' has not happened)
pub fn (control &IHandle) on_value_changing(func ValueChangingFunc) &IHandle {
	C.IupSetCallback(control, c'VALUECHANGING_CB', func)
	return control
}

// on_wheel occurs when the scroll wheel on the mouse is adjusted
pub fn (control &IHandle) on_wheel(func WheelFunc) &IHandle {
	C.IupSetCallback(control, c'WHEEL_CB', func)
	return control
}
