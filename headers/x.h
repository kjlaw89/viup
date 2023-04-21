/** \file
 * \brief User API
 * IUP - A Portable User Interface Toolkit
 * Tecgraf: Computer Graphics Technology Group, PUC-Rio, Brazil
 * http://www.tecgraf.puc-rio.br/iup  mailto:iup@tecgraf.puc-rio.br
 *
 * See Copyright Notice at the end of this file
 */

#ifndef __IUP_H
#define __IUP_H


/*** Start of inlined file: iupkey.h ***/
#ifndef __IUPKEY_H
#define __IUPKEY_H

/* from 32 to 126, all character sets are equal,
   the key code is the same as the ASCii character code. */

#define K_SP          ' '   /* 32 (0x20) */
#define K_exclam      '!'   /* 33 */
#define K_quotedbl    '\"'  /* 34 */
#define K_numbersign  '#'   /* 35 */
#define K_dollar      '$'   /* 36 */
#define K_percent     '%'   /* 37 */
#define K_ampersand   '&'   /* 38 */
#define K_apostrophe  '\''  /* 39 */
#define K_parentleft  '('   /* 40 */
#define K_parentright ')'   /* 41 */
#define K_asterisk    '*'   /* 42 */
#define K_plus        '+'   /* 43 */
#define K_comma       ','   /* 44 */
#define K_minus       '-'   /* 45 */
#define K_period      '.'   /* 46 */
#define K_slash       '/'   /* 47 */
#define K_0           '0'   /* 48 (0x30) */
#define K_1           '1'   /* 49 */
#define K_2           '2'   /* 50 */
#define K_3           '3'   /* 51 */
#define K_4           '4'   /* 52 */
#define K_5           '5'   /* 53 */
#define K_6           '6'   /* 54 */
#define K_7           '7'   /* 55 */
#define K_8           '8'   /* 56 */
#define K_9           '9'   /* 57 */
#define K_colon       ':'   /* 58 */
#define K_semicolon   ';'   /* 59 */
#define K_less        '<'   /* 60 */
#define K_equal       '='   /* 61 */
#define K_greater     '>'   /* 62 */
#define K_question    '?'   /* 63 */
#define K_at          '@'   /* 64 */
#define K_A           'A'   /* 65 (0x41) */
#define K_B           'B'   /* 66 */
#define K_C           'C'   /* 67 */
#define K_D           'D'   /* 68 */
#define K_E           'E'   /* 69 */
#define K_F           'F'   /* 70 */
#define K_G           'G'   /* 71 */
#define K_H           'H'   /* 72 */
#define K_I           'I'   /* 73 */
#define K_J           'J'   /* 74 */
#define K_K           'K'   /* 75 */
#define K_L           'L'   /* 76 */
#define K_M           'M'   /* 77 */
#define K_N           'N'   /* 78 */
#define K_O           'O'   /* 79 */
#define K_P           'P'   /* 80 */
#define K_Q           'Q'   /* 81 */
#define K_R           'R'   /* 82 */
#define K_S           'S'   /* 83 */
#define K_T           'T'   /* 84 */
#define K_U           'U'   /* 85 */
#define K_V           'V'   /* 86 */
#define K_W           'W'   /* 87 */
#define K_X           'X'   /* 88 */
#define K_Y           'Y'   /* 89 */
#define K_Z           'Z'   /* 90 */
#define K_bracketleft '['   /* 91 */
#define K_backslash   '\\'  /* 92 */
#define K_bracketright ']'  /* 93 */
#define K_circum      '^'   /* 94 */
#define K_underscore  '_'   /* 95 */
#define K_grave       '`'   /* 96 */
#define K_a           'a'   /* 97 (0x61) */
#define K_b           'b'   /* 98 */
#define K_c           'c'   /* 99 */
#define K_d           'd'   /* 100 */
#define K_e           'e'   /* 101 */
#define K_f           'f'   /* 102 */
#define K_g           'g'   /* 103 */
#define K_h           'h'   /* 104 */
#define K_i           'i'   /* 105 */
#define K_j           'j'   /* 106 */
#define K_k           'k'   /* 107 */
#define K_l           'l'   /* 108 */
#define K_m           'm'   /* 109 */
#define K_n           'n'   /* 110 */
#define K_o           'o'   /* 111 */
#define K_p           'p'   /* 112 */
#define K_q           'q'   /* 113 */
#define K_r           'r'   /* 114 */
#define K_s           's'   /* 115 */
#define K_t           't'   /* 116 */
#define K_u           'u'   /* 117 */
#define K_v           'v'   /* 118 */
#define K_w           'w'   /* 119 */
#define K_x           'x'   /* 120 */
#define K_y           'y'   /* 121 */
#define K_z           'z'   /* 122 */
#define K_braceleft   '{'   /* 123 */
#define K_bar         '|'   /* 124 */
#define K_braceright  '}'   /* 125 */
#define K_tilde       '~'   /* 126 (0x7E) */

/* Printable ASCii keys */

#define iup_isprint(_c) ((_c) > 31 && (_c) < 127)

/* also define the escape sequences that have keys associated */

#define K_BS     '\b'       /* 8 */
#define K_TAB    '\t'       /* 9 */
#define K_LF     '\n'       /* 10 (0x0A) not a real key, is a combination of CR with a modifier, just to document */
#define K_CR     '\r'       /* 13 (0x0D) */

/* backward compatible definitions */

#define  K_quoteleft   K_grave
#define  K_quoteright  K_apostrophe
#define  isxkey        iup_isXkey

/* IUP Extended Key Codes, range start at 128      */

#define iup_isXkey(_c)      ((_c) >= 128)

/* These use the same definition as X11 and GDK.
   This also means that any X11 or GDK definition can also be used. */

#define K_PAUSE    0xFF13
#define K_ESC      0xFF1B
#define K_HOME     0xFF50
#define K_LEFT     0xFF51
#define K_UP       0xFF52
#define K_RIGHT    0xFF53
#define K_DOWN     0xFF54
#define K_PGUP     0xFF55
#define K_PGDN     0xFF56
#define K_END      0xFF57
#define K_MIDDLE   0xFF0B
#define K_Print    0xFF61
#define K_INS      0xFF63
#define K_Menu     0xFF67
#define K_DEL      0xFFFF
#define K_F1       0xFFBE
#define K_F2       0xFFBF
#define K_F3       0xFFC0
#define K_F4       0xFFC1
#define K_F5       0xFFC2
#define K_F6       0xFFC3
#define K_F7       0xFFC4
#define K_F8       0xFFC5
#define K_F9       0xFFC6
#define K_F10      0xFFC7
#define K_F11      0xFFC8
#define K_F12      0xFFC9
#define K_F13      0xFFCA
#define K_F14      0xFFCB
#define K_F15      0xFFCC
#define K_F16      0xFFCD
#define K_F17      0xFFCE
#define K_F18      0xFFCF
#define K_F19      0xFFD0
#define K_F20      0xFFD1

/* no Shift/Ctrl/Alt */
#define K_LSHIFT   0xFFE1
#define K_RSHIFT   0xFFE2
#define K_LCTRL    0xFFE3
#define K_RCTRL    0xFFE4
#define K_LALT     0xFFE9
#define K_RALT     0xFFEA

#define K_NUM      0xFF7F
#define K_SCROLL   0xFF14
#define K_CAPS     0xFFE5

/* Mac clear button. Value randomly picked trying to avoid clashing with an existing value. */
#define K_CLEAR    0xFFD2
/* Help button if anybody has it. Value randomly picked trying to avoid clashing with an existing value. */
#define K_HELP     0xFFD3

/* Also, these are the same as the Latin-1 definition */

#define K_ccedilla  0x00E7
#define K_Ccedilla  0x00C7
#define K_acute     0x00B4  /* no Shift/Ctrl/Alt */
#define K_diaeresis 0x00A8

/******************************************************/
/* Modifiers use last 4 bits. Since IUP 3.9           */
/* These modifiers definitions are specific to IUP    */
/******************************************************/

#define iup_isShiftXkey(_c) (((_c) & 0x10000000) != 0)
#define iup_isCtrlXkey(_c)  (((_c) & 0x20000000) != 0)
#define iup_isAltXkey(_c)   (((_c) & 0x40000000) != 0)
#define iup_isSysXkey(_c)   (((_c) & 0x80000000) != 0)

#define iup_XkeyBase(_c)  ((_c) & 0x0FFFFFFF)
#define iup_XkeyShift(_c) ((_c) | 0x10000000)   /* Shift  */
#define iup_XkeyCtrl(_c)  ((_c) | 0x20000000)   /* Ctrl   */
#define iup_XkeyAlt(_c)   ((_c) | 0x40000000)   /* Alt    */
#define iup_XkeySys(_c)   ((_c) | 0x80000000)   /* Sys (Win or Apple) - notice that using "int" will display a negative value */

/* These definitions are here for backward compatibility
   and to simplify some key combination usage.
   But since IUP 3.9, modifiers can be combined with any key
   and they can be mixed together. */

#define K_sHOME    iup_XkeyShift(K_HOME   )
#define K_sUP      iup_XkeyShift(K_UP     )
#define K_sPGUP    iup_XkeyShift(K_PGUP   )
#define K_sLEFT    iup_XkeyShift(K_LEFT   )
#define K_sMIDDLE  iup_XkeyShift(K_MIDDLE )
#define K_sRIGHT   iup_XkeyShift(K_RIGHT  )
#define K_sEND     iup_XkeyShift(K_END    )
#define K_sDOWN    iup_XkeyShift(K_DOWN   )
#define K_sPGDN    iup_XkeyShift(K_PGDN   )
#define K_sINS     iup_XkeyShift(K_INS    )
#define K_sDEL     iup_XkeyShift(K_DEL    )
#define K_sSP      iup_XkeyShift(K_SP     )
#define K_sTAB     iup_XkeyShift(K_TAB    )
#define K_sCR      iup_XkeyShift(K_CR     )
#define K_sBS      iup_XkeyShift(K_BS     )
#define K_sPAUSE   iup_XkeyShift(K_PAUSE  )
#define K_sESC     iup_XkeyShift(K_ESC    )
#define K_sCLEAR   iup_XkeyShift(K_CLEAR  )
#define K_sF1      iup_XkeyShift(K_F1     )
#define K_sF2      iup_XkeyShift(K_F2     )
#define K_sF3      iup_XkeyShift(K_F3     )
#define K_sF4      iup_XkeyShift(K_F4     )
#define K_sF5      iup_XkeyShift(K_F5     )
#define K_sF6      iup_XkeyShift(K_F6     )
#define K_sF7      iup_XkeyShift(K_F7     )
#define K_sF8      iup_XkeyShift(K_F8     )
#define K_sF9      iup_XkeyShift(K_F9     )
#define K_sF10     iup_XkeyShift(K_F10    )
#define K_sF11     iup_XkeyShift(K_F11    )
#define K_sF12     iup_XkeyShift(K_F12    )
#define K_sF13     iup_XkeyShift(K_F13    )
#define K_sF14     iup_XkeyShift(K_F14    )
#define K_sF15     iup_XkeyShift(K_F15    )
#define K_sF16     iup_XkeyShift(K_F16    )
#define K_sF17     iup_XkeyShift(K_F17    )
#define K_sF18     iup_XkeyShift(K_F18    )
#define K_sF19     iup_XkeyShift(K_F19    )
#define K_sF20     iup_XkeyShift(K_F20    )
#define K_sPrint   iup_XkeyShift(K_Print  )
#define K_sMenu    iup_XkeyShift(K_Menu   )

