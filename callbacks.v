module viup

fn C.IupSetCallback(&Ihandle, charptr, voidptr)
fn C.IupSetFunction(charptr, voidptr)

pub type ActionFunc = fn (&Ihandle) FuncResult

pub type BranchOpenFunc = fn (&Ihandle, int) FuncResult

pub type BranchCloseFunc = fn (&Ihandle, int) FuncResult

pub type ButtonFunc = fn (&Ihandle) FuncResult

pub type ButtonPressFunc = fn (&Ihandle, f64) FuncResult

pub type ButtonReleaseFunc = fn (&Ihandle, f64) FuncResult

pub type CaretFunc = fn (&Ihandle, int, int, int) FuncResult

pub type CellFunc = fn (&Ihandle, int) FuncResult

pub type ChangeFunc = fn (&Ihandle, byte, byte, byte) FuncResult

pub type DblClickFunc = fn (&Ihandle, int, charptr) FuncResult

pub type DestroyFunc = fn (&Ihandle) FuncResult

pub type DetachedFunc = fn (&Ihandle, &Ihandle, int, int) FuncResult

pub type DragFunc = fn (&Ihandle, byte, byte, byte) FuncResult

pub type DragDropFunc = fn (&Ihandle, int, int, int, int) FuncResult

pub type DrawFunc = fn (&Ihandle, f32, f32) FuncResult

pub type DropDownFunc = fn (&Ihandle, int) FuncResult

pub type DropFilesFunc = fn (&Ihandle, charptr, int, int, int) FuncResult

pub type EditFunc = fn (&Ihandle, int, charptr) FuncResult

pub type EnteredFunc = fn (&Ihandle) FuncResult

pub type EntryFunc = fn ()

pub type ExecuteBranchFunc = fn (&Ihandle, int) FuncResult

pub type ExecuteLeafFunc = fn (&Ihandle, int) FuncResult

pub type ExitFunc = fn ()

pub type ExitedFunc = fn (&Ihandle) FuncResult

pub type ExtendedFunc = fn (&Ihandle) FuncResult

pub type ExtraButtonFunc = fn (&Ihandle, int, bool) FuncResult

pub type FlatActionFunc = fn (&Ihandle) FuncResult

pub type FocusedFunc = fn (&Ihandle) FuncResult

pub type HelpFunc = fn (&Ihandle) FuncResult

pub type IdleFunc = fn ()

pub type KeyFunc = fn (&Ihandle, int) FuncResult

pub type KeyPressFunc = fn (&Ihandle, int, int) FuncResult

pub type LayoutUpdateFunc = fn (&Ihandle) FuncResult

pub type MapFunc = fn (&Ihandle) int

pub type MotionFunc = fn (&Ihandle, int, int, charptr) FuncResult

pub type MouseButtonFunc = fn (&Ihandle, MouseButton, bool, int, int, charptr) FuncResult

pub type MouseMoveFunc = fn (&Ihandle, f64) FuncResult

pub type MultiSelectFunc = fn (&Ihandle, charptr) FuncResult

pub type MultiSelectionFunc = fn (&Ihandle, voidptr, int) FuncResult

pub type MultiUnselectionFunc = fn (&Ihandle, voidptr, int) FuncResult

pub type NodeRemovedFunc = fn (&Ihandle, voidptr) FuncResult

pub type MenuCloseFunc = fn (&Ihandle) FuncResult

pub type MenuOpenFunc = fn (&Ihandle) FuncResult

pub type OpenCloseFunc = fn (&Ihandle, int) FuncResult

pub type RenameFunc = fn (&Ihandle, int, charptr) FuncResult

pub type ResizeFunc = fn (&Ihandle, int, int) FuncResult

pub type RestoredFunc = fn (&Ihandle, &Ihandle, int, int) FuncResult

pub type RightClickFunc = fn (&Ihandle, int) FuncResult

pub type SelectFunc = fn (&Ihandle, int, int) FuncResult

pub type SelectionFunc = fn (&Ihandle, int, int) FuncResult

pub type ShowRenameFunc = fn (&Ihandle, int) FuncResult

pub type ScrollFunc = fn (&Ihandle, int, f32, f32) FuncResult

pub type SpinFunc = fn (&Ihandle, int) FuncResult

pub type SwitchFunc = fn (&Ihandle, int, int) FuncResult

pub type TabChangeFunc = fn (&Ihandle, &Ihandle, &Ihandle) FuncResult

pub type TabChangePosFunc = fn (&Ihandle, int, int) FuncResult

pub type TabCloseFunc = fn (&Ihandle, int) FuncResult

pub type ToggleValueFunc = fn (&Ihandle, int, int) FuncResult

pub type UnfocusedFunc = fn (&Ihandle)

pub type UnmapFunc = fn (&Ihandle) FuncResult

pub type ValueChangedFunc = fn (&Ihandle) FuncResult

pub type ValueChangingFunc = fn (&Ihandle, int) FuncResult

pub type WheelFunc = fn (&Ihandle, f32, int, int, charptr) FuncResult

