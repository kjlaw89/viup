module viup

fn C.IupSetCallback(voidptr, charptr, VIUPCallback)
fn C.IupSetFunction(charptr, VIUPCallback)

pub type ActionFunc = fn (&Control) FuncResult

pub type BranchOpenFunc = fn (&Control, int) FuncResult

pub type BranchCloseFunc = fn (&Control, int) FuncResult

pub type ButtonFunc = fn (&Control) FuncResult

pub type ButtonPressFunc = fn (&Control, f64) FuncResult

pub type ButtonReleaseFunc = fn (&Control, f64) FuncResult

pub type CaretFunc = fn (&Control, int, int, int) FuncResult

pub type CellFunc = fn (&Control, int) FuncResult

pub type ChangeFunc = fn (&Control, byte, byte, byte) FuncResult

pub type DblClickFunc = fn (&Control, int, charptr) FuncResult

pub type DestroyFunc = fn (&Control) FuncResult

pub type DetachedFunc = fn (&Control, &Control, int, int) FuncResult

pub type DragFunc = fn (&Control, byte, byte, byte) FuncResult

pub type DragDropFunc = fn (&Control, int, int, int, int) FuncResult

pub type DrawFunc = fn (&Control, f32, f32) FuncResult

pub type DropDownFunc = fn (&Control, int) FuncResult

pub type DropFilesFunc = fn (&Control, charptr, int, int, int) FuncResult

pub type EditFunc = fn (&Control, int, charptr) FuncResult

pub type EnteredFunc = fn (&Control) FuncResult

pub type EntryFunc = fn ()

pub type ExecuteBranchFunc = fn (&Control, int) FuncResult

pub type ExecuteLeafFunc = fn (&Control, int) FuncResult

pub type ExitFunc = fn ()

pub type ExitedFunc = fn (&Control) FuncResult

pub type ExtendedFunc = fn (&Control) FuncResult

pub type ExtraButtonFunc = fn (&Control, int, bool) FuncResult

pub type FlatActionFunc = fn (&Control) FuncResult

pub type FocusedFunc = fn (&Control) FuncResult

pub type HelpFunc = fn (&Control) FuncResult

pub type IdleFunc = fn ()

pub type KeyFunc = fn (&Control, int) FuncResult

pub type KeyPressFunc = fn (&Control, int, int) FuncResult

pub type LayoutUpdateFunc = fn (&Control) FuncResult

pub type MapFunc = fn (&Control) int

pub type MotionFunc = fn (&Control, int, int, charptr) FuncResult

pub type MouseButtonFunc = fn (&Control, MouseButton, bool, int, int, charptr) FuncResult

pub type MouseMoveFunc = fn (&Control, f64) FuncResult

pub type MultiSelectFunc = fn (&Control, charptr) FuncResult

pub type MultiSelectionFunc = fn (&Control, voidptr, int) FuncResult

pub type MultiUnselectionFunc = fn (&Control, voidptr, int) FuncResult

pub type NodeRemovedFunc = fn (&Control, voidptr) FuncResult

pub type MenuCloseFunc = fn (&Control) FuncResult

pub type MenuOpenFunc = fn (&Control) FuncResult

pub type OpenCloseFunc = fn (&Control, int) FuncResult

pub type RenameFunc = fn (&Control, int, charptr) FuncResult

pub type ResizeFunc = fn (&Control, int, int) FuncResult

pub type RestoredFunc = fn (&Control, &Control, int, int) FuncResult

pub type RightClickFunc = fn (&Control, int) FuncResult

pub type SelectFunc = fn (&Control, int, int) FuncResult

pub type SelectionFunc = fn (&Control, int, int) FuncResult

pub type ShowRenameFunc = fn (&Control, int) FuncResult

pub type ScrollFunc = fn (&Control, int, f32, f32) FuncResult

pub type SpinFunc = fn (&Control, int) FuncResult

pub type SwitchFunc = fn (&Control, int, int) FuncResult

pub type TabChangeFunc = fn (&Control, &Control, &Control) FuncResult

pub type TabChangePosFunc = fn (&Control, int, int) FuncResult

pub type TabCloseFunc = fn (&Control, int) FuncResult

pub type ToggleValueFunc = fn (&Control, int, int) FuncResult

pub type UnfocusedFunc = fn (&Control)

pub type UnmapFunc = fn (&Control) FuncResult

pub type ValueChangedFunc = fn (&Control) FuncResult

pub type ValueChangingFunc = fn (&Control, int) FuncResult

pub type WheelFunc = fn (&Control, f32, int, int, charptr) FuncResult

// on_action is triggered when the primary function of the element is performed (e.g. clicking a button)
pub fn (control &Control) on_action(func ActionFunc) &Control {
	C.IupSetCallback(control, 'ACTION', func)
	return control
}

pub fn (control &Control) on_branch_open(func BranchOpenFunc) &Control {
	C.IupSetCallback(control, 'BRANCHOPEN_CB', func)
	return control
}

pub fn (control &Control) on_branch_close(func BranchCloseFunc) &Control {
	C.IupSetCallback(control, 'BRANCHCLOSE_CB', func)
	return control
}

