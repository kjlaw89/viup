module viup

pub enum MouseButton {
	left = 49
	middle = 50
	right = 51
	button_4 = 52
	button_5 = 53
}

pub enum Pos {
	center = 0xFFFF
	left = 0xFFFE
	right = 0xFFFD
	mousepos = 0xFFFC
	current = 0xFFFB
	centerparent = 0xFFFA
	leftparent = 0xFFF9
	rightparent = 0xFFF8
}