#define K_cHOME     iup_XkeyCtrl(K_HOME    )
#define K_cUP       iup_XkeyCtrl(K_UP      )
#define K_cPGUP     iup_XkeyCtrl(K_PGUP    )
#define K_cLEFT     iup_XkeyCtrl(K_LEFT    )
#define K_cMIDDLE   iup_XkeyCtrl(K_MIDDLE  )
#define K_cRIGHT    iup_XkeyCtrl(K_RIGHT   )
#define K_cEND      iup_XkeyCtrl(K_END     )
#define K_cDOWN     iup_XkeyCtrl(K_DOWN    )
#define K_cPGDN     iup_XkeyCtrl(K_PGDN    )
#define K_cINS      iup_XkeyCtrl(K_INS     )
#define K_cDEL      iup_XkeyCtrl(K_DEL     )
#define K_cSP       iup_XkeyCtrl(K_SP      )
#define K_cTAB      iup_XkeyCtrl(K_TAB     )
#define K_cCR       iup_XkeyCtrl(K_CR      )
#define K_cBS       iup_XkeyCtrl(K_BS      )
#define K_cPAUSE    iup_XkeyCtrl(K_PAUSE   )
#define K_cESC      iup_XkeyCtrl(K_ESC     )
#define K_cCLEAR    iup_XkeyCtrl(K_CLEAR   )
#define K_cCcedilla iup_XkeyCtrl(K_Ccedilla)
#define K_cF1       iup_XkeyCtrl(K_F1      )
#define K_cF2       iup_XkeyCtrl(K_F2      )
#define K_cF3       iup_XkeyCtrl(K_F3      )
#define K_cF4       iup_XkeyCtrl(K_F4      )
#define K_cF5       iup_XkeyCtrl(K_F5      )
#define K_cF6       iup_XkeyCtrl(K_F6      )
#define K_cF7       iup_XkeyCtrl(K_F7      )
#define K_cF8       iup_XkeyCtrl(K_F8      )
#define K_cF9       iup_XkeyCtrl(K_F9      )
#define K_cF10      iup_XkeyCtrl(K_F10     )
#define K_cF11      iup_XkeyCtrl(K_F11     )
#define K_cF12      iup_XkeyCtrl(K_F12     )
#define K_cF13      iup_XkeyCtrl(K_F13     )
#define K_cF14      iup_XkeyCtrl(K_F14     )
#define K_cF15      iup_XkeyCtrl(K_F15     )
#define K_cF16      iup_XkeyCtrl(K_F16     )
#define K_cF17      iup_XkeyCtrl(K_F17     )
#define K_cF18      iup_XkeyCtrl(K_F18     )
#define K_cF19      iup_XkeyCtrl(K_F19     )
#define K_cF20      iup_XkeyCtrl(K_F20     )
#define K_cPrint    iup_XkeyCtrl(K_Print   )
#define K_cMenu     iup_XkeyCtrl(K_Menu    )

#define K_mHOME     iup_XkeyAlt(K_HOME    )
#define K_mUP       iup_XkeyAlt(K_UP      )
#define K_mPGUP     iup_XkeyAlt(K_PGUP    )
#define K_mLEFT     iup_XkeyAlt(K_LEFT    )
#define K_mMIDDLE   iup_XkeyAlt(K_MIDDLE  )
#define K_mRIGHT    iup_XkeyAlt(K_RIGHT   )
#define K_mEND      iup_XkeyAlt(K_END     )
#define K_mDOWN     iup_XkeyAlt(K_DOWN    )
#define K_mPGDN     iup_XkeyAlt(K_PGDN    )
#define K_mINS      iup_XkeyAlt(K_INS     )
#define K_mDEL      iup_XkeyAlt(K_DEL     )
#define K_mSP       iup_XkeyAlt(K_SP      )
#define K_mTAB      iup_XkeyAlt(K_TAB     )
#define K_mCR       iup_XkeyAlt(K_CR      )
#define K_mBS       iup_XkeyAlt(K_BS      )
#define K_mPAUSE    iup_XkeyAlt(K_PAUSE   )
#define K_mESC      iup_XkeyAlt(K_ESC     )
#define K_mCLEAR    iup_XkeyAlt(K_CLEAR   )
#define K_mCcedilla iup_XkeyAlt(K_Ccedilla)
#define K_mF1       iup_XkeyAlt(K_F1      )
#define K_mF2       iup_XkeyAlt(K_F2      )
#define K_mF3       iup_XkeyAlt(K_F3      )
#define K_mF4       iup_XkeyAlt(K_F4      )
#define K_mF5       iup_XkeyAlt(K_F5      )
#define K_mF6       iup_XkeyAlt(K_F6      )
#define K_mF7       iup_XkeyAlt(K_F7      )
#define K_mF8       iup_XkeyAlt(K_F8      )
#define K_mF9       iup_XkeyAlt(K_F9      )
#define K_mF10      iup_XkeyAlt(K_F10     )
#define K_mF11      iup_XkeyAlt(K_F11     )
#define K_mF12      iup_XkeyAlt(K_F12     )
#define K_mF13      iup_XkeyAlt(K_F13     )
#define K_mF14      iup_XkeyAlt(K_F14     )
#define K_mF15      iup_XkeyAlt(K_F15     )
#define K_mF16      iup_XkeyAlt(K_F16     )
#define K_mF17      iup_XkeyAlt(K_F17     )
#define K_mF18      iup_XkeyAlt(K_F18     )
#define K_mF19      iup_XkeyAlt(K_F19     )
#define K_mF20      iup_XkeyAlt(K_F20     )
#define K_mPrint    iup_XkeyAlt(K_Print   )
#define K_mMenu     iup_XkeyAlt(K_Menu    )

#define K_yHOME     iup_XkeySys(K_HOME    )
#define K_yUP       iup_XkeySys(K_UP      )
#define K_yPGUP     iup_XkeySys(K_PGUP    )
#define K_yLEFT     iup_XkeySys(K_LEFT    )
#define K_yMIDDLE   iup_XkeySys(K_MIDDLE  )
#define K_yRIGHT    iup_XkeySys(K_RIGHT   )
#define K_yEND      iup_XkeySys(K_END     )
#define K_yDOWN     iup_XkeySys(K_DOWN    )
#define K_yPGDN     iup_XkeySys(K_PGDN    )
#define K_yINS      iup_XkeySys(K_INS     )
#define K_yDEL      iup_XkeySys(K_DEL     )
#define K_ySP       iup_XkeySys(K_SP      )
#define K_yTAB      iup_XkeySys(K_TAB     )
#define K_yCR       iup_XkeySys(K_CR      )
#define K_yBS       iup_XkeySys(K_BS      )
#define K_yPAUSE    iup_XkeySys(K_PAUSE   )
#define K_yESC      iup_XkeySys(K_ESC     )
#define K_yCLEAR    iup_XkeySys(K_CLEAR   )
#define K_yCcedilla iup_XkeySys(K_Ccedilla)
#define K_yF1       iup_XkeySys(K_F1      )
#define K_yF2       iup_XkeySys(K_F2      )
#define K_yF3       iup_XkeySys(K_F3      )
#define K_yF4       iup_XkeySys(K_F4      )
#define K_yF5       iup_XkeySys(K_F5      )
#define K_yF6       iup_XkeySys(K_F6      )
#define K_yF7       iup_XkeySys(K_F7      )
#define K_yF8       iup_XkeySys(K_F8      )
#define K_yF9       iup_XkeySys(K_F9      )
#define K_yF10      iup_XkeySys(K_F10     )
#define K_yF11      iup_XkeySys(K_F11     )
#define K_yF12      iup_XkeySys(K_F12     )
#define K_yF13      iup_XkeySys(K_F13     )
#define K_yF14      iup_XkeySys(K_F14     )
#define K_yF15      iup_XkeySys(K_F15     )
#define K_yF16      iup_XkeySys(K_F16     )
#define K_yF17      iup_XkeySys(K_F17     )
#define K_yF18      iup_XkeySys(K_F18     )
#define K_yF19      iup_XkeySys(K_F19     )
#define K_yF20      iup_XkeySys(K_F20     )
#define K_yPrint    iup_XkeySys(K_Print   )
#define K_yMenu     iup_XkeySys(K_Menu    )

#define K_sPlus         iup_XkeyShift(K_plus    )
#define K_sComma        iup_XkeyShift(K_comma   )
#define K_sMinus        iup_XkeyShift(K_minus   )
#define K_sPeriod       iup_XkeyShift(K_period  )
#define K_sSlash        iup_XkeyShift(K_slash   )
#define K_sAsterisk     iup_XkeyShift(K_asterisk)

#define K_cA     iup_XkeyCtrl(K_A)
#define K_cB     iup_XkeyCtrl(K_B)
#define K_cC     iup_XkeyCtrl(K_C)
#define K_cD     iup_XkeyCtrl(K_D)
#define K_cE     iup_XkeyCtrl(K_E)
#define K_cF     iup_XkeyCtrl(K_F)
#define K_cG     iup_XkeyCtrl(K_G)
#define K_cH     iup_XkeyCtrl(K_H)
#define K_cI     iup_XkeyCtrl(K_I)
#define K_cJ     iup_XkeyCtrl(K_J)
#define K_cK     iup_XkeyCtrl(K_K)
#define K_cL     iup_XkeyCtrl(K_L)
#define K_cM     iup_XkeyCtrl(K_M)
#define K_cN     iup_XkeyCtrl(K_N)
#define K_cO     iup_XkeyCtrl(K_O)
#define K_cP     iup_XkeyCtrl(K_P)
#define K_cQ     iup_XkeyCtrl(K_Q)
#define K_cR     iup_XkeyCtrl(K_R)
#define K_cS     iup_XkeyCtrl(K_S)
#define K_cT     iup_XkeyCtrl(K_T)
#define K_cU     iup_XkeyCtrl(K_U)
#define K_cV     iup_XkeyCtrl(K_V)
#define K_cW     iup_XkeyCtrl(K_W)
#define K_cX     iup_XkeyCtrl(K_X)
#define K_cY     iup_XkeyCtrl(K_Y)
#define K_cZ     iup_XkeyCtrl(K_Z)
#define K_c1     iup_XkeyCtrl(K_1)
#define K_c2     iup_XkeyCtrl(K_2)
#define K_c3     iup_XkeyCtrl(K_3)
#define K_c4     iup_XkeyCtrl(K_4)
#define K_c5     iup_XkeyCtrl(K_5)
#define K_c6     iup_XkeyCtrl(K_6)
#define K_c7     iup_XkeyCtrl(K_7)
#define K_c8     iup_XkeyCtrl(K_8)
#define K_c9     iup_XkeyCtrl(K_9)
#define K_c0     iup_XkeyCtrl(K_0)
#define K_cPlus         iup_XkeyCtrl(K_plus        )
#define K_cComma        iup_XkeyCtrl(K_comma       )
#define K_cMinus        iup_XkeyCtrl(K_minus       )
#define K_cPeriod       iup_XkeyCtrl(K_period      )
#define K_cSlash        iup_XkeyCtrl(K_slash       )
#define K_cSemicolon    iup_XkeyCtrl(K_semicolon   )
#define K_cEqual        iup_XkeyCtrl(K_equal       )
#define K_cBracketleft  iup_XkeyCtrl(K_bracketleft )
#define K_cBracketright iup_XkeyCtrl(K_bracketright)
#define K_cBackslash    iup_XkeyCtrl(K_backslash   )
#define K_cAsterisk     iup_XkeyCtrl(K_asterisk    )

