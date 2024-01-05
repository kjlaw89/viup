module controls

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#flag -liupcontrols
#include "iup.h"
#include "iupcontrols.h"

// `Control` inherits from `Ihandle`
@[heap]
pub struct Control {
	Ihandle
}

fn C.IupControlsOpen() int
fn C.IupCells() &Control
fn C.IupMatrix(charptr) &Control
fn C.IupMatrixList() &Control
fn C.IupMatrixEx() &Control

// fn C.IupMatrixSetFormula(&Control, int, charptr, charptr)
// fn C.IupMatrixSetDynamic(&Control, charptr)

// controls_open must be called after `open`
fn init() {
	init_iup()
	C.IupControlsOpen()
}

fn cleanup() {
	cleanup_iup()
}

// cells creates a grid widget (set of cells) that enables several application-specific drawing, such as: chess tables, tiles editors, degrade scales, drawable spreadsheets and so forth
pub fn cells(attrs ...string) &Control {
	cells := C.IupCells()
	cells.set_attrs(...attrs)
	return cells
}

// matrix creates a matrix of alphanumeric fields, all values of the matrix fields are strings
pub fn matrix(attrs ...string) &Control {
	matrix := C.IupMatrix(0)
	matrix.set_attrs(...attrs)
	return matrix
}

// matrix_list creates an interface element that displays a list of items
pub fn matrix_list(attrs ...string) &Control {
	matrix_list := C.IupMatrixList()
	matrix_list.set_attrs(...attrs)
	return matrix_list
}

// matrix_ex an extension contrl for `matrix`, adds support for Import/Export, Clipboard, Undo/Redo, Find, Sort, Column Visibility, Numeric Columns, Numeric Units, Context Menu and others
pub fn matrix_ex(attrs ...string) &Control {
	matrix_ex := C.IupMatrixEx()
	matrix_ex.set_attrs(...attrs)
	return matrix_ex
}

/*
pub fn (matrix &Control) matrix_set_formula(col int, formula string, init string) &Control {
	C.IupMatrixSetFormula(matrix, col, formula.str, init.str)
	return matrix
}

pub fn (matrix &Control) matrix_set_dynamic(init string) &Control {
	C.IupMatrixSetDynamic(matrix, init.str)
	return matrix
}
*/
