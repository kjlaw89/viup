[translated]
module iup

type Icallback = fn (voidptr) int
fn C.IupOpen(argc &int, argv &&&i8) int

pub fn iupopen(argc &int, argv &&&i8) int {
	return C.IupOpen(argc, argv)
}

fn C.IupClose() 

pub fn iupclose()  {
	C.IupClose()
}

fn C.IupIsOpened() int

pub fn iupisopened() int {
	return C.IupIsOpened()
}

fn C.IupImageLibOpen() 

pub fn iupimagelibopen()  {
	C.IupImageLibOpen()
}

fn C.IupMainLoop() int

pub fn iupmainloop() int {
	return C.IupMainLoop()
}

fn C.IupLoopStep() int

pub fn iuploopstep() int {
	return C.IupLoopStep()
}

fn C.IupLoopStepWait() int

pub fn iuploopstepwait() int {
	return C.IupLoopStepWait()
}

fn C.IupMainLoopLevel() int

pub fn iupmainlooplevel() int {
	return C.IupMainLoopLevel()
}

fn C.IupFlush() 

pub fn iupflush()  {
	C.IupFlush()
}

fn C.IupExitLoop() 

pub fn iupexitloop()  {
	C.IupExitLoop()
}

fn C.IupPostMessage(ih voidptr, s &i8, i int, d f64, p voidptr) 

pub fn iuppostmessage(ih voidptr, s &i8, i int, d f64, p voidptr)  {
	C.IupPostMessage(ih, s, i, d, p)
}

fn C.IupRecordInput(filename &i8, mode int) int

pub fn iuprecordinput(filename &i8, mode int) int {
	return C.IupRecordInput(filename, mode)
}

fn C.IupPlayInput(filename &i8) int

pub fn iupplayinput(filename &i8) int {
	return C.IupPlayInput(filename)
}

fn C.IupUpdate(ih voidptr) 

pub fn iupupdate(ih voidptr)  {
	C.IupUpdate(ih)
}

fn C.IupUpdateChildren(ih voidptr) 

pub fn iupupdatechildren(ih voidptr)  {
	C.IupUpdateChildren(ih)
}

fn C.IupRedraw(ih voidptr, children int) 

pub fn iupredraw(ih voidptr, children int)  {
	C.IupRedraw(ih, children)
}

fn C.IupRefresh(ih voidptr) 

pub fn iuprefresh(ih voidptr)  {
	C.IupRefresh(ih)
}

fn C.IupRefreshChildren(ih voidptr) 

pub fn iuprefreshchildren(ih voidptr)  {
	C.IupRefreshChildren(ih)
}

fn C.IupExecute(filename &i8, parameters &i8) int

pub fn iupexecute(filename &i8, parameters &i8) int {
	return C.IupExecute(filename, parameters)
}

fn C.IupExecuteWait(filename &i8, parameters &i8) int

pub fn iupexecutewait(filename &i8, parameters &i8) int {
	return C.IupExecuteWait(filename, parameters)
}

fn C.IupHelp(url &i8) int

pub fn iuphelp(url &i8) int {
	return C.IupHelp(url)
}

[c2v_variadic]
fn C.IupLog(type_ &i8, format &i8) 

pub fn iuplog(type_ &i8, format &i8)  {
	C.IupLog(type_, format)
}

fn C.IupLoad(filename &i8) &i8

pub fn iupload(filename &i8) &i8 {
	return C.IupLoad(filename)
}

fn C.IupLoadBuffer(buffer &i8) &i8

pub fn iuploadbuffer(buffer &i8) &i8 {
	return C.IupLoadBuffer(buffer)
}

fn C.IupVersion() &i8

pub fn iupversion() &i8 {
	return C.IupVersion()
}

fn C.IupVersionDate() &i8

pub fn iupversiondate() &i8 {
	return C.IupVersionDate()
}

fn C.IupVersionNumber() int

pub fn iupversionnumber() int {
	return C.IupVersionNumber()
}

fn C.IupVersionShow() 

pub fn iupversionshow()  {
	C.IupVersionShow()
}

fn C.IupSetLanguage(lng &i8) 

pub fn iupsetlanguage(lng &i8)  {
	C.IupSetLanguage(lng)
}

fn C.IupGetLanguage() &i8

pub fn iupgetlanguage() &i8 {
	return C.IupGetLanguage()
}

fn C.IupSetLanguageString(name &i8, str &i8) 

pub fn iupsetlanguagestring(name &i8, str &i8)  {
	C.IupSetLanguageString(name, str)
}

fn C.IupStoreLanguageString(name &i8, str &i8) 

pub fn iupstorelanguagestring(name &i8, str &i8)  {
	C.IupStoreLanguageString(name, str)
}

fn C.IupGetLanguageString(name &i8) &i8

pub fn iupgetlanguagestring(name &i8) &i8 {
	return C.IupGetLanguageString(name)
}

fn C.IupSetLanguagePack(ih voidptr) 

pub fn iupsetlanguagepack(ih voidptr)  {
	C.IupSetLanguagePack(ih)
}

fn C.IupDestroy(ih voidptr) 

pub fn iupdestroy(ih voidptr)  {
	C.IupDestroy(ih)
}

fn C.IupDetach(child voidptr) 

pub fn iupdetach(child voidptr)  {
	C.IupDetach(child)
}

fn C.IupAppend(ih voidptr, child voidptr) voidptr

pub fn iupappend(ih voidptr, child voidptr) voidptr {
	return C.IupAppend(ih, child)
}

fn C.IupInsert(ih voidptr, ref_child voidptr, child voidptr) voidptr

pub fn iupinsert(ih voidptr, ref_child voidptr, child voidptr) voidptr {
	return C.IupInsert(ih, ref_child, child)
}

fn C.IupGetChild(ih voidptr, pos int) voidptr

pub fn iupgetchild(ih voidptr, pos int) voidptr {
	return C.IupGetChild(ih, pos)
}