#define K_mA     iup_XkeyAlt(K_A)
#define K_mB     iup_XkeyAlt(K_B)
#define K_mC     iup_XkeyAlt(K_C)
#define K_mD     iup_XkeyAlt(K_D)
#define K_mE     iup_XkeyAlt(K_E)
#define K_mF     iup_XkeyAlt(K_F)
#define K_mG     iup_XkeyAlt(K_G)
#define K_mH     iup_XkeyAlt(K_H)
#define K_mI     iup_XkeyAlt(K_I)
#define K_mJ     iup_XkeyAlt(K_J)
#define K_mK     iup_XkeyAlt(K_K)
#define K_mL     iup_XkeyAlt(K_L)
#define K_mM     iup_XkeyAlt(K_M)
#define K_mN     iup_XkeyAlt(K_N)
#define K_mO     iup_XkeyAlt(K_O)
#define K_mP     iup_XkeyAlt(K_P)
#define K_mQ     iup_XkeyAlt(K_Q)
#define K_mR     iup_XkeyAlt(K_R)
#define K_mS     iup_XkeyAlt(K_S)
#define K_mT     iup_XkeyAlt(K_T)
#define K_mU     iup_XkeyAlt(K_U)
#define K_mV     iup_XkeyAlt(K_V)
#define K_mW     iup_XkeyAlt(K_W)
#define K_mX     iup_XkeyAlt(K_X)
#define K_mY     iup_XkeyAlt(K_Y)
#define K_mZ     iup_XkeyAlt(K_Z)
#define K_m1     iup_XkeyAlt(K_1)
#define K_m2     iup_XkeyAlt(K_2)
#define K_m3     iup_XkeyAlt(K_3)
#define K_m4     iup_XkeyAlt(K_4)
#define K_m5     iup_XkeyAlt(K_5)
#define K_m6     iup_XkeyAlt(K_6)
#define K_m7     iup_XkeyAlt(K_7)
#define K_m8     iup_XkeyAlt(K_8)
#define K_m9     iup_XkeyAlt(K_9)
#define K_m0     iup_XkeyAlt(K_0)
#define K_mPlus         iup_XkeyAlt(K_plus        )
#define K_mComma        iup_XkeyAlt(K_comma       )
#define K_mMinus        iup_XkeyAlt(K_minus       )
#define K_mPeriod       iup_XkeyAlt(K_period      )
#define K_mSlash        iup_XkeyAlt(K_slash       )
#define K_mSemicolon    iup_XkeyAlt(K_semicolon   )
#define K_mEqual        iup_XkeyAlt(K_equal       )
#define K_mBracketleft  iup_XkeyAlt(K_bracketleft )
#define K_mBracketright iup_XkeyAlt(K_bracketright)
#define K_mBackslash    iup_XkeyAlt(K_backslash   )
#define K_mAsterisk     iup_XkeyAlt(K_asterisk    )

#define K_yA     iup_XkeySys(K_A)
#define K_yB     iup_XkeySys(K_B)
#define K_yC     iup_XkeySys(K_C)
#define K_yD     iup_XkeySys(K_D)
#define K_yE     iup_XkeySys(K_E)
#define K_yF     iup_XkeySys(K_F)
#define K_yG     iup_XkeySys(K_G)
#define K_yH     iup_XkeySys(K_H)
#define K_yI     iup_XkeySys(K_I)
#define K_yJ     iup_XkeySys(K_J)
#define K_yK     iup_XkeySys(K_K)
#define K_yL     iup_XkeySys(K_L)
#define K_yM     iup_XkeySys(K_M)
#define K_yN     iup_XkeySys(K_N)
#define K_yO     iup_XkeySys(K_O)
#define K_yP     iup_XkeySys(K_P)
#define K_yQ     iup_XkeySys(K_Q)
#define K_yR     iup_XkeySys(K_R)
#define K_yS     iup_XkeySys(K_S)
#define K_yT     iup_XkeySys(K_T)
#define K_yU     iup_XkeySys(K_U)
#define K_yV     iup_XkeySys(K_V)
#define K_yW     iup_XkeySys(K_W)
#define K_yX     iup_XkeySys(K_X)
#define K_yY     iup_XkeySys(K_Y)
#define K_yZ     iup_XkeySys(K_Z)
#define K_y1     iup_XkeySys(K_1)
#define K_y2     iup_XkeySys(K_2)
#define K_y3     iup_XkeySys(K_3)
#define K_y4     iup_XkeySys(K_4)
#define K_y5     iup_XkeySys(K_5)
#define K_y6     iup_XkeySys(K_6)
#define K_y7     iup_XkeySys(K_7)
#define K_y8     iup_XkeySys(K_8)
#define K_y9     iup_XkeySys(K_9)
#define K_y0     iup_XkeySys(K_0)
#define K_yPlus         iup_XkeySys(K_plus        )
#define K_yComma        iup_XkeySys(K_comma       )
#define K_yMinus        iup_XkeySys(K_minus       )
#define K_yPeriod       iup_XkeySys(K_period      )
#define K_ySlash        iup_XkeySys(K_slash       )
#define K_ySemicolon    iup_XkeySys(K_semicolon   )
#define K_yEqual        iup_XkeySys(K_equal       )
#define K_yBracketleft  iup_XkeySys(K_bracketleft )
#define K_yBracketright iup_XkeySys(K_bracketright)
#define K_yBackslash    iup_XkeySys(K_backslash   )
#define K_yAsterisk     iup_XkeySys(K_asterisk    )

#endif

/*** End of inlined file: iupkey.h ***/


/*** Start of inlined file: iupdef.h ***/
#ifndef __IUPDEF_H
#define __IUPDEF_H

/* ATTENTION: these are OLD definitions and they are NOT updated anymore since IUP 3.0 */
/* Avoid using them, directly use the strings instead. */
/* Define __IUPDEF_H to avoid the inclusion of this header */

#define IUP_RUN            "RUN"
#define IUP_ENGLISH        "ENGLISH"
#define IUP_PORTUGUESE     "PORTUGUESE"
#define IUP_SBH            "SBH"
#define IUP_SBV            "SBV"

/************************************************************************/
/*                            Callbacks                                 */
/************************************************************************/

#define IUP_IDLE_ACTION    "IDLE_ACTION"

#define IUP_ACTION         "ACTION"
#define IUP_GETFOCUS_CB    "GETFOCUS_CB"
#define IUP_KILLFOCUS_CB   "KILLFOCUS_CB"
#define IUP_K_ANY          "K_ANY"
#define IUP_KEYPRESS_CB    "KEYPRESS_CB"
#define IUP_HELP_CB        "HELP_CB"

#define IUP_SCROLL_CB      "SCROLL_CB"
#define IUP_RESIZE_CB      "RESIZE_CB"
#define IUP_MOTION_CB      "MOTION_CB"
#define IUP_BUTTON_CB      "BUTTON_CB"
#define IUP_ENTERWINDOW_CB "ENTERWINDOW_CB"
#define IUP_LEAVEWINDOW_CB "LEAVEWINDOW_CB"
#define IUP_WHEEL_CB       "WHEEL_CB"

#define IUP_MASK_CB        "MASK_CB"
#define IUP_OPEN_CB        "OPEN_CB"
#define IUP_HIGHLIGHT_CB   "HIGHLIGHT_CB"
#define IUP_MENUCLOSE_CB   "MENUCLOSE_CB"

#define IUP_MAP_CB         "MAP_CB"
#define IUP_CLOSE_CB       "CLOSE_CB"
#define IUP_SHOW_CB        "SHOW_CB"

#define IUP_DROPFILES_CB   "DROPFILES_CB"
#define IUP_WOM_CB         "WOM_CB"

/************************************************************************/
/*                            Attributes                                */
/************************************************************************/

#define IUP_DIRECTION      "DIRECTION"
#define IUP_ACTIVE         "ACTIVE"
#define IUP_BGCOLOR        "BGCOLOR"
#define IUP_FRAMECOLOR     "FRAMECOLOR"
#define IUP_FGCOLOR        "FGCOLOR"
#define IUP_COLOR          "COLOR"
#define IUP_WID            "WID"
#define IUP_SIZE           "SIZE"
#define IUP_RASTERSIZE     "RASTERSIZE"
#define IUP_TITLE          "TITLE"
#define IUP_VALUE          "VALUE"
#define IUP_VISIBLE        "VISIBLE"
#define IUP_FONT           "FONT"
#define IUP_TIP            "TIP"
#define IUP_EXPAND         "EXPAND"
#define IUP_SEPARATOR      "SEPARATOR"

#define IUP_HOTSPOT        "HOTSPOT"
#define IUP_HEIGHT         "HEIGHT"
#define IUP_WIDTH          "WIDTH"

#define IUP_KEY            "KEY"

#define IUP_MULTIPLE       "MULTIPLE"
#define IUP_DROPDOWN       "DROPDOWN"
#define IUP_VISIBLE_ITEMS  "VISIBLE_ITEMS"

#define IUP_MARGIN         "MARGIN"
#define IUP_GAP            "GAP"
#define IUP_ALIGNMENT      "ALIGNMENT"

#define IUP_IMAGE          "IMAGE"
#define IUP_IMINACTIVE     "IMINACTIVE"
#define IUP_IMPRESS        "IMPRESS"
#define IUP_WIN_SAVEBITS   "WIN_SAVEBITS"

#define IUP_NC             "NC"
#define IUP_MASK           "MASK"

#define IUP_APPEND         "APPEND"
#define IUP_BORDER         "BORDER"

#define IUP_CARET          "CARET"
#define IUP_SELECTION      "SELECTION"
#define IUP_SELECTEDTEXT   "SELECTEDTEXT"
#define IUP_INSERT         "INSERT"

#define IUP_CONID          "CONID"
#define IUP_CURSOR         "CURSOR"

#define IUP_ICON           "ICON"
#define IUP_MENUBOX        "MENUBOX"
#define IUP_MINBOX         "MINBOX"
#define IUP_MAXBOX         "MAXBOX"
#define IUP_RESIZE         "RESIZE"
#define IUP_MENU           "MENU"
#define IUP_STARTFOCUS     "STARTFOCUS"
#define IUP_PARENTDIALOG   "PARENTDIALOG"
#define IUP_SHRINK         "SHRINK"
#define IUP_DEFAULTENTER   "DEFAULTENTER"
#define IUP_DEFAULTESC     "DEFAULTESC"
#define IUP_X              "X"
#define IUP_Y              "Y"
#define IUP_TOOLBOX        "TOOLBOX"
#define IUP_CONTROL        "CONTROL"
#define IUP_READONLY       "READONLY"

