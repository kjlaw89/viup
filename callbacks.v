module viup

pub type ActionFunc = fn(&Control) FuncResult
pub type BranchOpenFunc = fn(&Control, int) FuncResult
pub type BranchCloseFunc = fn(&Control, int) FuncResult
pub type ButtonFunc = fn(&Control) FuncResult
pub type ButtonPressFunc = fn(&Control, f64) FuncResult
pub type ButtonReleaseFunc = fn(&Control, f64) FuncResult
pub type CaretFunc = fn(&Control, int, int , int) FuncResult
pub type CellFunc = fn(&Control, int) FuncResult
pub type ChangeFunc = fn(&Control, byte, byte, byte) FuncResult
pub type DblClickFunc = fn(&Control, int, charptr) FuncResult
pub type DestroyFunc = fn(&Control) FuncResult
pub type DetachedFunc = fn(&Control, &Control, int, int) FuncResult
pub type DragFunc = fn(&Control, byte, byte, byte) FuncResult
pub type DragDropFunc = fn(&Control, int, int, int, int) FuncResult
pub type DropDownFunc = fn(&Control, int) FuncResult
pub type DropFilesFunc = fn(&Control, charptr, int, int, int) FuncResult
pub type EditFunc = fn(&Control, int, charptr) FuncResult
pub type EnteredFunc = fn(&Control) FuncResult
pub type EntryFunc = fn()
pub type ExecuteBranchFunc = fn(&Control, int) FuncResult
pub type ExecuteLeafFunc = fn(&Control, int) FuncResult
pub type ExitFunc = fn()
pub type ExitedFunc = fn(&Control) FuncResult
pub type ExtendedFunc = fn(&Control) FuncResult
pub type ExtraButtonFunc = fn(&Control, int, bool) FuncResult
pub type FlatActionFunc = fn(&Control) FuncResult
pub type FocusedFunc = fn(&Control) FuncResult
pub type HelpFunc = fn(&Control) FuncResult
pub type IdleFunc = fn()
pub type KeyFunc = fn(&Control, int) FuncResult
pub type KeyPressFunc = fn(&Control, int, int) FuncResult
pub type LayoutUpdateFunc = fn(&Control) FuncResult
pub type MapFunc = fn(&Control) int
pub type MotionFunc = fn(&Control, int, int, charptr) FuncResult
pub type MouseButtonFunc = fn(&Control, MouseButton, bool, int, int, charptr) FuncResult
pub type MouseMoveFunc = fn(&Control, f64) FuncResult
pub type MultiSelectFunc = fn(&Control, charptr) FuncResult
pub type MultiSelectionFunc = fn(&Control, voidptr, int) FuncResult
pub type MultiUnselectionFunc = fn(&Control, voidptr, int) FuncResult
pub type NodeRemovedFunc = fn(&Control, voidptr) FuncResult
pub type MenuCloseFunc = fn(&Control) FuncResult
pub type MenuOpenFunc = fn(&Control) FuncResult
pub type OpenCloseFunc = fn(&Control, int) FuncResult
pub type RenameFunc = fn(&Control, int, charptr) FuncResult
pub type ResizeFunc = fn(&Control, int, int) FuncResult
pub type RestoredFunc = fn(&Control, &Control, int, int) FuncResult
pub type RightClickFunc = fn(&Control, int) FuncResult
pub type SelectFunc = fn(&Control, int, int) FuncResult
pub type SelectionFunc = fn(&Control, int, int) FuncResult
pub type ShowRenameFunc = fn(&Control, int) FuncResult
pub type ScrollFunc = fn(&Control, int, f32, f32) FuncResult
pub type SpinFunc = fn(&Control, int) FuncResult
pub type SwitchFunc = fn(&Control, int, int) FuncResult
pub type TabChangeFunc = fn(&Control, &Control, &Control) FuncResult
pub type TabChangePosFunc = fn(&Control, int, int) FuncResult
pub type TabCloseFunc = fn(&Control, int) FuncResult
pub type ToggleValueFunc = fn(&Control, int, int) FuncResult
pub type UnfocusedFunc = fn(&Control)
pub type UnmapFunc = fn(&Control) FuncResult
pub type ValueChangedFunc = fn(&Control) FuncResult
pub type ValueChangingFunc = fn(&Control, int) FuncResult
pub type WheelFunc = fn(&Control, f32, int, int, charptr) FuncResult

