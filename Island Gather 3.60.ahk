; Island Gather Version 1.2.9, Testing Phase

; Changelog/Notes

; 09/06/22 1.2.13 Added beginning countdown
; 09/05/22 1.2.12 duty finder took too long to pop up in order to sign up, adjusted accordingly
; 09/04/22 1.2.11 broke after signing up for ifrit, 15 second lag, took the 2.10 change and moved the added time to Ifrit instead. Added an option to restart the loop.
; 09/04/22 1.2.10 added 4400 to re-loop to make macro exactly 1 minute, reformatted this document.
; 09/04/22 1.2.9 tested minimizing, worked like a charm.
; 09/04/22 1.2.9 32 second delay broke it after leaving, might not keep, adjusted temporaily. (55.6s)
; 09/03/22 1.2.8 added a counter for the number of iterations
; 09/03/22 1.2.7 delay was not long enough going into Ifrit once more, adjusted accordingly
; 09/03/22 1.2.6 delay was not long enough going into Ifrit, probably due to too many programs running/ it's Saturday morning.
; 09/03/22 1.2.5 30s was not enough, broke immediately. Removed other 100ms (51s)
; 09/03/22 1.2.4 Had another lag spike, this time, 31 seconds. Not sure if adjustment should be kept. Removing 100ms from gather mode too. (49.8s)
; 09/03/22 1.2.3 Had a huge 22 second lag spike at end of loop, adjusted accordingly. 
;                This may have been just because of OBS was running in background. 
;                This caused it to type the rest of the commands in the chat window.
; 09/03/22 1.2.2 changed all 500ms values to 100, May test removing this as there is a SetKeyDelay
; 09/03/22 1.2.1 Stayed outside of duty because of the 1000ms interval after "pushing"
; 		 triangle to sign up was too short, adjusted to 2000ms

; Future Tests:

; Add a beginning countdown outside the loop, to ask to minimize or click off
; change the ending delay to split into a 10s countdown

#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetKeyDelay , 50, 30,  ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Exit

Nodes = 1

F9::
	Nodes = 1
	nodeDisplay = NODES SET TO 1
	ToolTip % nodeDisplay, 0, 0
	return
	
F8::
	Nodes = 2
	nodeDisplay = NODES SET TO 2
	ToolTip % nodeDisplay, 0, 0
	return

F7::
	Nodes = 3
	nodeDisplay = NODES SET TO 3
	ToolTip % nodeDisplay, 0, 0
	return

F6::
	cursormem = 0
	memDisplay = MEM SET TO FALSE
	ToolTip % memDisplay, 0, 0
	return

F5::
	cursormem = 1
	memDisplay = MEM SET TO TRUE
	ToolTip % memDisplay, 0, 0
	return

F10::
	ID := WinExist("A")
	; ToolTip % ID, 0, 0 ; Displays a windowID in top left, put a semicolon in front of this line to disable
	count := 1
	msg = Iterations: 
	msg2 = Minimize in 
	cd = 5
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Sleep 1000
	cd = 4
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Sleep 1000
	cd = 3
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Sleep 1000
	cd = 2
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Sleep 1000
	cd = 1
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Sleep 1000
	cd = 0
	cdDisplay = %msg2%%cd%
	ToolTip % cdDisplay, 0, 0
	Loop
	{
		countDisplay = %msg%%count%
		ToolTip % countDisplay, 0, 0
		
		; Change to Gather Mode
		ControlSend, , {Numpad1}, ahk_id %ID%
		ControlSend, , {Numpad0}, ahk_id %ID%
		ControlSend, , {Numpad6}, ahk_id %ID% ; if the game forgets to remember where your cursor previously was, uncomment this
		ControlSend, , {Numpad0}, ahk_id %ID%
		ControlSend, , {Esc}, ahk_id %ID%

		; Gather
		Loop, %Nodes%
		{
			ControlSend, , {Numpad0}, ahk_id %ID%
			ControlSend, , {Numpad0}, ahk_id %ID%
			Sleep 4000
		}
		
		; Sign up for Ifrit
		ControlSend, , {Numpad5 down}, ahk_id %ID%
		ControlSend, , {Numpad3}, ahk_id %ID%
		ControlSend, , {Numpad5 up}, ahk_id %ID%
		Sleep 1400
		ControlSend, , {Numpad3}, ahk_id %ID%
		Sleep 2000 ; tabbed over to the left too quickly, was 1000
		ControlSend, , {Numpad4}, ahk_id %ID%
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 14000 ; feel free to change to make it quicker

		; Leave Duty
		ControlSend, , {Numpad5 down}, ahk_id %ID%
		ControlSend, , {Numpad3}, ahk_id %ID%
		ControlSend, , {Numpad5 up}, ahk_id %ID%
		Sleep 2000 ; testing shorter, was 3000
		ControlSend, , {Numpad0}, ahk_id %ID% ; mousing over the window for some reason requires a second of this line
		Sleep 1000
		ControlSend, , {Numpad4}, ahk_id %ID%
		ControlSend, , {Numpad0}, ahk_id %ID%
		Sleep 34000 ; had random lag break it, totaling 22,31, and 32 seconds. Because of time, it tabbed into chat instead. feel free to change to make quicker

		count := count + 1 ; update iterations
	}	
	
return

Home::Pause,Toggle

F1::ExitApp
F2::Reload