fn C.IupGetChildPos(ih voidptr, child voidptr) int

pub fn iupgetchildpos(ih voidptr, child voidptr) int {
	return C.IupGetChildPos(ih, child)
}

fn C.IupGetChildCount(ih voidptr) int

pub fn iupgetchildcount(ih voidptr) int {
	return C.IupGetChildCount(ih)
}

fn C.IupGetNextChild(ih voidptr, child voidptr) voidptr

pub fn iupgetnextchild(ih voidptr, child voidptr) voidptr {
	return C.IupGetNextChild(ih, child)
}

fn C.IupGetBrother(ih voidptr) voidptr

pub fn iupgetbrother(ih voidptr) voidptr {
	return C.IupGetBrother(ih)
}

fn C.IupGetParent(ih voidptr) voidptr

pub fn iupgetparent(ih voidptr) voidptr {
	return C.IupGetParent(ih)
}

fn C.IupGetDialog(ih voidptr) voidptr

pub fn iupgetdialog(ih voidptr) voidptr {
	return C.IupGetDialog(ih)
}

fn C.IupGetDialogChild(ih voidptr, name &i8) voidptr

pub fn iupgetdialogchild(ih voidptr, name &i8) voidptr {
	return C.IupGetDialogChild(ih, name)
}

fn C.IupReparent(ih voidptr, new_parent voidptr, ref_child voidptr) int

pub fn iupreparent(ih voidptr, new_parent voidptr, ref_child voidptr) int {
	return C.IupReparent(ih, new_parent, ref_child)
}

fn C.IupPopup(ih voidptr, x int, y int) int

pub fn iuppopup(ih voidptr, x int, y int) int {
	return C.IupPopup(ih, x, y)
}

fn C.IupShow(ih voidptr) int

pub fn iupshow(ih voidptr) int {
	return C.IupShow(ih)
}

fn C.IupShowXY(ih voidptr, x int, y int) int

pub fn iupshowxy(ih voidptr, x int, y int) int {
	return C.IupShowXY(ih, x, y)
}

fn C.IupHide(ih voidptr) int

pub fn iuphide(ih voidptr) int {
	return C.IupHide(ih)
}

fn C.IupMap(ih voidptr) int

pub fn iupmap(ih voidptr) int {
	return C.IupMap(ih)
}

fn C.IupUnmap(ih voidptr) 

pub fn iupunmap(ih voidptr)  {
	C.IupUnmap(ih)
}

fn C.IupResetAttribute(ih voidptr, name &i8) 

pub fn iupresetattribute(ih voidptr, name &i8)  {
	C.IupResetAttribute(ih, name)
}

fn C.IupGetAllAttributes(ih voidptr, names &&u8, n int) int

pub fn iupgetallattributes(ih voidptr, names &&u8, n int) int {
	return C.IupGetAllAttributes(ih, names, n)
}

fn C.IupCopyAttributes(src_ih voidptr, dst_ih voidptr) 

pub fn iupcopyattributes(src_ih voidptr, dst_ih voidptr)  {
	C.IupCopyAttributes(src_ih, dst_ih)
}

[c2v_variadic]
fn C.IupSetAtt(handle_name &i8, ih voidptr, name &i8) voidptr

pub fn iupsetatt(handle_name &i8, ih voidptr, name &i8) voidptr {
	return C.IupSetAtt(handle_name, ih, name)
}

fn C.IupSetAttributes(ih voidptr, str &i8) voidptr

pub fn iupsetattributes(ih voidptr, str &i8) voidptr {
	return C.IupSetAttributes(ih, str)
}

fn C.IupGetAttributes(ih voidptr) &i8

pub fn iupgetattributes(ih voidptr) &i8 {
	return C.IupGetAttributes(ih)
}

fn C.IupSetAttribute(ih voidptr, name &i8, value &i8) 

pub fn iupsetattribute(ih voidptr, name &i8, value &i8)  {
	C.IupSetAttribute(ih, name, value)
}

fn C.IupSetStrAttribute(ih voidptr, name &i8, value &i8) 

pub fn iupsetstrattribute(ih voidptr, name &i8, value &i8)  {
	C.IupSetStrAttribute(ih, name, value)
}

[c2v_variadic]
fn C.IupSetStrf(ih voidptr, name &i8, format &i8) 

pub fn iupsetstrf(ih voidptr, name &i8, format &i8)  {
	C.IupSetStrf(ih, name, format)
}

fn C.IupSetInt(ih voidptr, name &i8, value int) 

pub fn iupsetint(ih voidptr, name &i8, value int)  {
	C.IupSetInt(ih, name, value)
}

fn C.IupSetFloat(ih voidptr, name &i8, value f32) 

pub fn iupsetfloat(ih voidptr, name &i8, value f32)  {
	C.IupSetFloat(ih, name, value)
}

fn C.IupSetDouble(ih voidptr, name &i8, value f64) 

pub fn iupsetdouble(ih voidptr, name &i8, value f64)  {
	C.IupSetDouble(ih, name, value)
}

fn C.IupSetRGB(ih voidptr, name &i8, r u8, g u8, b u8) 

pub fn iupsetrgb(ih voidptr, name &i8, r u8, g u8, b u8)  {
	C.IupSetRGB(ih, name, r, g, b)
}

fn C.IupSetRGBA(ih voidptr, name &i8, r u8, g u8, b u8, a u8) 

pub fn iupsetrgba(ih voidptr, name &i8, r u8, g u8, b u8, a u8)  {
	C.IupSetRGBA(ih, name, r, g, b, a)
}

fn C.IupGetAttribute(ih voidptr, name &i8) &i8

pub fn iupgetattribute(ih voidptr, name &i8) &i8 {
	return C.IupGetAttribute(ih, name)
}

fn C.IupGetInt(ih voidptr, name &i8) int

