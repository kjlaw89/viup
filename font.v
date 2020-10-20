module viup

pub struct Font {
pub mut:
	bold      bool
	face      string
	italic    bool
	size      int     = 12
	strikeout bool
	underline bool
}

// parse_font parses the provided font string and
// converts it to a valid `Font`
pub fn parse_font(font string) Font {
	if font == "" {
		return Font{}
	}

	split_1 := font.split(',')
	if split_1.len <= 1 {
		return Font{ face: split_1[0] }
	}

	mut obj := Font{ face: split_1[0] }

	split_2 := split_1[1].trim_space().split(' ')
	for val in split_2 {
		match val.to_lower() {
			"bold"      { obj.bold = true }
			"italic"    { obj.italic = true }
			"strikeout" { obj.strikeout = true }
			"underline" { obj.underline = true }
			else        { obj.size = val.int() }
		}
	}

	return obj
}

// show_picker is a helper function to show a font_dialog. It
// will automatically show the font dialog with this `Font`s
// values pre-selected and returns back the new font on select
pub fn (font Font) show_picker() Font {
	dialog := viup.font_dialog("value=$font")
	dialog.popup(viup.Pos.current, viup.Pos.current)

	if dialog.get_bool("status") {
		value := dialog.get_attr("value")
		dialog.destroy()
		
		return parse_font(value)
	}

	dialog.destroy()
	return font
}

// str converts the font to a IUP valid string
// Example format: Segoe UI, Bold Italic Strikeout Underline 10
pub fn (font Font) str() string {
	mut output := '${font.face},'
	
	if font.bold {
		output += ' Bold'
	}

	if font.italic {
		output += ' Italic'
	}

	if font.strikeout {
		output += ' Strikeout'
	}

	if font.underline {
		output += ' Underline'
	}

	output += ' ${font.size}'
	return output
}