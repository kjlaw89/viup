module viup

pub struct Color {
pub mut:
	r byte
	g byte
	b byte
	a byte = 255
}

// parse_color parses the provided color string
// and converts it to a valid `Color`
pub fn parse_color(color string) Color {
	mut obj := Color{}
	if color == '' {
		return obj
	}

	split := color.split(' ')
	if split.len > 0 {
		obj.r = split[0].u8()
	}

	if split.len > 1 {
		obj.g = split[1].u8()
	}

	if split.len > 2 {
		obj.b = split[2].u8()
	}

	if split.len > 3 {
		obj.a = split[3].u8()
	}

	return obj
}

// show_picker is a helper function to show a color_dialog. It
// will automatically show the color dialog with this `Color`s
// values pre-selected and returns back the new Color on select
// as well as all of the colors in the color table
pub fn (color Color) show_picker() (Color, []Color) {
	dialog := color_dialog('value=${color.r} ${color.g} ${color.b}', 'alpha=${color.a}',
		'showhex=yes', 'showcolortable=yes', 'title=Color Chooser')

	dialog.popup(pos_current, pos_current)

	if dialog.get_bool('status') {
		value := dialog.get_attr('value')
		colortable := dialog.get_attr('colortable')

		mut colors := []Color{}
		split := colortable.split(';')
		for c in split {
			colors << parse_color(c)
		}

		parsed := parse_color(value)
		return parsed, colors
	}

	return color, []Color{len: 0}
}

// str converts the color to a IUP valid string
// Example format: 200 150 0 100
pub fn (color Color) str() string {
	return '${color.r} ${color.g} ${color.b} ${color.a}'
}