pub fn iupgetint(ih voidptr, name &i8) int {
	return C.IupGetInt(ih, name)
}

fn C.IupGetInt2(ih voidptr, name &i8) int

pub fn iupgetint2(ih voidptr, name &i8) int {
	return C.IupGetInt2(ih, name)
}

fn C.IupGetIntInt(ih voidptr, name &i8, i1 &int, i2 &int) int

pub fn iupgetintint(ih voidptr, name &i8, i1 &int, i2 &int) int {
	return C.IupGetIntInt(ih, name, i1, i2)
}

fn C.IupGetFloat(ih voidptr, name &i8) f32

pub fn iupgetfloat(ih voidptr, name &i8) f32 {
	return C.IupGetFloat(ih, name)
}

fn C.IupGetDouble(ih voidptr, name &i8) f64

pub fn iupgetdouble(ih voidptr, name &i8) f64 {
	return C.IupGetDouble(ih, name)
}

fn C.IupGetRGB(ih voidptr, name &i8, r &u8, g &u8, b &u8) 

pub fn iupgetrgb(ih voidptr, name &i8, r &u8, g &u8, b &u8)  {
	C.IupGetRGB(ih, name, r, g, b)
}

fn C.IupGetRGBA(ih voidptr, name &i8, r &u8, g &u8, b &u8, a &u8) 

pub fn iupgetrgba(ih voidptr, name &i8, r &u8, g &u8, b &u8, a &u8)  {
	C.IupGetRGBA(ih, name, r, g, b, a)
}

fn C.IupSetAttributeId(ih voidptr, name &i8, id int, value &i8) 

pub fn iupsetattributeid(ih voidptr, name &i8, id int, value &i8)  {
	C.IupSetAttributeId(ih, name, id, value)
}

fn C.IupSetStrAttributeId(ih voidptr, name &i8, id int, value &i8) 

pub fn iupsetstrattributeid(ih voidptr, name &i8, id int, value &i8)  {
	C.IupSetStrAttributeId(ih, name, id, value)
}

[c2v_variadic]
fn C.IupSetStrfId(ih voidptr, name &i8, id int, format &i8) 

pub fn iupsetstrfid(ih voidptr, name &i8, id int, format &i8)  {
	C.IupSetStrfId(ih, name, id, format)
}

fn C.IupSetIntId(ih voidptr, name &i8, id int, value int) 

pub fn iupsetintid(ih voidptr, name &i8, id int, value int)  {
	C.IupSetIntId(ih, name, id, value)
}

fn C.IupSetFloatId(ih voidptr, name &i8, id int, value f32) 

pub fn iupsetfloatid(ih voidptr, name &i8, id int, value f32)  {
	C.IupSetFloatId(ih, name, id, value)
}

fn C.IupSetDoubleId(ih voidptr, name &i8, id int, value f64) 

pub fn iupsetdoubleid(ih voidptr, name &i8, id int, value f64)  {
	C.IupSetDoubleId(ih, name, id, value)
}

fn C.IupSetRGBId(ih voidptr, name &i8, id int, r u8, g u8, b u8) 

pub fn iupsetrgbid(ih voidptr, name &i8, id int, r u8, g u8, b u8)  {
	C.IupSetRGBId(ih, name, id, r, g, b)
}

fn C.IupGetAttributeId(ih voidptr, name &i8, id int) &i8

pub fn iupgetattributeid(ih voidptr, name &i8, id int) &i8 {
	return C.IupGetAttributeId(ih, name, id)
}

fn C.IupGetIntId(ih voidptr, name &i8, id int) int

pub fn iupgetintid(ih voidptr, name &i8, id int) int {
	return C.IupGetIntId(ih, name, id)
}

fn C.IupGetFloatId(ih voidptr, name &i8, id int) f32

pub fn iupgetfloatid(ih voidptr, name &i8, id int) f32 {
	return C.IupGetFloatId(ih, name, id)
}

fn C.IupGetDoubleId(ih voidptr, name &i8, id int) f64

pub fn iupgetdoubleid(ih voidptr, name &i8, id int) f64 {
	return C.IupGetDoubleId(ih, name, id)
}

fn C.IupGetRGBId(ih voidptr, name &i8, id int, r &u8, g &u8, b &u8) 

pub fn iupgetrgbid(ih voidptr, name &i8, id int, r &u8, g &u8, b &u8)  {
	C.IupGetRGBId(ih, name, id, r, g, b)
}

fn C.IupSetAttributeId2(ih voidptr, name &i8, lin int, col int, value &i8) 

pub fn iupsetattributeid2(ih voidptr, name &i8, lin int, col int, value &i8)  {
	C.IupSetAttributeId2(ih, name, lin, col, value)
}

fn C.IupSetStrAttributeId2(ih voidptr, name &i8, lin int, col int, value &i8) 

pub fn iupsetstrattributeid2(ih voidptr, name &i8, lin int, col int, value &i8)  {
	C.IupSetStrAttributeId2(ih, name, lin, col, value)
}

[c2v_variadic]
fn C.IupSetStrfId2(ih voidptr, name &i8, lin int, col int, format &i8) 

pub fn iupsetstrfid2(ih voidptr, name &i8, lin int, col int, format &i8)  {
	C.IupSetStrfId2(ih, name, lin, col, format)
}

fn C.IupSetIntId2(ih voidptr, name &i8, lin int, col int, value int) 

pub fn iupsetintid2(ih voidptr, name &i8, lin int, col int, value int)  {
	C.IupSetIntId2(ih, name, lin, col, value)
}

fn C.IupSetFloatId2(ih voidptr, name &i8, lin int, col int, value f32) 

pub fn iupsetfloatid2(ih voidptr, name &i8, lin int, col int, value f32)  {
	C.IupSetFloatId2(ih, name, lin, col, value)
}

fn C.IupSetDoubleId2(ih voidptr, name &i8, lin int, col int, value f64) 

