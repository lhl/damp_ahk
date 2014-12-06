/* 

Dragon Age Inquisition Multiplayer Key Bindings 
---
You should map WASD (from WQSE to movement).
These tweaks should make DAI easier to control.

What the script does:
* MB4 toggles RMB down/up (freelook)
* Caps lock toggles sprint
* Left Windows key disabled
* Right Control toggles mute for your own microphone (See comments on how to assign the proper mixer)

For more info, see: https://github.com/lhl/damp_ahk

*/


#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent                 ; Keep the script running until ExitApp is called
#SingleInstance Force       ; Reload on script relaunch

SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 3        ; Make title exact match
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.


#IfWinActive ahk_class Dragon Age: Inquisition
;IfWinActive Notepad ; Easy Debug


/*
 *** MB4 to toggle freelook ***
 */

; MB4
XButton1::
  rmb := !rmb
  if rmb
  {
    ; ToolTip, "down"
    Click down right
    SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
  }
  else
  {
    ; ToolTip, "up"
    Click up right
    SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
  }
Return

; RMB will do a little reset dance
~Rbutton::
  if rmb {
    rmb := 0
    Click up right
  } 
Return

; Enable/Disable RMB if switching out of DAI
Loop {
  WinWaitActive, ahk_class Dragon Age: Inquisition
  if rmb {
    Click down right
    SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
  }
  WinWaitNotActive, ahk_class Dragon Age: Inquisition
  if rmb {
    Click up right
    SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
  }
}



/*
 *** Caps lock toggle sprint ***
 */

Capslock::
  if not GetKeyState("Capslock", "T")
  {
    lshift := 1
    SetCapsLockState, on
    Send, {Blind}{LShift Down}
    SoundPlay, %A_WinDir%\Media\Windows Hardware Insert.wav
  }
  else
  {
    lshift := 0
    SetCapsLockState, off
    Send, {Blind}{LShift Up}
    SoundPlay, %A_WinDir%\Media\Windows Hardware Remove.wav
  }
Return

; Shift will reset things, work like normal
$LShift::
  if lshift {
    lshift := 0
    SetCapsLockState, off
    Send, {Blind}{LShift Up}
  } 
  Send {LShift Down} 
Return

$LShift Up::
  if lshift {
    lshift := 0
    SetCapsLockState, off
    Send, {Blind}{LShift Up}
  } 
  Send {LShift Up} 
Return


/*
 *** Windows Key Maps to Origin Default ***
 */
LWin::
/* ; For some reason the Origin overlay doesn't like to respond even using the AHK input to map the shortcut...
  if not GetKeyState("Capslock", "T")
  {
    Send +{F1}
  }
  else
  {
    SetCapsLockState, off
    Send {F1}
    SetCapsLockState, on
  }
*/
Return

/*
 *** Right Control toggles Mute ***
 http://www.autohotkey.com/board/topic/93207-help-me-with-a-scriptmute-and-unmute-microphone/
 https://github.com/PProvost/AutoHotKey
 */
RCtrl::
  ; Use this script to find your sound source mixer: 
  ; https://raw.githubusercontent.com/PProvost/AutoHotKey/master/SoundCardAnalysis.ahk
  mixer = 3

  SoundSet, +1, Microphone, Mute, mixer
  SoundGet, mute, Microphone, MUTE, mixer
  if mute = On
  {
    soundfile = %A_WinDir%\Media\Windows Hardware Remove.wav
  }
  else
  { 
    soundfile = %A_WinDir%\Media\Windows Hardware Insert.wav
  }
  SoundPlay, %soundfile%

  ; Can't be seen
  ; TrayTip, ToggleMic, Microphone mute is %mute%, 3
Return


#IfWinActive