// on_button occurs when a button is clicked
pub fn (control &Control) on_button(func ButtonFunc) &Control {
	C.IupSetCallback(control, 'BUTTON_CB', func)
	return control
}

// on_button_press occurs when a button is pressed, but not released
pub fn (control &Control) on_button_press(func ButtonPressFunc) &Control {
	C.IupSetCallback(control, 'BUTTON_PRESS_CB', func)
	return control
}

// on_button_release occurs when a button is pressed and then released
pub fn (control &Control) on_button_release(func ButtonReleaseFunc) &Control {
	C.IupSetCallback(control, 'BUTTON_RELEASE_CB', func)
	return control
}

pub fn (control &Control) on_caret(func CaretFunc) &Control {
	C.IupSetCallback(control, 'CARET_CB', func)
	return control
}

pub fn (control &Control) on_cell(func CellFunc) &Control {
	C.IupSetCallback(control, 'CELL_CB', func)
	return control
}

// on_change occurs when the value in an input is changed
pub fn (control &Control) on_change(func ChangeFunc) &Control {
	C.IupSetCallback(control, 'CHANGE_CB', func)
	return control
}

// on_dbl_click occurs when an element is double-clicked
pub fn (control &Control) on_dbl_click(func DblClickFunc) &Control {
	C.IupSetCallback(control, 'DBLCLICK_CB', func)
	return control
}

// on_destroy occurs when an element is freed
pub fn (control &Control) on_destroy(func DestroyFunc) &Control {
	C.IupSetCallback(control, 'DESTROY_CB', func)
	return control
}

pub fn (control &Control) on_detached(func DetachedFunc) &Control {
	C.IupSetCallback(control, 'DETACHED_CB', func)
	return control
}

// on_drag occurs when an element is being dragged
pub fn (control &Control) on_drag(func DragFunc) &Control {
	C.IupSetCallback(control, 'DRAG_CB', func)
	return control
}

// on_drag_drop occurs when an element is dragged and then dropped
pub fn (control &Control) on_drag_drop(func DragDropFunc) &Control {
	C.IupSetCallback(control, 'DRAGDROP_CB', func)
	return control
}

// on_draw occurs when an element needs to be redrawn (applies to Canvas elements)
pub fn (control &Control) on_draw(func DrawFunc) &Control {
	C.IupSetCallback(control, 'ACTION', func)
	return control
}

pub fn (control &Control) on_drop_down(func DropDownFunc) &Control {
	C.IupSetCallback(control, 'DROPDOWN_CB', func)
	return control
}

pub fn (control &Control) on_drop_files(func DropFilesFunc) &Control {
	C.IupSetCallback(control, 'DROPFILES_CB', func)
	return control
}

// on_edit occurs when an element is being edited
pub fn (control &Control) on_edit(func EditFunc) &Control {
	C.IupSetCallback(control, 'EDIT_CB', func)
	return control
}

pub fn (control &Control) on_entered(func EnteredFunc) &Control {
	C.IupSetCallback(control, 'ENTERWINDOW_CB', func)
	return control
}

pub fn (control &Control) on_execute_branch(func ExecuteBranchFunc) &Control {
	C.IupSetCallback(control, 'EXECUTEBRANCH_CB', func)
	return control
}

pub fn (control &Control) on_execute_left(func ExecuteLeafFunc) &Control {
	C.IupSetCallback(control, 'EXECUTELEAF_CB', func)
	return control
}

pub fn (control &Control) on_exited(func ExitedFunc) &Control {
	C.IupSetCallback(control, 'LEAVEWINDOW_CB', func)
	return control
}

pub fn (control &Control) on_extended(func ExtendedFunc) &Control {
	C.IupSetCallback(control, 'EXTENDED_CB', func)
	return control
}

pub fn (control &Control) on_extra_button(func ExtraButtonFunc) &Control {
	C.IupSetCallback(control, 'EXTRABUTTON_CB', func)
	return control
}

pub fn (control &Control) on_flat_action(func FlatActionFunc) &Control {
	C.IupSetCallback(control, 'FLAT_ACTION', func)
	return control
}

// on_focused occurs when an element receives focus
pub fn (control &Control) on_focused(func FocusedFunc) &Control {
	C.IupSetCallback(control, 'GETFOCUS_CB', func)
	return control
}

// on_help occurs when the focused element has the "help" method called on it
pub fn (control &Control) on_help(func HelpFunc) &Control {
	C.IupSetCallback(control, 'HELP_CB', func)
	return control
}

// on_key occurs when any key is pressed down
pub fn (control &Control) on_key(func KeyFunc) &Control {
	C.IupSetCallback(control, 'K_ANY', func)
	return control
}

// on_key_press occurs when a key is fully pressed and released
pub fn (control &Control) on_key_press(func KeyPressFunc) &Control {
	C.IupSetCallback(control, 'KEYPRESS_CB', func)
	return control
}

pub fn (control &Control) on_map(func MapFunc) &Control {
	C.IupSetCallback(control, 'MAP_CB', func)
	return control
}