#define IUP_SCROLLBAR      "SCROLLBAR"
#define IUP_POSY           "POSY"
#define IUP_POSX           "POSX"
#define IUP_DX             "DX"
#define IUP_DY             "DY"
#define IUP_XMAX           "XMAX"
#define IUP_XMIN           "XMIN"
#define IUP_YMAX           "YMAX"
#define IUP_YMIN           "YMIN"

#define IUP_RED            "255 0 0"
#define IUP_GREEN          "0 255 0"
#define IUP_BLUE           "0 0 255"

#define IUP_MIN            "MIN"
#define IUP_MAX            "MAX"

#define IUP_TIME           "TIME"
#define IUP_DRAG           "DRAG"
#define IUP_DROP           "DROP"
#define IUP_REPAINT        "REPAINT"
#define IUP_TOPMOST        "TOPMOST"
#define IUP_CLIPCHILDREN   "CLIPCHILDREN"

#define IUP_DIALOGTYPE     "DIALOGTYPE"
#define IUP_FILE           "FILE"
#define IUP_MULTIPLEFILES  "MULTIPLEFILES"
#define IUP_FILTER         "FILTER"
#define IUP_FILTERUSED     "FILTERUSED"
#define IUP_FILTERINFO     "FILTERINFO"
#define IUP_EXTFILTER      "EXTFILTER"
#define IUP_DIRECTORY      "DIRECTORY"
#define IUP_ALLOWNEW       "ALLOWNEW"
#define IUP_NOOVERWRITEPROMPT "NOOVERWRITEPROMPT"
#define IUP_NOCHANGEDIR    "NOCHANGEDIR"
#define IUP_FILEEXIST      "FILEEXIST"
#define IUP_STATUS         "STATUS"

#define IUP_LOCKLOOP       "LOCKLOOP"
#define IUP_SYSTEM         "SYSTEM"
#define IUP_DRIVER         "DRIVER"
#define IUP_SCREENSIZE     "SCREENSIZE"
#define IUP_SYSTEMLANGUAGE "SYSTEMLANGUAGE"
#define IUP_COMPUTERNAME   "COMPUTERNAME"
#define IUP_USERNAME       "USERNAME"

#define IUP_OPEN "OPEN"
#define IUP_SAVE "SAVE"
#define IUP_DIR  "DIR"

#define IUP_HORIZONTAL     "HORIZONTAL"
#define IUP_VERTICAL       "VERTICAL"

/************************************************************************/
/*                       Attribute Values                               */
/************************************************************************/

#define IUP_YES       "YES"
#define IUP_NO        "NO"
#define IUP_ON        "ON"
#define IUP_OFF       "OFF"

#define IUP_ACENTER   "ACENTER"
#define IUP_ALEFT     "ALEFT"
#define IUP_ARIGHT    "ARIGHT"
#define IUP_ATOP      "ATOP"
#define IUP_ABOTTOM   "ABOTTOM"

#define IUP_NORTH     "NORTH"
#define IUP_SOUTH     "SOUTH"
#define IUP_WEST      "WEST"
#define IUP_EAST      "EAST"
#define IUP_NE        "NE"
#define IUP_SE        "SE"
#define IUP_NW        "NW"
#define IUP_SW        "SW"

#define IUP_FULLSCREEN "FULLSCREEN"
#define IUP_FULL      "FULL"
#define IUP_HALF      "HALF"
#define IUP_THIRD     "THIRD"
#define IUP_QUARTER   "QUARTER"
#define IUP_EIGHTH    "EIGHTH"

#define IUP_ARROW     "ARROW"
#define IUP_BUSY      "BUSY"
#define IUP_RESIZE_N  "RESIZE_N"
#define IUP_RESIZE_S  "RESIZE_S"
#define IUP_RESIZE_E  "RESIZE_E"
#define IUP_RESIZE_W  "RESIZE_W"
#define IUP_RESIZE_NE "RESIZE_NE"
#define IUP_RESIZE_NW "RESIZE_NW"
#define IUP_RESIZE_SE "RESIZE_SE"
#define IUP_RESIZE_SW "RESIZE_SW"
#define IUP_MOVE      "MOVE"
#define IUP_HAND      "HAND"
#define IUP_NONE      "NONE"
#define IUP_IUP       "IUP"
#define IUP_CROSS     "CROSS"
#define IUP_PEN       "PEN"
#define IUP_TEXT      "TEXT"
#define IUP_RESIZE_C  "RESIZE_C"
#define IUP_OPENHAND  "OPENHAND"

/************************************************************************/
/*                           Keys                                       */
/************************************************************************/

#define IUP_K_exclam            "K_exclam"
#define IUP_K_quotedbl          "K_quotedbl"
#define IUP_K_numbersign        "K_numbersign"
#define IUP_K_dollar            "K_dollar"
#define IUP_K_percent           "K_percent"
#define IUP_K_ampersand         "K_ampersand"
#define IUP_K_quoteright        "K_quoteright"
#define IUP_K_parentleft        "K_parentleft"
#define IUP_K_parentright       "K_parentright"
#define IUP_K_asterisk          "K_asterisk"
#define IUP_K_plus              "K_plus"
#define IUP_K_comma             "K_comma"
#define IUP_K_minus             "K_minus"
#define IUP_K_period            "K_period"
#define IUP_K_slash             "K_slash"
#define IUP_K_0                 "K_0"
#define IUP_K_1                 "K_1"
#define IUP_K_2                 "K_2"
#define IUP_K_3                 "K_3"
#define IUP_K_4                 "K_4"
#define IUP_K_5                 "K_5"
#define IUP_K_6                 "K_6"
#define IUP_K_7                 "K_7"
#define IUP_K_8                 "K_8"
#define IUP_K_9                 "K_9"
#define IUP_K_colon             "K_colon"
#define IUP_K_semicolon         "K_semicolon "
#define IUP_K_less              "K_less"
#define IUP_K_equal             "K_equal"
#define IUP_K_greater           "K_greater"
#define IUP_K_question          "K_question"
#define IUP_K_at                "K_at"
#define IUP_K_A                 "K_A"
#define IUP_K_B                 "K_B"
#define IUP_K_C                 "K_C"
#define IUP_K_D                 "K_D"
#define IUP_K_E                 "K_E"
#define IUP_K_F                 "K_F"
#define IUP_K_G                 "K_G"
#define IUP_K_H                 "K_H"
#define IUP_K_I                 "K_I"
#define IUP_K_J                 "K_J"
#define IUP_K_K                 "K_K"
#define IUP_K_L                 "K_L"
#define IUP_K_M                 "K_M"
#define IUP_K_N                 "K_N"
#define IUP_K_O                 "K_O"
#define IUP_K_P                 "K_P"
#define IUP_K_Q                 "K_Q"
#define IUP_K_R                 "K_R"
#define IUP_K_S                 "K_S"
#define IUP_K_T                 "K_T"
#define IUP_K_U                 "K_U"
#define IUP_K_V                 "K_V"
#define IUP_K_W                 "K_W"
#define IUP_K_X                 "K_X"
#define IUP_K_Y                 "K_Y"
#define IUP_K_Z                 "K_Z"
#define IUP_K_bracketleft       "K_bracketleft"
#define IUP_K_backslash         "K_backslash"
#define IUP_K_bracketright      "K_bracketright"
#define IUP_K_circum            "K_circum"
#define IUP_K_underscore        "K_underscore"
#define IUP_K_quoteleft         "K_quoteleft"
#define IUP_K_a                 "K_a"
#define IUP_K_b                 "K_b"
#define IUP_K_c                 "K_c"
#define IUP_K_d                 "K_d"
#define IUP_K_e                 "K_e"
#define IUP_K_f                 "K_f"
#define IUP_K_g                 "K_g"
#define IUP_K_h                 "K_h"
#define IUP_K_i                 "K_i"
#define IUP_K_j                 "K_j"
#define IUP_K_k                 "K_k"
#define IUP_K_l                 "K_l"
#define IUP_K_m                 "K_m"
#define IUP_K_n                 "K_n"
#define IUP_K_o                 "K_o"
#define IUP_K_p                 "K_p"
#define IUP_K_q                 "K_q"
#define IUP_K_r                 "K_r"
#define IUP_K_s                 "K_s"
#define IUP_K_t                 "K_t"
#define IUP_K_u                 "K_u"
#define IUP_K_v                 "K_v"
#define IUP_K_w                 "K_w"
#define IUP_K_x                 "K_x"
#define IUP_K_y                 "K_y"
#define IUP_K_z                 "K_z"
#define IUP_K_braceleft         "K_braceleft"
#define IUP_K_bar               "K_bar"
#define IUP_K_braceright        "K_braceright"
#define IUP_K_tilde             "K_tilde"