pub fn iupsetdoubleid2(ih voidptr, name &i8, lin int, col int, value f64)  {
	C.IupSetDoubleId2(ih, name, lin, col, value)
}

fn C.IupSetRGBId2(ih voidptr, name &i8, lin int, col int, r u8, g u8, b u8) 

pub fn iupsetrgbid2(ih voidptr, name &i8, lin int, col int, r u8, g u8, b u8)  {
	C.IupSetRGBId2(ih, name, lin, col, r, g, b)
}

fn C.IupGetAttributeId2(ih voidptr, name &i8, lin int, col int) &i8

pub fn iupgetattributeid2(ih voidptr, name &i8, lin int, col int) &i8 {
	return C.IupGetAttributeId2(ih, name, lin, col)
}

fn C.IupGetIntId2(ih voidptr, name &i8, lin int, col int) int

pub fn iupgetintid2(ih voidptr, name &i8, lin int, col int) int {
	return C.IupGetIntId2(ih, name, lin, col)
}

fn C.IupGetFloatId2(ih voidptr, name &i8, lin int, col int) f32

pub fn iupgetfloatid2(ih voidptr, name &i8, lin int, col int) f32 {
	return C.IupGetFloatId2(ih, name, lin, col)
}

fn C.IupGetDoubleId2(ih voidptr, name &i8, lin int, col int) f64

pub fn iupgetdoubleid2(ih voidptr, name &i8, lin int, col int) f64 {
	return C.IupGetDoubleId2(ih, name, lin, col)
}

fn C.IupGetRGBId2(ih voidptr, name &i8, lin int, col int, r &u8, g &u8, b &u8) 

pub fn iupgetrgbid2(ih voidptr, name &i8, lin int, col int, r &u8, g &u8, b &u8)  {
	C.IupGetRGBId2(ih, name, lin, col, r, g, b)
}

fn C.IupSetGlobal(name &i8, value &i8) 

pub fn iupsetglobal(name &i8, value &i8)  {
	C.IupSetGlobal(name, value)
}

fn C.IupSetStrGlobal(name &i8, value &i8) 

pub fn iupsetstrglobal(name &i8, value &i8)  {
	C.IupSetStrGlobal(name, value)
}

fn C.IupGetGlobal(name &i8) &i8

pub fn iupgetglobal(name &i8) &i8 {
	return C.IupGetGlobal(name)
}

fn C.IupSetFocus(ih voidptr) voidptr

pub fn iupsetfocus(ih voidptr) voidptr {
	return C.IupSetFocus(ih)
}

fn C.IupGetFocus() voidptr

pub fn iupgetfocus() voidptr {
	return C.IupGetFocus()
}

fn C.IupPreviousField(ih voidptr) voidptr

pub fn iuppreviousfield(ih voidptr) voidptr {
	return C.IupPreviousField(ih)
}

fn C.IupNextField(ih voidptr) voidptr

pub fn iupnextfield(ih voidptr) voidptr {
	return C.IupNextField(ih)
}

fn C.IupGetCallback(ih voidptr, name &i8) Icallback

pub fn iupgetcallback(ih voidptr, name &i8) Icallback {
	return C.IupGetCallback(ih, name)
}

fn C.IupSetCallback(ih voidptr, name &i8, func Icallback) Icallback

pub fn iupsetcallback(ih voidptr, name &i8, func Icallback) Icallback {
	return C.IupSetCallback(ih, name, func)
}

[c2v_variadic]
fn C.IupSetCallbacks(ih voidptr, name &i8, func Icallback) voidptr

pub fn iupsetcallbacks(ih voidptr, name &i8, func Icallback) voidptr {
	return C.IupSetCallbacks(ih, name, func)
}

fn C.IupGetFunction(name &i8) Icallback

pub fn iupgetfunction(name &i8) Icallback {
	return C.IupGetFunction(name)
}

fn C.IupSetFunction(name &i8, func Icallback) Icallback

pub fn iupsetfunction(name &i8, func Icallback) Icallback {
	return C.IupSetFunction(name, func)
}

fn C.IupGetHandle(name &i8) voidptr

pub fn iupgethandle(name &i8) voidptr {
	return C.IupGetHandle(name)
}

fn C.IupSetHandle(name &i8, ih voidptr) voidptr

pub fn iupsethandle(name &i8, ih voidptr) voidptr {
	return C.IupSetHandle(name, ih)
}

fn C.IupGetAllNames(names &&u8, n int) int

pub fn iupgetallnames(names &&u8, n int) int {
	return C.IupGetAllNames(names, n)
}

fn C.IupGetAllDialogs(names &&u8, n int) int

pub fn iupgetalldialogs(names &&u8, n int) int {
	return C.IupGetAllDialogs(names, n)
}

fn C.IupGetName(ih voidptr) &i8

pub fn iupgetname(ih voidptr) &i8 {
	return C.IupGetName(ih)
}

fn C.IupSetAttributeHandle(ih voidptr, name &i8, ih_named voidptr) 

pub fn iupsetattributehandle(ih voidptr, name &i8, ih_named voidptr)  {
	C.IupSetAttributeHandle(ih, name, ih_named)
}

fn C.IupGetAttributeHandle(ih voidptr, name &i8) voidptr

pub fn iupgetattributehandle(ih voidptr, name &i8) voidptr {
	return C.IupGetAttributeHandle(ih, name)
}

fn C.IupSetAttributeHandleId(ih voidptr, name &i8, id int, ih_named voidptr) 

pub fn iupsetattributehandleid(ih voidptr, name &i8, id int, ih_named voidptr)  {
	C.IupSetAttributeHandleId(ih, name, id, ih_named)
}

fn C.IupGetAttributeHandleId(ih voidptr, name &i8, id int) voidptr

pub fn iupgetattributehandleid(ih voidptr, name &i8, id int) voidptr {
	return C.IupGetAttributeHandleId(ih, name, id)
}