pub fn (control &Control) on_motion(func MotionFunc) &Control {
	C.IupSetCallback(control, 'MOTION_CB', func)
	return control
}

// on_mouse_button occurs when any mouse button is pressed
pub fn (control &Control) on_mouse_button(func MouseButtonFunc) &Control {
	C.IupSetCallback(control, 'BUTTON_CB', func)
	return control
}

// on_mouse_move occurs whenever mouse movement has happened
pub fn (control &Control) on_mouse_move(func MouseMoveFunc) &Control {
	C.IupSetCallback(control, 'MOUSEMOVE_CB', func)
	return control
}

pub fn (control &Control) on_multiselect(func MultiSelectFunc) &Control {
	C.IupSetCallback(control, 'MULTISELECT_CB', func)
	return control
}

pub fn (control &Control) on_multiselection(func MultiSelectionFunc) &Control {
	C.IupSetCallback(control, 'MULTISELECTION_CB', func)
	return control
}

pub fn (control &Control) on_multiunselect(func MultiUnselectionFunc) &Control {
	C.IupSetCallback(control, 'MULTIUNSELECTION_CB', func)
	return control
}

pub fn (control &Control) on_node_removed(func NodeRemovedFunc) &Control {
	C.IupSetCallback(control, 'NODEREMOVED_CB', func)
	return control
}

pub fn (control &Control) on_open_close(func OpenCloseFunc) &Control {
	C.IupSetCallback(control, 'OPENCLOSE_CB', func)
	return control
}

pub fn (control &Control) on_rename(func RenameFunc) &Control {
	C.IupSetCallback(control, 'RENAME_CB', func)
	return control
}

// on_resize occurs whenever an element is resized
pub fn (control &Control) on_resize(func ResizeFunc) &Control {
	C.IupSetCallback(control, 'RESIZE_CB', func)
	return control
}

// on_right_click occurs whenever a right-click even is detected
pub fn (control &Control) on_right_click(func RightClickFunc) &Control {
	C.IupSetCallback(control, 'RIGHTCLICK_CB', func)
	return control
}

pub fn (control &Control) on_restored(func RestoredFunc) &Control {
	C.IupSetCallback(control, 'RESTORED_CB', func)
	return control
}

// on_select occurs whenever a value is selected in an element
pub fn (control &Control) on_select(func SelectFunc) &Control {
	C.IupSetCallback(control, 'SELECT_CB', func)
	return control
}

pub fn (control &Control) on_selection(func SelectionFunc) &Control {
	C.IupSetCallback(control, 'SELECTION_CB', func)
	return control
}

pub fn (control &Control) on_scroll(func ScrollFunc) &Control {
	C.IupSetCallback(control, 'SCROLL_CB', func)
	return control
}

pub fn (control &Control) on_show_rename(func ShowRenameFunc) &Control {
	C.IupSetCallback(control, 'SHOWRENAME_CB', func)
	return control
}

pub fn (control &Control) on_switch(func SwitchFunc) &Control {
	C.IupSetCallback(control, 'SWITCH_CB', func)
	return control
}

// on_tab_change occurs when a tab is selected
pub fn (control &Control) on_tab_change(func TabChangeFunc) &Control {
	C.IupSetCallback(control, 'TABCHANGE_CB', func)
	return control
}

pub fn (control &Control) on_tab_change_pos(func TabChangePosFunc) &Control {
	C.IupSetCallback(control, 'TABCHANGEPOS_CB', func)
	return control
}

// on_tab_close occurs when a tab is closed
pub fn (control &Control) on_tab_close(func TabCloseFunc) &Control {
	C.IupSetCallback(control, 'TABCLOSE_CB', func)
	return control
}

// on_toggle_value occurs when a toggle element is changed
pub fn (control &Control) on_toggle_value(func ToggleValueFunc) &Control {
	C.IupSetCallback(control, 'TOGGLEVALUE_CB', func)
	return control
}

// on_unfocused occurs when an element loses focus
pub fn (control &Control) on_unfocused(func UnfocusedFunc) &Control {
	C.IupSetCallback(control, 'KILLFOCUS_CB', func)
	return control
}

pub fn (control &Control) on_unmap(func UnmapFunc) &Control {
	C.IupSetCallback(control, 'UNMAP_CB', func)
	return control
}

// on_value_changed occurs when the value of an element is modified
pub fn (control &Control) on_value_changed(func ValueChangedFunc) &Control {
	C.IupSetCallback(control, 'VALUECHANGED_CB', func)
	return control
}

// on_value_changing occurs when the value of an element is being actively changed
// (but the element still has focus so 'change' has not happened)
pub fn (control &Control) on_value_changing(func ValueChangingFunc) &Control {
	C.IupSetCallback(control, 'VALUECHANGING_CB', func)
	return control
}

// on_wheel occurs when the scroll wheel on the mouse is adjusted
pub fn (control &Control) on_wheel(func WheelFunc) &Control {
	C.IupSetCallback(control, 'WHEEL_CB', func)
	return control
}
