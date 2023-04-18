module viup

struct Font {
pub mut:
	condensed string
	face      string
	font      string
	italic    bool
	size      int = 12
	strikeout bool
	underline bool
	weight    string
}

// parse_font parses the provided font string and
// converts it to a valid `Font`
pub fn parse_font(font string) Font {
	if font == '' {
		return Font{
			font: font
		}
	}

	mut obj := Font{
		font: font
	}
	mut split := []string{}

	if font.contains(',') {
		split_1 := font.split(',')
		if split_1.len <= 1 {
			return Font{
				face: split_1[0]
				font: font
			}
		}

		obj.face = split_1[0]

		split = split_1[1].trim_space().split(' ')
	} else {
		split = font.split(' ')
		if split.len <= 1 {
			return Font{
				face: split[0]
				font: font
			}
		}

		obj.face = split[0]
		split.delete(0)
	}

	for val in split {
		match val.to_lower() {
			'ultra-light', 'light', 'medium', 'semi-bold', 'bold', 'ultra-bold', 'heavy' {
				obj.weight = val
			}
			'ultra-condensed', 'extra-condensed', 'condensed', 'semi-condensed', 'semi-expanded',
			'expanded', 'extra-expanded', 'ultra-expanded' {
				obj.condensed = val
			}
			'italic' {
				obj.italic = true
			}
			'strikeout' {
				obj.strikeout = true
			}
			'underline' {
				obj.underline = true
			}
			else {
				obj.size = val.int()
			}
		}
	}

	return obj
}

// show_picker is a helper function to show a font_dialog. It
// will automatically show the font dialog with this `Font`s
// values pre-selected and returns back the new font on select
pub fn (font Font) show_picker() Font {
	dialog := font_dialog('value=${font}')
	dialog.popup(pos_current, pos_current)

	if dialog.get_bool('status') {
		value := dialog.get_attr('value')
		parsed := parse_font(value)

		return parsed
	}

	return font
}

// str returns back the original font that was provided in `parse_font`
pub fn (font Font) str() string {
	return font.font
}
