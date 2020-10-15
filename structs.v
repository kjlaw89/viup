module viup

struct Control {
mut:
	sig            [4]byte
	iclass         voidptr
	attr           voidptr
	serial         int
	handle         voidptr
	expand         int
	flags          int
pub:
	x              int
	y              int
	user_width     int
	user_height    int
	natural_width  int
	natural_height int
	current_width  int
	current_height int
	parent         &Control
	first_child    &Control
	sibling        &Control
	data           voidptr
}
