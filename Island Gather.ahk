#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetKeyDelay , 50, 30,    ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Exit

F10::
	ID := WinExist("A")
	ToolTip % ID, 0, 0 ; Displays a windowID in top left, put a semicolon in front of this line to disable
	
	Loop
	{
		ControlSend, , {Numpad1}, ahk_id %ID% ; change to gather mode
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 500

		ControlSend, , {Esc}, ahk_id %ID% ; gather
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 3000

		ControlSend, , {Numpad5 down}, ahk_id %ID% ; Sign up
		Sleep 100
		ControlSend, , {Numpad3}, ahk_id %ID%
		Sleep 100
		ControlSend, , {Numpad5 up}, ahk_id %ID%
		Sleep 500
		ControlSend, , {Numpad3}, ahk_id %ID%
		Sleep 1000
		ControlSend, , {Numpad4}, ahk_id %ID%
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 8000

		ControlSend, , {Numpad5 down}, ahk_id %ID% ; leave
		Sleep 100
		ControlSend, , {Numpad3}, ahk_id %ID%
		Sleep 100
		ControlSend, , {Numpad5 up}, ahk_id %ID%
		Sleep 1000
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 1000
		ControlSend, , {Numpad4}, ahk_id %ID%
		Sleep 500
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 12000
	}	
	
return

Home::Pause,Toggle

F1::ExitApp