type VIUPFunc = 
	ActionFunc | BranchOpenFunc | BranchCloseFunc | ButtonFunc | ButtonPressFunc | ButtonReleaseFunc | CaretFunc |
	CellFunc | ChangeFunc | DblClickFunc | DestroyFunc | DetachedFunc | DragFunc | DragDropFunc | DropDownFunc |
	DropFilesFunc | EditFunc | EnteredFunc | EntryFunc | ExecuteBranchFunc | ExecuteLeafFunc | ExitFunc |
	ExitedFunc | ExtendedFunc | ExtraButtonFunc | FlatActionFunc | FocusedFunc | HelpFunc | IdleFunc | KeyFunc |
	KeyPressFunc | LayoutUpdateFunc | MapFunc | MenuCloseFunc | MenuOpenFunc | MotionFunc | MouseButtonFunc |
	MouseMoveFunc | MultiSelectFunc | MultiSelectionFunc | MultiUnselectionFunc | NodeRemovedFunc | OpenCloseFunc |
	ResizeFunc | RestoredFunc | RenameFunc | RightClickFunc | SelectFunc | SelectionFunc | ShowRenameFunc | ScrollFunc |
	SpinFunc | SwitchFunc | TabChangeFunc | TabChangePosFunc | TabCloseFunc | ToggleValueFunc | UnmapFunc | UnfocusedFunc |
	ValueChangedFunc | ValueChangingFunc | WheelFunc

fn C.IupSetCallback(voidptr, charptr, VIUPCallback)
fn C.IupSetFunction(charptr, VIUPCallback)

pub fn callback(func VIUPFunc) {
	match func {
		EntryFunc      { C.IupSetFunction("ENTRY_POINT", func) }
		ExitFunc       { C.IupSetFunction("EXIT_CB", func) }
		IdleFunc       { C.IupSetFunction("IDLE_ACTION", func) }
		else {}
	}
}

// callbacks adds the provided callbacks to the global scope
pub fn callbacks(funcs ...VIUPFunc) {
	for f in funcs {
		callback(f)
	}
}