#define IUP_K_cA       "K_cA"
#define IUP_K_cB       "K_cB"
#define IUP_K_cC       "K_cC"
#define IUP_K_cD       "K_cD"
#define IUP_K_cE       "K_cE"
#define IUP_K_cF       "K_cF"
#define IUP_K_cG       "K_cG"
#define IUP_K_cJ       "K_cJ"
#define IUP_K_cK       "K_cK"
#define IUP_K_cL       "K_cL"
#define IUP_K_cN       "K_cN"
#define IUP_K_cO       "K_cO"
#define IUP_K_cP       "K_cP"
#define IUP_K_cQ       "K_cQ"
#define IUP_K_cR       "K_cR"
#define IUP_K_cS       "K_cS"
#define IUP_K_cT       "K_cT"
#define IUP_K_cU       "K_cU"
#define IUP_K_cV       "K_cV"
#define IUP_K_cW       "K_cW"
#define IUP_K_cX       "K_cX"
#define IUP_K_cY       "K_cY"
#define IUP_K_cZ       "K_cZ"
#define IUP_K_mA       "K_mA"
#define IUP_K_mB       "K_mB"
#define IUP_K_mC       "K_mC"
#define IUP_K_mD       "K_mD"
#define IUP_K_mE       "K_mE"
#define IUP_K_mF       "K_mF"
#define IUP_K_mG       "K_mG"
#define IUP_K_mH       "K_mH"
#define IUP_K_mI       "K_mI"
#define IUP_K_mJ       "K_mJ"
#define IUP_K_mK       "K_mK"
#define IUP_K_mL       "K_mL"
#define IUP_K_mM       "K_mM"
#define IUP_K_mN       "K_mN"
#define IUP_K_mO       "K_mO"
#define IUP_K_mP       "K_mP"
#define IUP_K_mQ       "K_mQ"
#define IUP_K_mR       "K_mR"
#define IUP_K_mS       "K_mS"
#define IUP_K_mT       "K_mT"
#define IUP_K_mU       "K_mU"
#define IUP_K_mV       "K_mV"
#define IUP_K_mW       "K_mW"
#define IUP_K_mX       "K_mX"
#define IUP_K_mY       "K_mY"
#define IUP_K_mZ       "K_mZ"
#define IUP_K_BS       "K_BS"
#define IUP_K_TAB      "K_TAB"
#define IUP_K_CR       "K_CR"
#define IUP_K_SP       "K_SP"
#define IUP_K_ESC      "K_ESC"
#define IUP_K_sCR      "K_sCR"
#define IUP_K_sTAB     "K_sTAB"
#define IUP_K_cTAB     "K_cTAB"
#define IUP_K_mTAB     "K_mTAB"
#define IUP_K_HOME     "K_HOME"
#define IUP_K_UP       "K_UP"
#define IUP_K_PGUP     "K_PGUP"
#define IUP_K_LEFT     "K_LEFT"
#define IUP_K_RIGHT    "K_RIGHT"
#define IUP_K_END      "K_END"
#define IUP_K_DOWN     "K_DOWN"
#define IUP_K_PGDN     "K_PGDN"
#define IUP_K_MIDDLE   "K_MIDDLE"
#define IUP_K_INS      "K_INS"
#define IUP_K_DEL      "K_DEL"
#define IUP_K_sHOME    "K_sHOME"
#define IUP_K_sUP      "K_sUP"
#define IUP_K_sPGUP    "K_sPGUP"
#define IUP_K_sLEFT    "K_sLEFT"
#define IUP_K_sRIGHT   "K_sRIGHT"
#define IUP_K_sEND     "K_sEND"
#define IUP_K_sDOWN    "K_sDOWN"
#define IUP_K_sPGDN    "K_sPGDN"
#define IUP_K_cHOME    "K_cHOME"
#define IUP_K_cPGUP    "K_cPGUP"
#define IUP_K_cLEFT    "K_cLEFT"
#define IUP_K_cRIGHT   "K_cRIGHT"
#define IUP_K_cEND     "K_cEND"
#define IUP_K_cPGDN    "K_cPGDN"
#define IUP_K_cUP      "K_cUP"
#define IUP_K_cDOWN    "K_cDOWN"
#define IUP_K_cMIDDLE  "K_cMIDDLE"
#define IUP_K_cINS     "K_cINS"
#define IUP_K_cDEL     "K_cDEL"
#define IUP_K_mHOME    "K_mHOME"
#define IUP_K_mPGUP    "K_mPGUP"
#define IUP_K_mLEFT    "K_mLEFT"
#define IUP_K_mRIGHT   "K_mRIGHT"
#define IUP_K_mEND     "K_mEND"
#define IUP_K_mPGDN    "K_mPGDN"
#define IUP_K_mUP      "K_mUP"
#define IUP_K_mDOWN    "K_mDOWN"
#define IUP_K_mINS     "K_mINS"
#define IUP_K_mDEL     "K_mDEL"
#define IUP_K_F1       "K_F1"
#define IUP_K_F2       "K_F2"
#define IUP_K_F3       "K_F3"
#define IUP_K_F4       "K_F4"
#define IUP_K_F5       "K_F5"
#define IUP_K_F6       "K_F6"
#define IUP_K_F7       "K_F7"
#define IUP_K_F8       "K_F8"
#define IUP_K_F9       "K_F9"
#define IUP_K_F10      "K_F10"
#define IUP_K_F11      "K_F11"
#define IUP_K_F12      "K_F12"
#define IUP_K_sF1      "K_sF1"
#define IUP_K_sF2      "K_sF2"
#define IUP_K_sF3      "K_sF3"
#define IUP_K_sF4      "K_sF4"
#define IUP_K_sF5      "K_sF5"
#define IUP_K_sF6      "K_sF6"
#define IUP_K_sF7      "K_sF7"
#define IUP_K_sF8      "K_sF8"
#define IUP_K_sF9      "K_sF9"
#define IUP_K_sF10     "K_sF10"
#define IUP_K_sF11     "K_sF11"
#define IUP_K_sF12     "K_sF12"
#define IUP_K_cF1      "K_cF1"
#define IUP_K_cF2      "K_cF2"
#define IUP_K_cF3      "K_cF3"
#define IUP_K_cF4      "K_cF4"
#define IUP_K_cF5      "K_cF5"
#define IUP_K_cF6      "K_cF6"
#define IUP_K_cF7      "K_cF7"
#define IUP_K_cF8      "K_cF8"
#define IUP_K_cF9      "K_cF9"
#define IUP_K_cF10     "K_cF10"
#define IUP_K_cF11     "K_cF11"
#define IUP_K_cF12     "K_cF12"
#define IUP_K_mF1      "K_mF1"
#define IUP_K_mF2      "K_mF2"
#define IUP_K_mF3      "K_mF3"
#define IUP_K_mF4      "K_mF4"
#define IUP_K_mF5      "K_mF5"
#define IUP_K_mF6      "K_mF6"
#define IUP_K_mF7      "K_mF7"
#define IUP_K_mF8      "K_mF8"
#define IUP_K_mF9      "K_mF9"
#define IUP_K_mF10     "K_mF10"
#define IUP_K_m1       "K_m1"
#define IUP_K_m2       "K_m2"
#define IUP_K_m3       "K_m3"
#define IUP_K_m4       "K_m4"
#define IUP_K_m5       "K_m5"
#define IUP_K_m6       "K_m6"
#define IUP_K_m7       "K_m7"
#define IUP_K_m8       "K_m8"
#define IUP_K_m9       "K_m9"
#define IUP_K_m0       "K_m0"

/************/
/* Colorbar */
/************/

#define IUP_NUM_PARTS  "NUM_PARTS"
#define IUP_NUM_CELLS "NUM_CELLS"
#define IUP_CELL "CELL"
#define IUP_PREVIEW_SIZE "PREVIEW_SIZE"
#define IUP_SHOW_PREVIEW "SHOW_PREVIEW"
#define IUP_SHOW_SECONDARY "SHOW_SECONDARY"
#define IUP_PRIMARY_CELL "PRIMARY_CELL"
#define IUP_SECONDARY_CELL "SECONDARY_CELL"
#define IUP_ORIENTATION  "ORIENTATION"
#define IUP_SQUARED  "SQUARED"
#define IUP_SHADOWED  "SHADOWED"
#define IUP_BUFFERIZE  "BUFFERIZE"
#define IUP_TRANSPARENCY  "TRANSPARENCY"
#define IUP_CELL_CB "CELL_CB"
#define IUP_EXTENDED_CB "EXTENDED_CB"
#define IUP_SELECT_CB "SELECT_CB"
#define IUP_SWITCH_CB "SWITCH_CB"
#define IUP_VERTICAL    "VERTICAL"
#define IUP_HORIZONTAL  "HORIZONTAL"

/************/
/* Cells    */
/************/

#define IUP_ALL  "ALL"
#define IUP_BOXED  "BOXED"
#define IUP_CLIPPED  "CLIPPED"
#define IUP_TRANSPARENT  "TRANSPARENT"
#define IUP_NON_SCROLLABLE_LINES  "NON_SCROLLABLE_LINES"
#define IUP_NON_SCROLLABLE_COLS  "NON_SCROLLABLE_COLS"
#define IUP_ORIGIN  "ORIGIN"
#define IUP_NO_COLOR  "NO_COLOR"
#define IUP_FIRST_LINE  "FIRST_LINE"
#define IUP_FIRST_COL  "FIRST_COL"
#define IUP_DOUBLE_BUFFER  "DOUBLE_BUFFER"
#define IUP_LIMITS  "LIMITS"
#define IUP_CANVAS  "CANVAS"
#define IUP_IMAGE_CANVAS  "IMAGE_CANVAS"
#define IUP_FULL_VISIBLE  "FULL_VISIBLE"
#define IUP_MOUSECLICK_CB "MOUSECLICK_CB"
#define IUP_MOUSEMOTION_CB "MOUSEMOTION_CB"
#define IUP_DRAW_CB "DRAW_CB"
#define IUP_WIDTH_CB "WIDTH_CB"
#define IUP_HEIGHT_CB "HEIGHT_CB"
#define IUP_NLINES_CB "NLINES_CB"
#define IUP_NCOLS_CB "NCOLS_CB"
#define IUP_HSPAN_CB "HSPAN_CB"
#define IUP_VSPAN_CB "VSPAN_CB"
#define IUP_SCROLLING_CB "SCROLLING_CB"

/*****************/
/* ColorBrowser  */
/*****************/

#define IUP_RGB "RGB"
#define IUP_CHANGE_CB "CHANGE_CB"
#define IUP_DRAG_CB "DRAG_CB"

/*****************/
/* Val           */
/*****************/

#define ICTL_MOUSEMOVE_CB "MOUSEMOVE_CB"
#define ICTL_BUTTON_PRESS_CB "BUTTON_PRESS_CB"
#define ICTL_BUTTON_RELEASE_CB "BUTTON_RELEASE_CB"
#define ICTL_HORIZONTAL "HORIZONTAL"
#define ICTL_VERTICAL "VERTICAL"
#define ICTL_SHOWTICKS "SHOWTICKS"

/*****************/
/* Tabs          */
/*****************/

#define ICTL_TOP "TOP"
#define ICTL_BOTTOM "BOTTOM"
#define ICTL_LEFT "LEFT"
#define ICTL_RIGHT "RIGHT"
#define ICTL_TABTYPE "TABTYPE"
#define ICTL_TABTITLE "TABTITLE"
#define ICTL_TABSIZE "TABSIZE"
#define ICTL_TABCHANGE_CB "TABCHANGE_CB"
#define ICTL_FONT "FONT"
#define ICTL_FONT_ACTIVE "FONT_ACTIVE"
#define ICTL_FONT_INACTIVE "FONT_INACTIVE"

/*****************/
/* Gauge         */
/*****************/

#define ICTL_SHOW_TEXT "SHOW_TEXT"
#define ICTL_DASHED "DASHED"
#define ICTL_MARGIN "MARGIN"
#define ICTL_TEXT "TEXT"

/*****************/
/* Dial          */
/*****************/

#define ICTL_DENSITY "DENSITY"
#define ICTL_HORIZONTAL "HORIZONTAL"
#define ICTL_VERTICAL "VERTICAL"
#define ICTL_CIRCULAR "CIRCULAR"
#define ICTL_UNIT "UNIT"

/*****************/
/* Matrix        */
/*****************/

#define IUP_ENTERITEM_CB   "ENTERITEM_CB"
#define IUP_LEAVEITEM_CB   "LEAVEITEM_CB"
#define IUP_EDITION_CB     "EDITION_CB"
#define IUP_CLICK_CB       "CLICK_CB"
#define IUP_DROP_CB        "DROP_CB"
#define IUP_DROPSELECT_CB  "DROPSELECT_CB"
#define IUP_DROPCHECK_CB   "DROPCHECK_CB"
#define IUP_SCROLL_CB      "SCROLL_CB"
#define IUP_VALUE_CB       "VALUE_CB"
#define IUP_VALUE_EDIT_CB  "VALUE_EDIT_CB"
#define IUP_FIELD_CB       "FIELD_CB"
#define IUP_RESIZEMATRIX   "RESIZEMATRIX"
#define IUP_ADDLIN         "ADDLIN"
#define IUP_ADDCOL         "ADDCOL"
#define IUP_DELLIN         "DELLIN"
#define IUP_DELCOL         "DELCOL"
#define IUP_NUMLIN         "NUMLIN"
#define IUP_NUMCOL         "NUMCOL"
#define IUP_NUMLIN_VISIBLE "NUMLIN_VISIBLE"
#define IUP_NUMCOL_VISIBLE "NUMCOL_VISIBLE"
#define IUP_MARKED         "MARKED"
#define IUP_WIDTHDEF       "WIDTHDEF"
#define IUP_HEIGHTDEF      "HEIGHTDEF"
#define IUP_AREA           "AREA"
#define IUP_MARK_MODE      "MARK_MODE"
#define IUP_LIN            "LIN"
#define IUP_COL            "COL"
#define IUP_LINCOL         "LINCOL"
#define IUP_CELL           "CELL"
#define IUP_EDIT_MODE      "EDIT_MODE"
#define IUP_FOCUS_CELL     "FOCUS_CELL"
#define IUP_ORIGIN         "ORIGIN"
#define IUP_REDRAW         "REDRAW"
#define IUP_PREVIOUSVALUE  "PREVIOUSVALUE"
#define IUP_MOUSEMOVE_CB   "MOUSEMOVE_CB"