fn C.IupSetAttributeHandleId2(ih voidptr, name &i8, lin int, col int, ih_named voidptr) 

pub fn iupsetattributehandleid2(ih voidptr, name &i8, lin int, col int, ih_named voidptr)  {
	C.IupSetAttributeHandleId2(ih, name, lin, col, ih_named)
}

fn C.IupGetAttributeHandleId2(ih voidptr, name &i8, lin int, col int) voidptr

pub fn iupgetattributehandleid2(ih voidptr, name &i8, lin int, col int) voidptr {
	return C.IupGetAttributeHandleId2(ih, name, lin, col)
}

fn C.IupGetClassName(ih voidptr) &i8

pub fn iupgetclassname(ih voidptr) &i8 {
	return C.IupGetClassName(ih)
}

fn C.IupGetClassType(ih voidptr) &i8

pub fn iupgetclasstype(ih voidptr) &i8 {
	return C.IupGetClassType(ih)
}

fn C.IupGetAllClasses(names &&u8, n int) int

pub fn iupgetallclasses(names &&u8, n int) int {
	return C.IupGetAllClasses(names, n)
}

fn C.IupGetClassAttributes(classname &i8, names &&u8, n int) int

pub fn iupgetclassattributes(classname &i8, names &&u8, n int) int {
	return C.IupGetClassAttributes(classname, names, n)
}

fn C.IupGetClassCallbacks(classname &i8, names &&u8, n int) int

pub fn iupgetclasscallbacks(classname &i8, names &&u8, n int) int {
	return C.IupGetClassCallbacks(classname, names, n)
}

fn C.IupSaveClassAttributes(ih voidptr) 

pub fn iupsaveclassattributes(ih voidptr)  {
	C.IupSaveClassAttributes(ih)
}

fn C.IupCopyClassAttributes(src_ih voidptr, dst_ih voidptr) 

pub fn iupcopyclassattributes(src_ih voidptr, dst_ih voidptr)  {
	C.IupCopyClassAttributes(src_ih, dst_ih)
}

fn C.IupSetClassDefaultAttribute(classname &i8, name &i8, value &i8) 

pub fn iupsetclassdefaultattribute(classname &i8, name &i8, value &i8)  {
	C.IupSetClassDefaultAttribute(classname, name, value)
}

fn C.IupClassMatch(ih voidptr, classname &i8) int

pub fn iupclassmatch(ih voidptr, classname &i8) int {
	return C.IupClassMatch(ih, classname)
}

fn C.IupCreate(classname &i8) voidptr

pub fn iupcreate(classname &i8) voidptr {
	return C.IupCreate(classname)
}

fn C.IupCreatev(classname &i8, params &voidptr) voidptr

pub fn iupcreatev(classname &i8, params &voidptr) voidptr {
	return C.IupCreatev(classname, params)
}

[c2v_variadic]
fn C.IupCreatep(classname &i8, first voidptr) voidptr

pub fn iupcreatep(classname &i8, first voidptr) voidptr {
	return C.IupCreatep(classname, first)
}

fn C.IupFill() voidptr

pub fn iupfill() voidptr {
	return C.IupFill()
}

fn C.IupSpace() voidptr

pub fn iupspace() voidptr {
	return C.IupSpace()
}

fn C.IupRadio(child voidptr) voidptr

pub fn iupradio(child voidptr) voidptr {
	return C.IupRadio(child)
}

[c2v_variadic]
fn C.IupVbox(child voidptr) voidptr

pub fn iupvbox(child voidptr) voidptr {
	return C.IupVbox(child)
}

fn C.IupVboxv(children &voidptr) voidptr

pub fn iupvboxv(children &voidptr) voidptr {
	return C.IupVboxv(children)
}

[c2v_variadic]
fn C.IupZbox(child voidptr) voidptr

pub fn iupzbox(child voidptr) voidptr {
	return C.IupZbox(child)
}

fn C.IupZboxv(children &voidptr) voidptr

pub fn iupzboxv(children &voidptr) voidptr {
	return C.IupZboxv(children)
}

[c2v_variadic]
fn C.IupHbox(child voidptr) voidptr

pub fn iuphbox(child voidptr) voidptr {
	return C.IupHbox(child)
}

fn C.IupHboxv(children &voidptr) voidptr

pub fn iuphboxv(children &voidptr) voidptr {
	return C.IupHboxv(children)
}

[c2v_variadic]
fn C.IupNormalizer(ih_first voidptr) voidptr

pub fn iupnormalizer(ih_first voidptr) voidptr {
	return C.IupNormalizer(ih_first)
}

fn C.IupNormalizerv(ih_list &voidptr) voidptr

pub fn iupnormalizerv(ih_list &voidptr) voidptr {
	return C.IupNormalizerv(ih_list)
}

[c2v_variadic]
fn C.IupCbox(child voidptr) voidptr

pub fn iupcbox(child voidptr) voidptr {
	return C.IupCbox(child)
}

fn C.IupCboxv(children &voidptr) voidptr

pub fn iupcboxv(children &voidptr) voidptr {
	return C.IupCboxv(children)
}

fn C.IupSbox(child voidptr) voidptr

pub fn iupsbox(child voidptr) voidptr {
	return C.IupSbox(child)
}

fn C.IupSplit(child1 voidptr, child2 voidptr) voidptr

pub fn iupsplit(child1 voidptr, child2 voidptr) voidptr {
	return C.IupSplit(child1, child2)
}

fn C.IupScrollBox(child voidptr) voidptr

pub fn iupscrollbox(child voidptr) voidptr {
	return C.IupScrollBox(child)
}

fn C.IupFlatScrollBox(child voidptr) voidptr

pub fn iupflatscrollbox(child voidptr) voidptr {
	return C.IupFlatScrollBox(child)
}

[c2v_variadic]
fn C.IupGridBox(child voidptr) voidptr

pub fn iupgridbox(child voidptr) voidptr {
	return C.IupGridBox(child)
}