// callback adds a callback to this `Control` and
// returns `Control` back for chaining
pub fn (control &Control) callback(func VIUPFunc) &Control {
	match func {
		ActionFunc           { C.IupSetCallback(control, "ACTION", func) }
		BranchOpenFunc       { C.IupSetCallback(control, "BRANCHOPEN_CB", func) }
		BranchCloseFunc      { C.IupSetCallback(control, "BRANCHCLOSE_CB", func) }
		ButtonFunc           { C.IupSetCallback(control, "BUTTON_CB", func) }
		ButtonPressFunc      { C.IupSetCallback(control, "BUTTON_PRESS_CB", func) }
		ButtonReleaseFunc    { C.IupSetCallback(control, "BUTTON_RELEASE_CB", func) }
		CaretFunc            { C.IupSetCallback(control, "CARET_CB", func) }
		CellFunc             { C.IupSetCallback(control, "CELL_CB", func) }
		ChangeFunc           { C.IupSetCallback(control, "CHANGE_CB", func) }
		DblClickFunc         { C.IupSetCallback(control, "DBLCLICK_CB", func) }
		DestroyFunc          { C.IupSetCallback(control, "DESTROY_CB", func) }
		DetachedFunc         { C.IupSetCallback(control, "DETACHED_CB", func) }
		DragFunc             { C.IupSetCallback(control, "DRAG_CB", func) }
		DragDropFunc         { C.IupSetCallback(control, "DRAGDROP_CB", func) }
		DropDownFunc         { C.IupSetCallback(control, "DROPDOWN_CB", func) }
		DropFilesFunc        { C.IupSetCallback(control, "DROPFILES_CB", func) }
		EditFunc             { C.IupSetCallback(control, "EDIT_CB", func) }
		EnteredFunc          { C.IupSetCallback(control, "ENTERWINDOW_CB", func) }
		ExecuteBranchFunc    { C.IupSetCallback(control, "EXECUTEBRANCH_CB", func) }
		ExecuteLeafFunc      { C.IupSetCallback(control, "EXECUTELEAF_CB", func) }
		ExitedFunc           { C.IupSetCallback(control, "LEAVEWINDOW_CB", func) }
		ExtendedFunc         { C.IupSetCallback(control, "EXTENDED_CB", func) }
		ExtraButtonFunc      { C.IupSetCallback(control, "EXTRABUTTON_CB", func) }
		FlatActionFunc       { C.IupSetCallback(control, "FLAT_ACTION", func) }
		FocusedFunc          { C.IupSetCallback(control, "GETFOCUS_CB", func) }
		HelpFunc             { C.IupSetCallback(control, "HELP_CB", func) }
		KeyFunc              { C.IupSetCallback(control, "K_ANY", func) }
		KeyPressFunc         { C.IupSetCallback(control, "KEYPRESS_CB", func) }
		MapFunc              { C.IupSetCallback(control, "MAP_CB", func) }
		MotionFunc           { C.IupSetCallback(control, "MOTION_CB", func) }
		MouseButtonFunc      { C.IupSetCallback(control, "BUTTON_CB", func) }
		MouseMoveFunc        { C.IupSetCallback(control, "MOUSEMOVE_CB", func) }
		MultiSelectFunc      { C.IupSetCallback(control, "MULTISELECT_CB", func) }
		MultiSelectionFunc   { C.IupSetCallback(control, "MULTISELECTION_CB", func) }
		MultiUnselectionFunc { C.IupSetCallback(control, "MULTIUNSELECTION_CB", func) }
		NodeRemovedFunc      { C.IupSetCallback(control, "NODEREMOVED_CB", func) }
		OpenCloseFunc        { C.IupSetCallback(control, "OPENCLOSE_CB", func) }
		RenameFunc           { C.IupSetCallback(control, "RENAME_CB", func) }
		ResizeFunc           { C.IupSetCallback(control, "RESIZE_CB", func) }
		RightClickFunc       { C.IupSetCallback(control, "RIGHTCLICK_CB", func) }
		RestoredFunc         { C.IupSetCallback(control, "RESTORED_CB", func) }
		SelectFunc           { C.IupSetCallback(control, "SELECT_CB", func) }
		SelectionFunc        { C.IupSetCallback(control, "SELECTION_CB", func) }
		ScrollFunc           { C.IupSetCallback(control, "SCROLL_CB", func) }
		ShowRenameFunc       { C.IupSetCallback(control, "SHOWRENAME_CB", func) }
		SwitchFunc           { C.IupSetCallback(control, "SWITCH_CB", func) }
		TabChangeFunc        { C.IupSetCallback(control, "TABCHANGE_CB", func) }
		TabChangePosFunc     { C.IupSetCallback(control, "TABCHANGEPOS_CB", func) }
		TabCloseFunc         { C.IupSetCallback(control, "TABCLOSE_CB", func) }
		ToggleValueFunc      { C.IupSetCallback(control, "TOGGLEVALUE_CB", func) }
		UnfocusedFunc        { C.IupSetCallback(control, "KILLFOCUS_CB", func) }
		UnmapFunc            { C.IupSetCallback(control, "UNMAP_CB", func) }
		ValueChangedFunc     { C.IupSetCallback(control, "VALUECHANGED_CB", func) }
		ValueChangingFunc    { C.IupSetCallback(control, "VALUECHANGING_CB", func) }
		WheelFunc            { C.IupSetCallback(control, "WHEEL_CB", func) }
		else {}
	}

	return control
}

// callbacks adds the provided callbacks to `Control` and
// returns `Control` back for chaining
pub fn (control &Control) callbacks(funcs ...VIUPFunc) &Control {
	for f in funcs {
		control.callback(f)
	}

	return control
}