/*****************/
/* Tree          */
/*****************/

#define IUP_ADDLEAF          "ADDLEAF"
#define IUP_ADDBRANCH        "ADDBRANCH"
#define IUP_DELNODE          "DELNODE"
#define IUP_IMAGELEAF        "IMAGELEAF"
#define IUP_IMAGEBRANCHCOLLAPSED "IMAGEBRANCHCOLLAPSED"
#define IUP_IMAGEBRANCHEXPANDED  "IMAGEBRANCHEXPANDED"
#define IUP_IMAGEEXPANDED     "IMAGEEXPANDED"
#define IUP_KIND             "KIND"
#define IUP_PARENT           "PARENT"
#define IUP_DEPTH            "DEPTH"
#define IUP_MARKED           "MARKED"
#define IUP_ADDEXPANDED      "ADDEXPANDED"
#define IUP_CTRL             "CTRL"
#define IUP_SHIFT            "SHIFT"
#define IUP_STATE            "STATE"
#define IUP_STARTING         "STARTING"
#define IUP_LEAF             "LEAF"
#define IUP_BRANCH           "BRANCH"
#define IUP_SELECTED         "SELECTED"
#define IUP_CHILDREN         "CHILDREN"
#define IUP_MARKED           "MARKED"
#define IUP_ROOT             "ROOT"
#define IUP_LAST             "LAST"
#define IUP_PGUP             "PGUP"
#define IUP_PGDN             "PGDN"
#define IUP_NEXT             "NEXT"
#define IUP_PREVIOUS         "PREVIOUS"
#define IUP_INVERT           "INVERT"
#define IUP_BLOCK            "BLOCK"
#define IUP_CLEARALL         "CLEARALL"
#define IUP_MARKALL          "MARKALL"
#define IUP_INVERTALL        "INVERTALL"
#define IUP_REDRAW           "REDRAW"
#define IUP_COLLAPSED        "COLLAPSED"
#define IUP_EXPANDED         "EXPANDED"
#define IUP_SELECTION_CB "SELECTION_CB"
#define IUP_BRANCHOPEN_CB    "BRANCHOPEN_CB"
#define IUP_BRANCHCLOSE_CB   "BRANCHCLOSE_CB"
#define IUP_RIGHTCLICK_CB    "RIGHTCLICK_CB"
#define IUP_EXECUTELEAF_CB   "EXECUTELEAF_CB"
#define IUP_RENAMENODE_CB    "RENAMENODE_CB"
#define IUP_IMGLEAF             "IMGLEAF"
#define IUP_IMGCOLLAPSED        "IMGCOLLAPSED"
#define IUP_IMGEXPANDED         "IMGEXPANDED"
#define IUP_IMGBLANK            "IMGBLANK"
#define IUP_IMGPAPER            "IMGPAPER"

#endif

/*** End of inlined file: iupdef.h ***/


/*** Start of inlined file: iup_export.h ***/
#ifndef __IUP_EXPORT_H
#define __IUP_EXPORT_H

#ifndef DOXYGEN_SHOULD_IGNORE_THIS
/** @cond DOXYGEN_SHOULD_IGNORE_THIS */

/* Mark the official functions */
#ifndef IUP_API
#ifdef IUP_BUILD_LIBRARY
  #ifdef __EMSCRIPTEN__
	#include <emscripten.h>
	#define IUP_API EMSCRIPTEN_KEEPALIVE
  #elif WIN32
	#define IUP_API __declspec(dllexport)
  #elif defined(__GNUC__) && __GNUC__ >= 4
	#define IUP_API __attribute__ ((visibility("default")))
  #else
	#define IUP_API
  #endif
#else
  #define IUP_API
#endif /* IUP_BUILD_LIBRARY */
#endif /* IUP_API */

/* Mark the internal SDK functions (some not official but need to be exported) */
#ifndef IUP_SDK_API
#ifdef IUP_BUILD_LIBRARY
  #ifdef __EMSCRIPTEN__
	#include <emscripten.h>
	#define IUP_SDK_API EMSCRIPTEN_KEEPALIVE
  #elif WIN32
	#define IUP_SDK_API __declspec(dllexport)
  #elif defined(__GNUC__) && __GNUC__ >= 4
	#define IUP_SDK_API __attribute__ ((visibility("default")))
  #else
	#define IUP_SDK_API
  #endif
#else
  #define IUP_SDK_API
#endif /* IUP_BUILD_LIBRARY */
#endif /* IUP_SDK_API */

/* Mark the driver functions that need to be exported */
#ifndef IUP_DRV_API
#ifdef IUP_BUILD_LIBRARY
#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#define IUP_DRV_API EMSCRIPTEN_KEEPALIVE
#elif WIN32
#define IUP_DRV_API __declspec(dllexport)
#elif defined(__GNUC__) && __GNUC__ >= 4
#define IUP_DRV_API __attribute__ ((visibility("default")))
#else
#define IUP_DRV_API
#endif
#else
#define IUP_DRV_API
#endif /* IUP_BUILD_LIBRARY */
#endif /* IUP_DRV_API */

/* Mark the IupImageLib function, it does not have a header of its own */
#ifndef IUPIMGLIB_API
#ifdef IUPIMGLIB_BUILD_LIBRARY
  #ifdef __EMSCRIPTEN__
	#include <emscripten.h>
	#define IUPIMGLIB_API EMSCRIPTEN_KEEPALIVE
  #elif WIN32
	#define IUPIMGLIB_API __declspec(dllexport)
  #elif defined(__GNUC__) && __GNUC__ >= 4
	#define IUPIMGLIB_API __attribute__ ((visibility("default")))
  #else
	#define IUPIMGLIB_API
  #endif
#else
  #define IUPIMGLIB_API
#endif /* IUPIMGLIB_BUILD_LIBRARY */
#endif /* IUPIMGLIB_API */

/** @endcond DOXYGEN_SHOULD_IGNORE_THIS */
#endif /* DOXYGEN_SHOULD_IGNORE_THIS */

#endif /* __IUP_EXPORT_H */

/*** End of inlined file: iup_export.h ***/

#ifdef __cplusplus
extern "C" {
#endif

#define IUP_NAME "IUP - Portable User Interface"
#define IUP_DESCRIPTION "Multi-platform Toolkit for Building Graphical User Interfaces"
#define IUP_COPYRIGHT "Copyright (C) 1994-2020 Tecgraf/PUC-Rio"
#define IUP_VERSION "3.30"         /* bug fixes are reported only by IupVersion functions */
#define IUP_VERSION_NUMBER 330000
#define IUP_VERSION_DATE "2020/07/30"  /* does not include bug fix releases */

typedef struct Ihandle_ Ihandle;
typedef int (*Icallback)(Ihandle*);

/************************************************************************/
/*                        Main API                                      */
/************************************************************************/

IUP_API int       IupOpen          (int *argc, char ***argv);
IUP_API void      IupClose         (void);
IUP_API int       IupIsOpened      (void);

IUPIMGLIB_API void IupImageLibOpen(void);

IUP_API int       IupMainLoop      (void);
IUP_API int       IupLoopStep      (void);
IUP_API int       IupLoopStepWait  (void);
IUP_API int       IupMainLoopLevel (void);
IUP_API void      IupFlush         (void);
IUP_API void      IupExitLoop      (void);
IUP_API void      IupPostMessage   (Ihandle* ih, const char* s, int i, double d, void* p);

IUP_API int       IupRecordInput(const char* filename, int mode);
IUP_API int       IupPlayInput(const char* filename);

IUP_API void      IupUpdate        (Ihandle* ih);
IUP_API void      IupUpdateChildren(Ihandle* ih);
IUP_API void      IupRedraw        (Ihandle* ih, int children);
IUP_API void      IupRefresh       (Ihandle* ih);
IUP_API void      IupRefreshChildren(Ihandle* ih);

IUP_API int       IupExecute(const char *filename, const char* parameters);
IUP_API int       IupExecuteWait(const char *filename, const char* parameters);
IUP_API int       IupHelp(const char* url);
IUP_API void      IupLog(const char* type, const char* format, ...);

IUP_API char*     IupLoad          (const char *filename);
IUP_API char*     IupLoadBuffer    (const char *buffer);

IUP_API char*     IupVersion       (void);
IUP_API char*     IupVersionDate   (void);
IUP_API int       IupVersionNumber (void);
IUP_API void      IupVersionShow   (void);

IUP_API void      IupSetLanguage   (const char *lng);
IUP_API char*     IupGetLanguage   (void);
IUP_API void      IupSetLanguageString(const char* name, const char* str);
IUP_API void      IupStoreLanguageString(const char* name, const char* str);
IUP_API char*     IupGetLanguageString(const char* name);
IUP_API void      IupSetLanguagePack(Ihandle* ih);

IUP_API void      IupDestroy      (Ihandle* ih);
IUP_API void      IupDetach       (Ihandle* child);
IUP_API Ihandle*  IupAppend       (Ihandle* ih, Ihandle* child);
IUP_API Ihandle*  IupInsert       (Ihandle* ih, Ihandle* ref_child, Ihandle* child);
IUP_API Ihandle*  IupGetChild     (Ihandle* ih, int pos);
IUP_API int       IupGetChildPos  (Ihandle* ih, Ihandle* child);
IUP_API int       IupGetChildCount(Ihandle* ih);
IUP_API Ihandle*  IupGetNextChild (Ihandle* ih, Ihandle* child);
IUP_API Ihandle*  IupGetBrother   (Ihandle* ih);
IUP_API Ihandle*  IupGetParent    (Ihandle* ih);
IUP_API Ihandle*  IupGetDialog    (Ihandle* ih);
IUP_API Ihandle*  IupGetDialogChild(Ihandle* ih, const char* name);
IUP_API int       IupReparent     (Ihandle* ih, Ihandle* new_parent, Ihandle* ref_child);

IUP_API int       IupPopup         (Ihandle* ih, int x, int y);
IUP_API int       IupShow          (Ihandle* ih);
IUP_API int       IupShowXY        (Ihandle* ih, int x, int y);
IUP_API int       IupHide          (Ihandle* ih);
IUP_API int       IupMap           (Ihandle* ih);
IUP_API void      IupUnmap         (Ihandle* ih);

IUP_API void      IupResetAttribute(Ihandle* ih, const char* name);
IUP_API int       IupGetAllAttributes(Ihandle* ih, char** names, int n);
IUP_API void      IupCopyAttributes(Ihandle* src_ih, Ihandle* dst_ih);
IUP_API Ihandle*  IupSetAtt(const char* handle_name, Ihandle* ih, const char* name, ...);
IUP_API Ihandle*  IupSetAttributes (Ihandle* ih, const char *str);
IUP_API char*     IupGetAttributes (Ihandle* ih);

IUP_API void      IupSetAttribute   (Ihandle* ih, const char* name, const char* value);
IUP_API void      IupSetStrAttribute(Ihandle* ih, const char* name, const char* value);
IUP_API void      IupSetStrf        (Ihandle* ih, const char* name, const char* format, ...);
IUP_API void      IupSetInt         (Ihandle* ih, const char* name, int value);
IUP_API void      IupSetFloat       (Ihandle* ih, const char* name, float value);
IUP_API void      IupSetDouble      (Ihandle* ih, const char* name, double value);
IUP_API void      IupSetRGB         (Ihandle* ih, const char* name, unsigned char r, unsigned char g, unsigned char b);
IUP_API void      IupSetRGBA        (Ihandle* ih, const char* name, unsigned char r, unsigned char g, unsigned char b, unsigned char a);

IUP_API char*     IupGetAttribute(Ihandle* ih, const char* name);
IUP_API int       IupGetInt      (Ihandle* ih, const char* name);
IUP_API int       IupGetInt2     (Ihandle* ih, const char* name);
IUP_API int       IupGetIntInt   (Ihandle* ih, const char* name, int *i1, int *i2);
IUP_API float     IupGetFloat    (Ihandle* ih, const char* name);
IUP_API double    IupGetDouble(Ihandle* ih, const char* name);
IUP_API void      IupGetRGB      (Ihandle* ih, const char* name, unsigned char *r, unsigned char *g, unsigned char *b);
IUP_API void      IupGetRGBA     (Ihandle* ih, const char* name, unsigned char *r, unsigned char *g, unsigned char *b, unsigned char *a);

IUP_API void  IupSetAttributeId(Ihandle* ih, const char* name, int id, const char *value);
IUP_API void  IupSetStrAttributeId(Ihandle* ih, const char* name, int id, const char *value);
IUP_API void  IupSetStrfId(Ihandle* ih, const char* name, int id, const char* format, ...);
IUP_API void  IupSetIntId(Ihandle* ih, const char* name, int id, int value);
IUP_API void  IupSetFloatId(Ihandle* ih, const char* name, int id, float value);
IUP_API void  IupSetDoubleId(Ihandle* ih, const char* name, int id, double value);
IUP_API void  IupSetRGBId(Ihandle* ih, const char* name, int id, unsigned char r, unsigned char g, unsigned char b);

IUP_API char*  IupGetAttributeId(Ihandle* ih, const char* name, int id);
IUP_API int    IupGetIntId(Ihandle* ih, const char* name, int id);
IUP_API float  IupGetFloatId(Ihandle* ih, const char* name, int id);
IUP_API double IupGetDoubleId(Ihandle* ih, const char* name, int id);
IUP_API void   IupGetRGBId(Ihandle* ih, const char* name, int id, unsigned char *r, unsigned char *g, unsigned char *b);

IUP_API void  IupSetAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
IUP_API void  IupSetStrAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
IUP_API void  IupSetStrfId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);
IUP_API void  IupSetIntId2(Ihandle* ih, const char* name, int lin, int col, int value);
IUP_API void  IupSetFloatId2(Ihandle* ih, const char* name, int lin, int col, float value);
IUP_API void  IupSetDoubleId2(Ihandle* ih, const char* name, int lin, int col, double value);
IUP_API void  IupSetRGBId2(Ihandle* ih, const char* name, int lin, int col, unsigned char r, unsigned char g, unsigned char b);

