module viup

pub fn is_shift(key Key) bool {
	return key & 0x10000000 > 0 || (key >= 65 && key <= 90)
}

pub fn is_ctrl(key Key) bool {
	return key & 0x20000000 > 0
}

pub fn is_alt(key Key) bool {
	return key & 0x40000000 > 0
}

pub fn is_sys(key Key) bool {
	return key & 0x80000000 > 0
}

pub fn get_key(key Key) Key {
	return key & ~(0x10000000 | 0x20000000 | 0x40000000 | 0x80000000)
}