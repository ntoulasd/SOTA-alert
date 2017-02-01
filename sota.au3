#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Dimitrios Ntoulas

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3>

TraySetState($TRAY_ICONSTATE_SHOW)
TraySetToolTip("SOTA alert for SV from SV2RCK Ver. 1.1") 

While 1

    Local $dData = InetRead('http://old.sota.org.uk/RssFeed',1 )

    ; Convert the ANSI compatible binary string back into a string.
    Local $sData = BinaryToString($dData)
	Local $sString = StringLeft($sData, 1024)
	;MsgBox($MB_SYSTEMMODAL, "", $sString)


	local $sota = StringRegExp($sString,'(?i)<title>(.*SV.*?)<\/title>', 2)
If not @error Then 
TrayTip("SOTA Alert", $sota[1], 30, 17)
;ToolTip($sota[1], 800, 0,"SOTA Alert",1,4)
;sleep (10*1000)
ToolTip("")
EndIf

Sleep(5*60*1000)
Wend
