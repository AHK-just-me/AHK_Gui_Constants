; ======================================================================================================================
; AHK 1.1+
; ======================================================================================================================
#NoEnv
SetBatchLines, -1
; ======================================================================================================================
EM_SCROLLCARET := 0x00B7
EM_SETSEL      := 0x00B1
ES_NOHIDESEL   := 256
; ======================================================================================================================
Gui, +Disabled +OwnDialogs
Gui, Margin, 20, 20
Gui, Font, s9 , Courier New
Gui, Add, Text, Section, Scripts:
Gui, Add, Listbox, xm y+5 w200 r20 vLBScripts gSubLBScripts 
Gui, Add, Text, ys, Constants:
Gui, Add, Edit, y+5 w740 r20 vEDConstants hwndHEDConstants ReadOnly HScroll +%ES_NOHIDESEL%
Gui, Add, Edit, wp vEDSearch gSubEDSearch
Gui, Add, Text, xm yp w200 hp 0x200 Right, Search:
Gui, Add, StatusBar, , % "   Select folder"
Gui, Show, , GUI_Constants
; ======================================================================================================================
; Select Const_xxx.ahk folder
FileSelectFolder, ConstFolder, *%A_ScriptDir%, 2, Select the folder containing the Const_ scripts, please:
If (ErrorLevel) {
   MsgBox, 16, GUI_Constants, You didn't select a folder,`nthe program will exit!
   ExitApp
}
Files := []
Loop, %ConstFolder%\Const_*.ahk
   Files.Insert(A_LoopFileLongPath)
If !Files.MaxIndex() {
   MsgBox, 16, GUI_Constants, The selected folder %ConstFolder%`ndoes not contain Const_ files! The program will exit!
   ExitApp
}
SB_SetText("  ... loading scripts ...")
GuiControl, , LBScripts, % LoadScripts(Files, Constants)
GuiControl, Choose, LBScripts, |1
Gui, -Disabled
Return
; ======================================================================================================================
GuiClose:
GuiEscape:
ExitApp
; ======================================================================================================================
SubLBScripts:
   GuiControlGet, LBScripts
   GuiControl, , EDConstants, % Constants[LBScripts]
   SB_SetText("   " . LBScripts . ".ahk")
   GuiControl, , EDSearch
Return
; ======================================================================================================================
SubEDSearch:
   GuiControlGet, LBScripts
   GuiControlGet, EDSearch
   If (P := RegExMatch(Constants[LBScripts], "`aim)^Global\s+\Q" . EDSearch . "\E")) {
      P += 6
      SendMessage, EM_SETSEL, P, P + StrLen(EDSearch), , ahk_id %HEDConstants%
      SendMessage, EM_SCROLLCARET, 0, 0, , ahk_id %HEDConstants%
   } Else {
      SendMessage, EM_SETSEL, -1, 0, , ahk_id %HEDConstants%
   }
Return
; ======================================================================================================================
Loadscripts(ByRef Files, ByRef Constants) {
   Constants := {}
   Scripts := ""
   For Each, FilePath In Files {
      FileRead, FileContent, %FilePath%
      If (ErrorLevel)
         Continue
      SplitPath, FilePath, , , , NameNoExt
      Constants[NameNoExt] := FileContent
      Scripts .= "|" . NameNoExt 
   }
   Return Scripts
}
; ======================================================================================================================