fn C.IupGridBoxv(children &voidptr) voidptr

pub fn iupgridboxv(children &voidptr) voidptr {
	return C.IupGridBoxv(children)
}

[c2v_variadic]
fn C.IupMultiBox(child voidptr) voidptr

pub fn iupmultibox(child voidptr) voidptr {
	return C.IupMultiBox(child)
}

fn C.IupMultiBoxv(children &voidptr) voidptr

pub fn iupmultiboxv(children &voidptr) voidptr {
	return C.IupMultiBoxv(children)
}

fn C.IupExpander(child voidptr) voidptr

pub fn iupexpander(child voidptr) voidptr {
	return C.IupExpander(child)
}

fn C.IupDetachBox(child voidptr) voidptr

pub fn iupdetachbox(child voidptr) voidptr {
	return C.IupDetachBox(child)
}

fn C.IupBackgroundBox(child voidptr) voidptr

pub fn iupbackgroundbox(child voidptr) voidptr {
	return C.IupBackgroundBox(child)
}

fn C.IupFrame(child voidptr) voidptr

pub fn iupframe(child voidptr) voidptr {
	return C.IupFrame(child)
}

fn C.IupFlatFrame(child voidptr) voidptr

pub fn iupflatframe(child voidptr) voidptr {
	return C.IupFlatFrame(child)
}

fn C.IupImage(width int, height int, pixels &u8) voidptr

pub fn iupimage(width int, height int, pixels &u8) voidptr {
	return C.IupImage(width, height, pixels)
}

fn C.IupImageRGB(width int, height int, pixels &u8) voidptr

pub fn iupimagergb(width int, height int, pixels &u8) voidptr {
	return C.IupImageRGB(width, height, pixels)
}

fn C.IupImageRGBA(width int, height int, pixels &u8) voidptr

pub fn iupimagergba(width int, height int, pixels &u8) voidptr {
	return C.IupImageRGBA(width, height, pixels)
}

fn C.IupItem(title &i8, action &i8) voidptr

pub fn iupitem(title &i8, action &i8) voidptr {
	return C.IupItem(title, action)
}

fn C.IupSubmenu(title &i8, child voidptr) voidptr

pub fn iupsubmenu(title &i8, child voidptr) voidptr {
	return C.IupSubmenu(title, child)
}

fn C.IupSeparator() voidptr

pub fn iupseparator() voidptr {
	return C.IupSeparator()
}

[c2v_variadic]
fn C.IupMenu(child voidptr) voidptr

pub fn iupmenu(child voidptr) voidptr {
	return C.IupMenu(child)
}

fn C.IupMenuv(children &voidptr) voidptr

pub fn iupmenuv(children &voidptr) voidptr {
	return C.IupMenuv(children)
}

fn C.IupButton(title &i8, action &i8) voidptr

pub fn iupbutton(title &i8, action &i8) voidptr {
	return C.IupButton(title, action)
}

fn C.IupFlatButton(title &i8) voidptr

pub fn iupflatbutton(title &i8) voidptr {
	return C.IupFlatButton(title)
}

fn C.IupFlatToggle(title &i8) voidptr

pub fn iupflattoggle(title &i8) voidptr {
	return C.IupFlatToggle(title)
}

fn C.IupDropButton(dropchild voidptr) voidptr

pub fn iupdropbutton(dropchild voidptr) voidptr {
	return C.IupDropButton(dropchild)
}

fn C.IupFlatLabel(title &i8) voidptr

pub fn iupflatlabel(title &i8) voidptr {
	return C.IupFlatLabel(title)
}

fn C.IupFlatSeparator() voidptr

pub fn iupflatseparator() voidptr {
	return C.IupFlatSeparator()
}

fn C.IupCanvas(action &i8) voidptr

pub fn iupcanvas(action &i8) voidptr {
	return C.IupCanvas(action)
}

fn C.IupDialog(child voidptr) voidptr

pub fn iupdialog(child voidptr) voidptr {
	return C.IupDialog(child)
}

fn C.IupUser() voidptr

pub fn iupuser() voidptr {
	return C.IupUser()
}

fn C.IupThread() voidptr

pub fn iupthread() voidptr {
	return C.IupThread()
}

fn C.IupLabel(title &i8) voidptr

pub fn iuplabel(title &i8) voidptr {
	return C.IupLabel(title)
}

fn C.IupList(action &i8) voidptr

pub fn iuplist(action &i8) voidptr {
	return C.IupList(action)
}

fn C.IupFlatList() voidptr

pub fn iupflatlist() voidptr {
	return C.IupFlatList()
}

fn C.IupText(action &i8) voidptr

pub fn iuptext(action &i8) voidptr {
	return C.IupText(action)
}

fn C.IupMultiLine(action &i8) voidptr

pub fn iupmultiline(action &i8) voidptr {
	return C.IupMultiLine(action)
}

fn C.IupToggle(title &i8, action &i8) voidptr

pub fn iuptoggle(title &i8, action &i8) voidptr {
	return C.IupToggle(title, action)
}

fn C.IupTimer() voidptr

pub fn iuptimer() voidptr {
	return C.IupTimer()
}

fn C.IupClipboard() voidptr

pub fn iupclipboard() voidptr {
	return C.IupClipboard()
}

fn C.IupProgressBar() voidptr

pub fn iupprogressbar() voidptr {
	return C.IupProgressBar()
}

fn C.IupVal(type_ &i8) voidptr

pub fn iupval(type_ &i8) voidptr {
	return C.IupVal(type_)
}

fn C.IupFlatVal(type_ &i8) voidptr

pub fn iupflatval(type_ &i8) voidptr {
	return C.IupFlatVal(type_)
}

fn C.IupFlatTree() voidptr

pub fn iupflattree() voidptr {
	return C.IupFlatTree()
}

[c2v_variadic]
fn C.IupTabs(child voidptr) voidptr

