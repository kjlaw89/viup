module menu

import viup { Ihandle, cleanup_iup, init_iup }

#flag -I @VMODROOT/headers/iup
#flag windows -L @VMODROOT/windows
#flag linux -L /usr/lib/iup

#include "iup.h"

// `Menu` inherits from `Ihandle`
[heap]
pub struct Menu {
	Ihandle
}

fn C.IupItem(charptr, charptr) &Menu
fn C.IupMenuv(&Menu) &Menu
fn C.IupSeparator() &Menu
fn C.IupSubmenu(charptr, &Menu) &Menu

fn init() {
	init_iup()
}

fn cleanup() {
	cleanup_iup()
}

// item is a component that can be used in a `menu` to
// that is tied to a specific action or event
pub fn item(title string, attrs ...string) &Menu {
	menu_item := C.IupItem(title.str, 0)
	menu_item.set_attrs(...attrs)
	return menu_item
}

// menu is an application container for menu items
pub fn menu(children []&Menu, attrs ...string) &Menu {
	mut ptrs := []&Menu{}
	for child in children {
		ptrs << child
	}
	ptrs << unsafe { &Menu(nil) } // Add null value
	menu := C.IupMenuv(ptrs.data)
	menu.set_attrs(...attrs)
	return menu
}

// separator creates a simple horizontal line in a `menu`
pub fn separator(attrs ...string) &Menu {
	menu_sep := C.IupSeparator()
	menu_sep.set_attrs(...attrs)
	return menu_sep
}

// sub_menu is a container control for `menu` controls
pub fn sub_menu(title string, child &Menu, attrs ...string) &Menu {
	sub_menu := C.IupSubmenu(title.str, child)
	sub_menu.set_attrs(...attrs)
	return sub_menu
}

// set_handle is a helper function for `Menu` that calls the global
// `set_handle` function. Returns back an instance of `Menu` for chaining
pub fn (menu &Menu) set_handle(name string) &Menu {
	C.IupSetHandle(name.str, &Ihandle(menu))
	return menu
}

// get_menu_handle returns a component with the provided handle name
// Note: This method can cause issues with autofree
pub fn get_menu_handle(handle string) &Menu {
	return &Menu(C.IupGetHandle(handle.str))
}

// set_attr sets an attribute on `Menu` and
// returns `Menu` back for chaining
pub fn (menu &Menu) set_attr(name string, value string) &Menu {
	C.IupSetStrAttribute(&Ihandle(menu), name.to_upper().trim_space().str, value.trim_space().str)

	return menu
}

// set_attrs takes all x=x values and applies them to `Menu` and
// returns `Menu` back for chaining
pub fn (menu &Menu) set_attrs(attrs ...string) &Menu {
	for attr in attrs {
		split := attr.split_nth('=', 2)
		if split.len == 1 {
			continue
		}
		menu.set_attr(split[0], split[1])
	}

	return menu
}

// set_data associates the provided `data` with `Menu` and
// returns `Menu` back for chaining
pub fn (menu &Menu) set_data(name string, data voidptr) &Menu {
	C.IupSetAttribute(&Ihandle(menu), '${name}_data'.to_upper().trim_space().str, charptr(data))

	return menu
}

// unset_attr clears the provided attribute
pub fn (menu &Menu) unset_attr(name string) &Menu {
	C.IupSetAttribute(&Ihandle(menu), name.to_upper().trim_space().str, C.NULL)
	return menu
}

// on_action is triggered when the menu is click
pub fn (menu &Menu) on_action(func viup.IFn) &Menu {
	C.IupSetCallback(&Ihandle(menu), c'ACTION', func)
	return menu
}