IUP_API char*  IupGetAttributeId2(Ihandle* ih, const char* name, int lin, int col);
IUP_API int    IupGetIntId2(Ihandle* ih, const char* name, int lin, int col);
IUP_API float  IupGetFloatId2(Ihandle* ih, const char* name, int lin, int col);
IUP_API double IupGetDoubleId2(Ihandle* ih, const char* name, int lin, int col);
IUP_API void   IupGetRGBId2(Ihandle* ih, const char* name, int lin, int col, unsigned char *r, unsigned char *g, unsigned char *b);

IUP_API void      IupSetGlobal  (const char* name, const char* value);
IUP_API void      IupSetStrGlobal(const char* name, const char* value);
IUP_API char*     IupGetGlobal  (const char* name);

IUP_API Ihandle*  IupSetFocus     (Ihandle* ih);
IUP_API Ihandle*  IupGetFocus     (void);
IUP_API Ihandle*  IupPreviousField(Ihandle* ih);
IUP_API Ihandle*  IupNextField    (Ihandle* ih);

IUP_API Icallback IupGetCallback (Ihandle* ih, const char *name);
IUP_API Icallback IupSetCallback (Ihandle* ih, const char *name, Icallback func);
IUP_API Ihandle*  IupSetCallbacks(Ihandle* ih, const char *name, Icallback func, ...);

IUP_API Icallback IupGetFunction(const char *name);
IUP_API Icallback IupSetFunction(const char *name, Icallback func);

IUP_API Ihandle*  IupGetHandle    (const char *name);
IUP_API Ihandle*  IupSetHandle    (const char *name, Ihandle* ih);
IUP_API int       IupGetAllNames  (char** names, int n);
IUP_API int       IupGetAllDialogs(char** names, int n);
IUP_API char*     IupGetName      (Ihandle* ih);

IUP_API void      IupSetAttributeHandle(Ihandle* ih, const char* name, Ihandle* ih_named);
IUP_API Ihandle*  IupGetAttributeHandle(Ihandle* ih, const char* name);
IUP_API void      IupSetAttributeHandleId(Ihandle* ih, const char* name, int id, Ihandle* ih_named);
IUP_API Ihandle*  IupGetAttributeHandleId(Ihandle* ih, const char* name, int id);
IUP_API void      IupSetAttributeHandleId2(Ihandle* ih, const char* name, int lin, int col, Ihandle* ih_named);
IUP_API Ihandle*  IupGetAttributeHandleId2(Ihandle* ih, const char* name, int lin, int col);

IUP_API char*     IupGetClassName(Ihandle* ih);
IUP_API char*     IupGetClassType(Ihandle* ih);
IUP_API int       IupGetAllClasses(char** names, int n);
IUP_API int       IupGetClassAttributes(const char* classname, char** names, int n);
IUP_API int       IupGetClassCallbacks(const char* classname, char** names, int n);
IUP_API void      IupSaveClassAttributes(Ihandle* ih);
IUP_API void      IupCopyClassAttributes(Ihandle* src_ih, Ihandle* dst_ih);
IUP_API void      IupSetClassDefaultAttribute(const char* classname, const char *name, const char* value);
IUP_API int       IupClassMatch(Ihandle* ih, const char* classname);

IUP_API Ihandle*  IupCreate (const char *classname);
IUP_API Ihandle*  IupCreatev(const char *classname, void* *params);
IUP_API Ihandle*  IupCreatep(const char *classname, void* first, ...);

/************************************************************************/
/*                        Elements                                      */
/************************************************************************/

IUP_API Ihandle*  IupFill (void);
IUP_API Ihandle*  IupSpace(void);

IUP_API Ihandle*  IupRadio      (Ihandle* child);
IUP_API Ihandle*  IupVbox       (Ihandle* child, ...);
IUP_API Ihandle*  IupVboxv      (Ihandle* *children);
IUP_API Ihandle*  IupZbox       (Ihandle* child, ...);
IUP_API Ihandle*  IupZboxv      (Ihandle* *children);
IUP_API Ihandle*  IupHbox       (Ihandle* child, ...);
IUP_API Ihandle*  IupHboxv      (Ihandle* *children);

IUP_API Ihandle*  IupNormalizer (Ihandle* ih_first, ...);
IUP_API Ihandle*  IupNormalizerv(Ihandle* *ih_list);

IUP_API Ihandle*  IupCbox       (Ihandle* child, ...);
IUP_API Ihandle*  IupCboxv      (Ihandle* *children);
IUP_API Ihandle*  IupSbox       (Ihandle* child);
IUP_API Ihandle*  IupSplit      (Ihandle* child1, Ihandle* child2);
IUP_API Ihandle*  IupScrollBox  (Ihandle* child);
IUP_API Ihandle*  IupFlatScrollBox(Ihandle* child);
IUP_API Ihandle*  IupGridBox    (Ihandle* child, ...);
IUP_API Ihandle*  IupGridBoxv   (Ihandle* *children);
IUP_API Ihandle*  IupMultiBox   (Ihandle* child, ...);
IUP_API Ihandle*  IupMultiBoxv  (Ihandle **children);
IUP_API Ihandle*  IupExpander(Ihandle* child);
IUP_API Ihandle*  IupDetachBox  (Ihandle* child);
IUP_API Ihandle*  IupBackgroundBox(Ihandle* child);

IUP_API Ihandle*  IupFrame      (Ihandle* child);
IUP_API Ihandle*  IupFlatFrame  (Ihandle* child);

IUP_API Ihandle*  IupImage      (int width, int height, const unsigned char* pixels);
IUP_API Ihandle*  IupImageRGB   (int width, int height, const unsigned char* pixels);
IUP_API Ihandle*  IupImageRGBA  (int width, int height, const unsigned char* pixels);

IUP_API Ihandle*  IupItem       (const char* title, const char* action);
IUP_API Ihandle*  IupSubmenu    (const char* title, Ihandle* child);
IUP_API Ihandle*  IupSeparator  (void);
IUP_API Ihandle*  IupMenu       (Ihandle* child, ...);
IUP_API Ihandle*  IupMenuv      (Ihandle* *children);

IUP_API Ihandle*  IupButton     (const char* title, const char* action);
IUP_API Ihandle*  IupFlatButton (const char* title);
IUP_API Ihandle*  IupFlatToggle (const char* title);
IUP_API Ihandle*  IupDropButton (Ihandle* dropchild);
IUP_API Ihandle*  IupFlatLabel  (const char* title);
IUP_API Ihandle*  IupFlatSeparator(void);
IUP_API Ihandle*  IupCanvas     (const char* action);
IUP_API Ihandle*  IupDialog     (Ihandle* child);
IUP_API Ihandle*  IupUser       (void);
IUP_API Ihandle*  IupThread     (void);
IUP_API Ihandle*  IupLabel      (const char* title);
IUP_API Ihandle*  IupList       (const char* action);
IUP_API Ihandle*  IupFlatList   (void);
IUP_API Ihandle*  IupText       (const char* action);
IUP_API Ihandle*  IupMultiLine  (const char* action);
IUP_API Ihandle*  IupToggle     (const char* title, const char* action);
IUP_API Ihandle*  IupTimer      (void);
IUP_API Ihandle*  IupClipboard  (void);
IUP_API Ihandle*  IupProgressBar(void);
IUP_API Ihandle*  IupVal        (const char *type);
IUP_API Ihandle*  IupFlatVal    (const char *type);
IUP_API Ihandle*  IupFlatTree   (void);
IUP_API Ihandle*  IupTabs       (Ihandle* child, ...);
IUP_API Ihandle*  IupTabsv      (Ihandle* *children);
IUP_API Ihandle*  IupFlatTabs   (Ihandle* first, ...);
IUP_API Ihandle*  IupFlatTabsv  (Ihandle* *children);
IUP_API Ihandle*  IupTree       (void);
IUP_API Ihandle*  IupLink       (const char* url, const char* title);
IUP_API Ihandle*  IupAnimatedLabel(Ihandle* animation);
IUP_API Ihandle*  IupDatePick   (void);
IUP_API Ihandle*  IupCalendar   (void);
IUP_API Ihandle*  IupColorbar   (void);
IUP_API Ihandle*  IupGauge      (void);
IUP_API Ihandle*  IupDial       (const char* type);
IUP_API Ihandle*  IupColorBrowser(void);

