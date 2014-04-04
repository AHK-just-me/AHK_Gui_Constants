; ======================================================================================================================
; Function:         Constants for Custom Draw (Header, ListView, Slider, ToolTip, TreeView, ReBar, ToolBar)
; AHK version:      1.1.05+
; Language:         English
; Version:          1.0.00.00/2012-11-08/just me
; MSDN:             http://msdn.microsoft.com/en-us/library/bb761817(VS.85).aspx
; ======================================================================================================================
; NM_FIRST = (0U-  0U)
; ======================================================================================================================
; Notifications ========================================================================================================
Global NM_CUSTOMDRAW := -12    ; (NM_FIRST - 12)
; Custom Draw return flags =============================================================================================
; Values under 0x00010000 are reserved for global custom draw values, above that are for specific controls.
Global CDRF_DODEFAULT          := 0x00000000
Global CDRF_NEWFONT            := 0x00000002
Global CDRF_SKIPDEFAULT        := 0x00000004
Global CDRF_DOERASE            := 0x00000008 ; draw the background
Global CDRF_SKIPPOSTPAINT      := 0x00000100 ; don't draw the focus rect
Global CDRF_NOTIFYPOSTPAINT    := 0x00000010
Global CDRF_NOTIFYITEMDRAW     := 0x00000020
Global CDRF_NOTIFYSUBITEMDRAW  := 0x00000020 ; flags are the same, we can distinguish by context
Global CDRF_NOTIFYPOSTERASE    := 0x00000040
; DrawStage flags ======================================================================================================
; Values under 0x00010000 are reserved for global custom draw values, above that are for specific controls.
Global CDDS_PREPAINT           := 0x00000001
Global CDDS_POSTPAINT          := 0x00000002
Global CDDS_PREERASE           := 0x00000003
Global CDDS_POSTERASE          := 0x00000004
; The 0x000010000 bit means it's individual item specific
Global CDDS_ITEM               := 0x00010000
Global CDDS_ITEMPREPAINT       := 0x00010001 ; (CDDS_ITEM | CDDS_PREPAINT)
Global CDDS_ITEMPOSTPAINT      := 0x00010002 ; (CDDS_ITEM | CDDS_POSTPAINT)
Global CDDS_ITEMPREERASE       := 0x00010003 ; (CDDS_ITEM | CDDS_PREERASE)
Global CDDS_ITEMPOSTERASE      := 0x00010004 ; (CDDS_ITEM | CDDS_POSTERASE)
Global CDDS_SUBITEM            := 0x00020000
Global CDDS_SUBITEMPREPAINT    := 0x00030001 ; not defined in CommCtrl.h (CDDS_ITEM | CDDS_PREPAINT | CDDS_SUBITEM)
; ItemState flags ======================================================================================================
Global CDIS_SELECTED           := 0x0001
Global CDIS_GRAYED             := 0x0002
Global CDIS_DISABLED           := 0x0004
Global CDIS_CHECKED            := 0x0008
Global CDIS_FOCUS              := 0x0010
Global CDIS_DEFAULT            := 0x0020
Global CDIS_HOT                := 0x0040
Global CDIS_MARKED             := 0x0080
Global CDIS_INDETERMINATE      := 0x0100
Global CDIS_SHOWKEYBOARDCUES   := 0x0200
Global CDIS_NEARHOT            := 0x0400 ; >= Vista
Global CDIS_OTHERSIDEHOT       := 0x0800 ; >= Vista
Global CDIS_DROPHILITED        := 0x1000 ; >= Vista