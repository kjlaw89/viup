module viup

pub fn is_shift(key Key) bool {
	return int(key) & 0x10000000 > 0 || (int(key) >= 65 && int(key) <= 90)
}

pub fn is_ctrl(key Key) bool {
	return int(key) & 0x20000000 > 0
}

pub fn is_alt(key Key) bool {
	return int(key) & 0x40000000 > 0
}

pub fn is_sys(key Key) bool {
	return int(key) & 0x80000000 > 0
}

pub fn get_key(key Key) Key {
	return unsafe { Key(int(key) & ~(0x10000000 | 0x20000000 | 0x40000000 | 0x80000000)) }
}