pub fn iuptabs(child voidptr) voidptr {
	return C.IupTabs(child)
}

fn C.IupTabsv(children &voidptr) voidptr

pub fn iuptabsv(children &voidptr) voidptr {
	return C.IupTabsv(children)
}

[c2v_variadic]
fn C.IupFlatTabs(first voidptr) voidptr

pub fn iupflattabs(first voidptr) voidptr {
	return C.IupFlatTabs(first)
}

fn C.IupFlatTabsv(children &voidptr) voidptr

pub fn iupflattabsv(children &voidptr) voidptr {
	return C.IupFlatTabsv(children)
}

fn C.IupTree() voidptr

pub fn iuptree() voidptr {
	return C.IupTree()
}

fn C.IupLink(url &i8, title &i8) voidptr

pub fn iuplink(url &i8, title &i8) voidptr {
	return C.IupLink(url, title)
}

fn C.IupAnimatedLabel(animation voidptr) voidptr

pub fn iupanimatedlabel(animation voidptr) voidptr {
	return C.IupAnimatedLabel(animation)
}

fn C.IupDatePick() voidptr

pub fn iupdatepick() voidptr {
	return C.IupDatePick()
}

fn C.IupCalendar() voidptr

pub fn iupcalendar() voidptr {
	return C.IupCalendar()
}

fn C.IupColorbar() voidptr

pub fn iupcolorbar() voidptr {
	return C.IupColorbar()
}

fn C.IupGauge() voidptr

pub fn iupgauge() voidptr {
	return C.IupGauge()
}

fn C.IupDial(type_ &i8) voidptr

pub fn iupdial(type_ &i8) voidptr {
	return C.IupDial(type_)
}

fn C.IupColorBrowser() voidptr

pub fn iupcolorbrowser() voidptr {
	return C.IupColorBrowser()
}

fn C.IupSpin() voidptr

pub fn iupspin() voidptr {
	return C.IupSpin()
}

fn C.IupSpinbox(child voidptr) voidptr

pub fn iupspinbox(child voidptr) voidptr {
	return C.IupSpinbox(child)
}

fn C.IupStringCompare(str1 &i8, str2 &i8, casesensitive int, lexicographic int) int

pub fn iupstringcompare(str1 &i8, str2 &i8, casesensitive int, lexicographic int) int {
	return C.IupStringCompare(str1, str2, casesensitive, lexicographic)
}

fn C.IupSaveImageAsText(ih voidptr, filename &i8, format &i8, name &i8) int

pub fn iupsaveimageastext(ih voidptr, filename &i8, format &i8, name &i8) int {
	return C.IupSaveImageAsText(ih, filename, format, name)
}

fn C.IupImageGetHandle(name &i8) voidptr

pub fn iupimagegethandle(name &i8) voidptr {
	return C.IupImageGetHandle(name)
}

fn C.IupTextConvertLinColToPos(ih voidptr, lin int, col int, pos &int) 

pub fn iuptextconvertlincoltopos(ih voidptr, lin int, col int, pos &int)  {
	C.IupTextConvertLinColToPos(ih, lin, col, pos)
}

fn C.IupTextConvertPosToLinCol(ih voidptr, pos int, lin &int, col &int) 

pub fn iuptextconvertpostolincol(ih voidptr, pos int, lin &int, col &int)  {
	C.IupTextConvertPosToLinCol(ih, pos, lin, col)
}

fn C.IupConvertXYToPos(ih voidptr, x int, y int) int

pub fn iupconvertxytopos(ih voidptr, x int, y int) int {
	return C.IupConvertXYToPos(ih, x, y)
}

fn C.IupStoreGlobal(name &i8, value &i8) 

pub fn iupstoreglobal(name &i8, value &i8)  {
	C.IupStoreGlobal(name, value)
}

fn C.IupStoreAttribute(ih voidptr, name &i8, value &i8) 

pub fn iupstoreattribute(ih voidptr, name &i8, value &i8)  {
	C.IupStoreAttribute(ih, name, value)
}

[c2v_variadic]
fn C.IupSetfAttribute(ih voidptr, name &i8, format &i8) 

pub fn iupsetfattribute(ih voidptr, name &i8, format &i8)  {
	C.IupSetfAttribute(ih, name, format)
}

fn C.IupStoreAttributeId(ih voidptr, name &i8, id int, value &i8) 

pub fn iupstoreattributeid(ih voidptr, name &i8, id int, value &i8)  {
	C.IupStoreAttributeId(ih, name, id, value)
}

[c2v_variadic]
fn C.IupSetfAttributeId(ih voidptr, name &i8, id int, f &i8) 

pub fn iupsetfattributeid(ih voidptr, name &i8, id int, f &i8)  {
	C.IupSetfAttributeId(ih, name, id, f)
}

fn C.IupStoreAttributeId2(ih voidptr, name &i8, lin int, col int, value &i8) 

pub fn iupstoreattributeid2(ih voidptr, name &i8, lin int, col int, value &i8)  {
	C.IupStoreAttributeId2(ih, name, lin, col, value)
}

[c2v_variadic]
fn C.IupSetfAttributeId2(ih voidptr, name &i8, lin int, col int, format &i8) 

pub fn iupsetfattributeid2(ih voidptr, name &i8, lin int, col int, format &i8)  {
	C.IupSetfAttributeId2(ih, name, lin, col, format)
}

fn C.IupTreeSetUserId(ih voidptr, id int, userid voidptr) int

pub fn iuptreesetuserid(ih voidptr, id int, userid voidptr) int {
	return C.IupTreeSetUserId(ih, id, userid)
}

fn C.IupTreeGetUserId(ih voidptr, id int) voidptr

pub fn iuptreegetuserid(ih voidptr, id int) voidptr {
	return C.IupTreeGetUserId(ih, id)
}

fn C.IupTreeGetId(ih voidptr, userid voidptr) int