/* Old controls, use SPIN attribute of IupText */
IUP_API Ihandle*  IupSpin       (void);
IUP_API Ihandle*  IupSpinbox    (Ihandle* child);

/************************************************************************/
/*                      Utilities                                       */
/************************************************************************/

/* String compare utility */
IUP_API int IupStringCompare(const char* str1, const char* str2, int casesensitive, int lexicographic);

/* IupImage utilities */
IUP_API int IupSaveImageAsText(Ihandle* ih, const char* filename, const char* format, const char* name);
IUP_API Ihandle* IupImageGetHandle(const char* name);

/* IupText and IupScintilla utilities */
IUP_API void  IupTextConvertLinColToPos(Ihandle* ih, int lin, int col, int *pos);
IUP_API void  IupTextConvertPosToLinCol(Ihandle* ih, int pos, int *lin, int *col);

/* IupText, IupList, IupTree, IupMatrix and IupScintilla utility */
IUP_API int   IupConvertXYToPos(Ihandle* ih, int x, int y);

/* OLD names, kept for backward compatibility, will never be removed. */
IUP_API void IupStoreGlobal(const char* name, const char* value);
IUP_API void IupStoreAttribute(Ihandle* ih, const char* name, const char* value);
IUP_API void IupSetfAttribute(Ihandle* ih, const char* name, const char* format, ...);
IUP_API void IupStoreAttributeId(Ihandle* ih, const char* name, int id, const char *value);
IUP_API void IupSetfAttributeId(Ihandle* ih, const char* name, int id, const char* f, ...);
IUP_API void IupStoreAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* value);
IUP_API void IupSetfAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);

/* IupTree and IupFlatTree utilities (work for both) */
IUP_API int   IupTreeSetUserId(Ihandle* ih, int id, void* userid);
IUP_API void* IupTreeGetUserId(Ihandle* ih, int id);
IUP_API int   IupTreeGetId(Ihandle* ih, void *userid);
IUP_API void  IupTreeSetAttributeHandle(Ihandle* ih, const char* name, int id, Ihandle* ih_named); /* deprecated, use IupSetAttributeHandleId */

/************************************************************************/
/*                      Pre-defined dialogs                           */
/************************************************************************/

IUP_API Ihandle* IupFileDlg(void);
IUP_API Ihandle* IupMessageDlg(void);
IUP_API Ihandle* IupColorDlg(void);
IUP_API Ihandle* IupFontDlg(void);
IUP_API Ihandle* IupProgressDlg(void);

IUP_API int  IupGetFile(char *arq);
IUP_API void IupMessage(const char *title, const char *msg);
IUP_API void IupMessagef(const char *title, const char *format, ...);
IUP_API void IupMessageError(Ihandle* parent, const char* message);
IUP_API int IupMessageAlarm(Ihandle* parent, const char* title, const char *message, const char *buttons);
IUP_API int  IupAlarm(const char *title, const char *msg, const char *b1, const char *b2, const char *b3);
IUP_API int  IupScanf(const char *format, ...);
IUP_API int  IupListDialog(int type, const char *title, int size, const char** list,
				   int op, int max_col, int max_lin, int* marks);
IUP_API int  IupGetText(const char* title, char* text, int maxsize);
IUP_API int  IupGetColor(int x, int y, unsigned char* r, unsigned char* g, unsigned char* b);

typedef int (*Iparamcb)(Ihandle* dialog, int param_index, void* user_data);
IUP_API int IupGetParam(const char* title, Iparamcb action, void* user_data, const char* format,...);
IUP_API int IupGetParamv(const char* title, Iparamcb action, void* user_data, const char* format, int param_count, int param_extra, void** param_data);
IUP_API Ihandle* IupParam(const char* format);
IUP_API Ihandle*  IupParamBox(Ihandle* param, ...);
IUP_API Ihandle*  IupParamBoxv(Ihandle* *param_array);

IUP_API Ihandle* IupLayoutDialog(Ihandle* dialog);
IUP_API Ihandle* IupElementPropertiesDialog(Ihandle* parent, Ihandle* elem);
IUP_API Ihandle* IupGlobalsDialog(void);
IUP_API Ihandle* IupClassInfoDialog(Ihandle* parent);

#ifdef __cplusplus
}
#endif

/************************************************************************/
/*                   Common Flags and Return Values                     */
/************************************************************************/
#define IUP_ERROR     1
#define IUP_NOERROR   0
#define IUP_OPENED   -1
#define IUP_INVALID  -1
#define IUP_INVALID_ID -10

/************************************************************************/
/*                   Callback Return Values                             */
/************************************************************************/
#define IUP_IGNORE    -1
#define IUP_DEFAULT   -2
#define IUP_CLOSE     -3
#define IUP_CONTINUE  -4

/************************************************************************/
/*           IupPopup and IupShowXY Parameter Values                    */
/************************************************************************/
#define IUP_CENTER        0xFFFF  /* 65535 */
#define IUP_LEFT          0xFFFE  /* 65534 */
#define IUP_RIGHT         0xFFFD  /* 65533 */
#define IUP_MOUSEPOS      0xFFFC  /* 65532 */
#define IUP_CURRENT       0xFFFB  /* 65531 */
#define IUP_CENTERPARENT  0xFFFA  /* 65530 */
#define IUP_LEFTPARENT    0xFFF9  /* 65529 */
#define IUP_RIGHTPARENT   0xFFF8  /* 65528 */
#define IUP_TOP           IUP_LEFT
#define IUP_BOTTOM        IUP_RIGHT
#define IUP_TOPPARENT     IUP_LEFTPARENT
#define IUP_BOTTOMPARENT  IUP_RIGHTPARENT

/************************************************************************/
/*               SHOW_CB Callback Values                                */
/************************************************************************/
enum{IUP_SHOW, IUP_RESTORE, IUP_MINIMIZE, IUP_MAXIMIZE, IUP_HIDE};

/************************************************************************/
/*               SCROLL_CB Callback Values                              */
/************************************************************************/
enum{IUP_SBUP,   IUP_SBDN,    IUP_SBPGUP,   IUP_SBPGDN,    IUP_SBPOSV, IUP_SBDRAGV,
	 IUP_SBLEFT, IUP_SBRIGHT, IUP_SBPGLEFT, IUP_SBPGRIGHT, IUP_SBPOSH, IUP_SBDRAGH};

/************************************************************************/
/*               Mouse Button Values and Macros                         */
/************************************************************************/
#define IUP_BUTTON1   '1'
#define IUP_BUTTON2   '2'
#define IUP_BUTTON3   '3'
#define IUP_BUTTON4   '4'
#define IUP_BUTTON5   '5'

#define iup_isshift(_s)    (_s[0]=='S')
#define iup_iscontrol(_s)  (_s[1]=='C')
#define iup_isbutton1(_s)  (_s[2]=='1')
#define iup_isbutton2(_s)  (_s[3]=='2')
#define iup_isbutton3(_s)  (_s[4]=='3')
#define iup_isdouble(_s)   (_s[5]=='D')
#define iup_isalt(_s)      (_s[6]=='A')
#define iup_issys(_s)      (_s[7]=='Y')
#define iup_isbutton4(_s)  (_s[8]=='4')
#define iup_isbutton5(_s)  (_s[9]=='5')

/* Old definitions for backward compatibility */
#define isshift     iup_isshift
#define iscontrol   iup_iscontrol
#define isbutton1   iup_isbutton1
#define isbutton2   iup_isbutton2
#define isbutton3   iup_isbutton3
#define isdouble    iup_isdouble
#define isalt       iup_isalt
#define issys       iup_issys
#define isbutton4   iup_isbutton4
#define isbutton5   iup_isbutton5

/************************************************************************/
/*                      Pre-Defined Masks                               */
/************************************************************************/
#define IUP_MASK_FLOAT       "[+/-]?(/d+/.?/d*|/./d+)"
#define IUP_MASK_UFLOAT            "(/d+/.?/d*|/./d+)"
#define IUP_MASK_EFLOAT      "[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
#define IUP_MASK_UEFLOAT           "(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?"
#define IUP_MASK_FLOATCOMMA  "[+/-]?(/d+/,?/d*|/,/d+)"
#define IUP_MASK_UFLOATCOMMA       "(/d+/,?/d*|/,/d+)"
#define IUP_MASK_INT          "[+/-]?/d+"
#define IUP_MASK_UINT               "/d+"

/* Old definitions for backward compatibility */
#define IUPMASK_FLOAT     IUP_MASK_FLOAT
#define IUPMASK_UFLOAT    IUP_MASK_UFLOAT
#define IUPMASK_EFLOAT    IUP_MASK_EFLOAT
#define IUPMASK_INT       IUP_MASK_INT
#define IUPMASK_UINT      IUP_MASK_UINT

/************************************************************************/
/*                   IupGetParam Callback situations                    */
/************************************************************************/
#define IUP_GETPARAM_BUTTON1 -1
#define IUP_GETPARAM_INIT    -2
#define IUP_GETPARAM_BUTTON2 -3
#define IUP_GETPARAM_BUTTON3 -4
#define IUP_GETPARAM_CLOSE   -5
#define IUP_GETPARAM_MAP     -6
#define IUP_GETPARAM_OK     IUP_GETPARAM_BUTTON1
#define IUP_GETPARAM_CANCEL IUP_GETPARAM_BUTTON2
#define IUP_GETPARAM_HELP   IUP_GETPARAM_BUTTON3

/************************************************************************/
/*                   Used by IupColorbar                                */
/************************************************************************/
#define IUP_PRIMARY -1
#define IUP_SECONDARY -2

/************************************************************************/
/*                   Record Input Modes                                 */
/************************************************************************/
enum {IUP_RECBINARY, IUP_RECTEXT};

/************************************************************************/
/*              Replacement for the WinMain in Windows,                 */
/*        this allows the application to start from "main".             */
/*        Used only for Watcom.                                         */
/************************************************************************/
#if defined (__WATCOMC__)
#ifdef __cplusplus
extern "C" {
int IupMain (int argc, char** argv); /* In C++ we have to declare the prototype */
}
#endif
#define main IupMain /* this is the trick for Watcom and MetroWerks */
#endif

/******************************************************************************
* Copyright (C) 1994-2019 Tecgraf/PUC-Rio.
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************/

#endif