// on_action is triggered when the primary function of the element is performed (e.g. clicking a button)
pub fn (control &Ihandle) on_action(func ActionFunc) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

// on_branch_open is triggered when the tree branch is opened
pub fn (control &Ihandle) on_branch_open(func BranchOpenFunc) &Ihandle {
	C.IupSetCallback(control, c'BRANCHOPEN_CB', func)
	return unsafe { control }
}

// on_branch_close is triggered when the tree branch is closed
pub fn (control &Ihandle) on_branch_close(func BranchCloseFunc) &Ihandle {
	C.IupSetCallback(control, c'BRANCHCLOSE_CB', func)
	return unsafe { control }
}

// on_button occurs when a button is clicked
pub fn (control &Ihandle) on_button(func ButtonFunc) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return unsafe { control }
}

// on_button_press occurs when a button is pressed, but not released
pub fn (control &Ihandle) on_button_press(func ButtonPressFunc) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_PRESS_CB', func)
	return unsafe { control }
}

// on_button_release occurs when a button is pressed and then released
pub fn (control &Ihandle) on_button_release(func ButtonReleaseFunc) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_RELEASE_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_caret(func CaretFunc) &Ihandle {
	C.IupSetCallback(control, c'CARET_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_cell(func CellFunc) &Ihandle {
	C.IupSetCallback(control, c'CELL_CB', func)
	return unsafe { control }
}

// on_change occurs when the value in an input is changed
pub fn (control &Ihandle) on_change(func ChangeFunc) &Ihandle {
	C.IupSetCallback(control, c'CHANGE_CB', func)
	return unsafe { control }
}

// on_dbl_click occurs when an element is double-clicked
pub fn (control &Ihandle) on_dbl_click(func DblClickFunc) &Ihandle {
	C.IupSetCallback(control, c'DBLCLICK_CB', func)
	return unsafe { control }
}

// on_destroy occurs when an element is freed
pub fn (control &Ihandle) on_destroy(func DestroyFunc) &Ihandle {
	C.IupSetCallback(control, c'DESTROY_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_detached(func DetachedFunc) &Ihandle {
	C.IupSetCallback(control, c'DETACHED_CB', func)
	return unsafe { control }
}

// on_drag occurs when an element is being dragged
pub fn (control &Ihandle) on_drag(func DragFunc) &Ihandle {
	C.IupSetCallback(control, c'DRAG_CB', func)
	return unsafe { control }
}

// on_drag_drop occurs when an element is dragged and then dropped
pub fn (control &Ihandle) on_drag_drop(func DragDropFunc) &Ihandle {
	C.IupSetCallback(control, c'DRAGDROP_CB', func)
	return unsafe { control }
}

// on_draw occurs when an element needs to be redrawn (applies to Canvas elements)
pub fn (control &Ihandle) on_draw(func DrawFunc) &Ihandle {
	C.IupSetCallback(control, c'ACTION', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_drop_down(func DropDownFunc) &Ihandle {
	C.IupSetCallback(control, c'DROPDOWN_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_drop_files(func DropFilesFunc) &Ihandle {
	C.IupSetCallback(control, c'DROPFILES_CB', func)
	return unsafe { control }
}

// on_edit occurs when an element is being edited
pub fn (control &Ihandle) on_edit(func EditFunc) &Ihandle {
	C.IupSetCallback(control, c'EDIT_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_entered(func EnteredFunc) &Ihandle {
	C.IupSetCallback(control, c'ENTERWINDOW_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_execute_branch(func ExecuteBranchFunc) &Ihandle {
	C.IupSetCallback(control, c'EXECUTEBRANCH_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_execute_left(func ExecuteLeafFunc) &Ihandle {
	C.IupSetCallback(control, c'EXECUTELEAF_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_exited(func ExitedFunc) &Ihandle {
	C.IupSetCallback(control, c'LEAVEWINDOW_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_extended(func ExtendedFunc) &Ihandle {
	C.IupSetCallback(control, c'EXTENDED_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_extra_button(func ExtraButtonFunc) &Ihandle {
	C.IupSetCallback(control, c'EXTRABUTTON_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_flat_action(func FlatActionFunc) &Ihandle {
	C.IupSetCallback(control, c'FLAT_ACTION', func)
	return unsafe { control }
}

// on_focused occurs when an element receives focus
pub fn (control &Ihandle) on_focused(func FocusedFunc) &Ihandle {
	C.IupSetCallback(control, c'GETFOCUS_CB', func)
	return unsafe { control }
}

// on_help occurs when the focused element has the "help" method called on it
pub fn (control &Ihandle) on_help(func HelpFunc) &Ihandle {
	C.IupSetCallback(control, c'HELP_CB', func)
	return unsafe { control }
}

// on_key occurs when any key is pressed down
pub fn (control &Ihandle) on_key(func KeyFunc) &Ihandle {
	C.IupSetCallback(control, c'K_ANY', func)
	return unsafe { control }
}

// on_key_press occurs when a key is fully pressed and released
pub fn (control &Ihandle) on_key_press(func KeyPressFunc) &Ihandle {
	C.IupSetCallback(control, c'KEYPRESS_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_map(func MapFunc) &Ihandle {
	C.IupSetCallback(control, c'MAP_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_motion(func MotionFunc) &Ihandle {
	C.IupSetCallback(control, c'MOTION_CB', func)
	return unsafe { control }
}

// on_mouse_button occurs when any mouse button is pressed
pub fn (control &Ihandle) on_mouse_button(func MouseButtonFunc) &Ihandle {
	C.IupSetCallback(control, c'BUTTON_CB', func)
	return unsafe { control }
}

// on_mouse_move occurs whenever mouse movement has happened
pub fn (control &Ihandle) on_mouse_move(func MouseMoveFunc) &Ihandle {
	C.IupSetCallback(control, c'MOUSEMOVE_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_multiselect(func MultiSelectFunc) &Ihandle {
	C.IupSetCallback(control, c'MULTISELECT_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_multiselection(func MultiSelectionFunc) &Ihandle {
	C.IupSetCallback(control, c'MULTISELECTION_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_multiunselect(func MultiUnselectionFunc) &Ihandle {
	C.IupSetCallback(control, c'MULTIUNSELECTION_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_node_removed(func NodeRemovedFunc) &Ihandle {
	C.IupSetCallback(control, c'NODEREMOVED_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_open_close(func OpenCloseFunc) &Ihandle {
	C.IupSetCallback(control, c'OPENCLOSE_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_rename(func RenameFunc) &Ihandle {
	C.IupSetCallback(control, c'RENAME_CB', func)
	return unsafe { control }
}

// on_resize occurs whenever an element is resized
pub fn (control &Ihandle) on_resize(func ResizeFunc) &Ihandle {
	C.IupSetCallback(control, c'RESIZE_CB', func)
	return unsafe { control }
}

// on_right_click occurs whenever a right-click even is detected
pub fn (control &Ihandle) on_right_click(func RightClickFunc) &Ihandle {
	C.IupSetCallback(control, c'RIGHTCLICK_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_restored(func RestoredFunc) &Ihandle {
	C.IupSetCallback(control, c'RESTORED_CB', func)
	return unsafe { control }
}

// on_select occurs whenever a value is selected in an element
pub fn (control &Ihandle) on_select(func SelectFunc) &Ihandle {
	C.IupSetCallback(control, c'SELECT_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_selection(func SelectionFunc) &Ihandle {
	C.IupSetCallback(control, c'SELECTION_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_scroll(func ScrollFunc) &Ihandle {
	C.IupSetCallback(control, c'SCROLL_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_show_rename(func ShowRenameFunc) &Ihandle {
	C.IupSetCallback(control, c'SHOWRENAME_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_switch(func SwitchFunc) &Ihandle {
	C.IupSetCallback(control, c'SWITCH_CB', func)
	return unsafe { control }
}

// on_tab_change occurs when a tab is selected
pub fn (control &Ihandle) on_tab_change(func TabChangeFunc) &Ihandle {
	C.IupSetCallback(control, c'TABCHANGE_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_tab_change_pos(func TabChangePosFunc) &Ihandle {
	C.IupSetCallback(control, c'TABCHANGEPOS_CB', func)
	return unsafe { control }
}

// on_tab_close occurs when a tab is closed
pub fn (control &Ihandle) on_tab_close(func TabCloseFunc) &Ihandle {
	C.IupSetCallback(control, c'TABCLOSE_CB', func)
	return unsafe { control }
}

// on_toggle_value occurs when a toggle element is changed
pub fn (control &Ihandle) on_toggle_value(func ToggleValueFunc) &Ihandle {
	C.IupSetCallback(control, c'TOGGLEVALUE_CB', func)
	return unsafe { control }
}

// on_unfocused occurs when an element loses focus
pub fn (control &Ihandle) on_unfocused(func UnfocusedFunc) &Ihandle {
	C.IupSetCallback(control, c'KILLFOCUS_CB', func)
	return unsafe { control }
}

pub fn (control &Ihandle) on_unmap(func UnmapFunc) &Ihandle {
	C.IupSetCallback(control, c'UNMAP_CB', func)
	return unsafe { control }
}

// on_value_changed occurs when the value of an element is modified
pub fn (control &Ihandle) on_value_changed(func ValueChangedFunc) &Ihandle {
	C.IupSetCallback(control, c'VALUECHANGED_CB', func)
	return unsafe { control }
}

// on_value_changing occurs when the value of an element is being actively changed
// (but the element still has focus so 'change' has not happened)
pub fn (control &Ihandle) on_value_changing(func ValueChangingFunc) &Ihandle {
	C.IupSetCallback(control, c'VALUECHANGING_CB', func)
	return unsafe { control }
}

// on_wheel occurs when the scroll wheel on the mouse is adjusted
pub fn (control &Ihandle) on_wheel(func WheelFunc) &Ihandle {
	C.IupSetCallback(control, c'WHEEL_CB', func)
	return unsafe { control }
}