pub fn iuptreegetid(ih voidptr, userid voidptr) int {
	return C.IupTreeGetId(ih, userid)
}

fn C.IupTreeSetAttributeHandle(ih voidptr, name &i8, id int, ih_named voidptr) 

pub fn iuptreesetattributehandle(ih voidptr, name &i8, id int, ih_named voidptr)  {
	C.IupTreeSetAttributeHandle(ih, name, id, ih_named)
}

fn C.IupFileDlg() voidptr

pub fn iupfiledlg() voidptr {
	return C.IupFileDlg()
}

fn C.IupMessageDlg() voidptr

pub fn iupmessagedlg() voidptr {
	return C.IupMessageDlg()
}

fn C.IupColorDlg() voidptr

pub fn iupcolordlg() voidptr {
	return C.IupColorDlg()
}

fn C.IupFontDlg() voidptr

pub fn iupfontdlg() voidptr {
	return C.IupFontDlg()
}

fn C.IupProgressDlg() voidptr

pub fn iupprogressdlg() voidptr {
	return C.IupProgressDlg()
}

fn C.IupGetFile(arq &i8) int

pub fn iupgetfile(arq &i8) int {
	return C.IupGetFile(arq)
}

fn C.IupMessage(title &i8, msg &i8) 

pub fn iupmessage(title &i8, msg &i8)  {
	C.IupMessage(title, msg)
}

[c2v_variadic]
fn C.IupMessagef(title &i8, format &i8) 

pub fn iupmessagef(title &i8, format &i8)  {
	C.IupMessagef(title, format)
}

fn C.IupMessageError(parent voidptr, message &i8) 

pub fn iupmessageerror(parent voidptr, message &i8)  {
	C.IupMessageError(parent, message)
}

fn C.IupMessageAlarm(parent voidptr, title &i8, message &i8, buttons &i8) int

pub fn iupmessagealarm(parent voidptr, title &i8, message &i8, buttons &i8) int {
	return C.IupMessageAlarm(parent, title, message, buttons)
}

fn C.IupAlarm(title &i8, msg &i8, b1 &i8, b2 &i8, b3 &i8) int

pub fn iupalarm(title &i8, msg &i8, b1 &i8, b2 &i8, b3 &i8) int {
	return C.IupAlarm(title, msg, b1, b2, b3)
}

[c2v_variadic]
fn C.IupScanf(format &i8) int

pub fn iupscanf(format &i8) int {
	return C.IupScanf(format)
}

fn C.IupListDialog(type_ int, title &i8, size int, list &&u8, op int, max_col int, max_lin int, marks &int) int

pub fn iuplistdialog(type_ int, title &i8, size int, list &&u8, op int, max_col int, max_lin int, marks &int) int {
	return C.IupListDialog(type_, title, size, list, op, max_col, max_lin, marks)
}

fn C.IupGetText(title &i8, text &i8, maxsize int) int

pub fn iupgettext(title &i8, text &i8, maxsize int) int {
	return C.IupGetText(title, text, maxsize)
}

fn C.IupGetColor(x int, y int, r &u8, g &u8, b &u8) int

pub fn iupgetcolor(x int, y int, r &u8, g &u8, b &u8) int {
	return C.IupGetColor(x, y, r, g, b)
}

type Iparamcb = fn (voidptr, int, voidptr) int
[c2v_variadic]
fn C.IupGetParam(title &i8, action Iparamcb, user_data voidptr, format &i8) int

pub fn iupgetparam(title &i8, action Iparamcb, user_data voidptr, format &i8) int {
	return C.IupGetParam(title, action, user_data, format)
}

fn C.IupGetParamv(title &i8, action Iparamcb, user_data voidptr, format &i8, param_count int, param_extra int, param_data &voidptr) int

pub fn iupgetparamv(title &i8, action Iparamcb, user_data voidptr, format &i8, param_count int, param_extra int, param_data &voidptr) int {
	return C.IupGetParamv(title, action, user_data, format, param_count, param_extra, param_data)
}

fn C.IupParam(format &i8) voidptr

pub fn iupparam(format &i8) voidptr {
	return C.IupParam(format)
}

[c2v_variadic]
fn C.IupParamBox(param voidptr) voidptr

pub fn iupparambox(param voidptr) voidptr {
	return C.IupParamBox(param)
}

fn C.IupParamBoxv(param_array &voidptr) voidptr

pub fn iupparamboxv(param_array &voidptr) voidptr {
	return C.IupParamBoxv(param_array)
}

fn C.IupLayoutDialog(dialog voidptr) voidptr

pub fn iuplayoutdialog(dialog voidptr) voidptr {
	return C.IupLayoutDialog(dialog)
}

fn C.IupElementPropertiesDialog(parent voidptr, elem voidptr) voidptr

pub fn iupelementpropertiesdialog(parent voidptr, elem voidptr) voidptr {
	return C.IupElementPropertiesDialog(parent, elem)
}

fn C.IupGlobalsDialog() voidptr

pub fn iupglobalsdialog() voidptr {
	return C.IupGlobalsDialog()
}

fn C.IupClassInfoDialog(parent voidptr) voidptr

pub fn iupclassinfodialog(parent voidptr) voidptr {
	return C.IupClassInfoDialog(parent)
}


const ( // empty enum
		iup_show = 1
	iup_restore = 2
	iup_minimize = 3
	iup_maximize = 4
	iup_hide = 5
)


const ( // empty enum
	iup_sbup = 1
	iup_sbdn = 2
	iup_sbpgup = 3
	iup_sbpgdn = 4
	iup_sbposv = 5
	iup_sbdragv = 6
	iup_sbleft = 7
	iup_sbright = 8
	iup_sbpgleft = 9
	iup_sbpgright = 10
	iup_sbposh = 11
	iup_sbdragh = 12
)


const ( // empty enum
	iup_recbinary = 1
	iup_rectext = 2
)

