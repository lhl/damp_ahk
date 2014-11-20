/* 

Dragon Age Inquisition Multiplayer Key Bindings 
---
You should map WASD (from WQSE to movement).
These tweaks should make DAI easier to control.

What the script does:
* RMB toggles freelook
* Shift toggles sprint
* Disable Left Windows Key
* Right Control Toggles Mute for your own Microphone

TODO:
* Overlays w/ status messages


See also:
* http://www.autohotkey.com/docs/Tutorial.htm
* http://www.autohotkey.com/docs/commands.htm
* http://www.autohotkey.com/docs/Hotkeys.htm
* http://www.autohotkey.net/~tidbit/Tutorial/Tutorial.html
* http://www.autohotkey.com/board/topic/79192-toggle-hold-down-a-key/
* http://www.autohotkey.com/board/topic/101298-hold-down-key-on-keypress/
* http://www.autohotkey.com/board/topic/107428-toggling-shift-using-a-single-key/
* http://www.autohotkey.com/board/topic/72858-mouse-look-toggle-script-can-someone-please-help/
* http://www.autohotkey.com/board/topic/90695-metro-2033-toggle-aim-hold-right-mouse-button/
* http://stackoverflow.com/questions/15472404/autohotkey-on-right-mouse-click-get-a-keyboard-button-pressed-as-well

Sound
* http://www.autohotkey.com/docs/commands/SoundBeep.htm
* http://www.autohotkey.com/docs/commands/SoundPlay.htm
* http://www.autohotkey.com/board/topic/36109-setting-microphone-and-stereo-mix-using-soundset-function/
* http://www.autohotkey.com/docs/commands/SoundSet.htm
* http://www.autohotkey.com/board/topic/74440-problem-with-soundplay/
* http://www.autohotkey.com/board/topic/79063-simple-script-that-plays-a-sound-when-button-is-pressed/

Overlay
* http://www.autohotkey.com/board/topic/42069-lib-gpf-v11c-overlaying-direct3d-games-dx-89-fixed/
* http://overlay-api.net/

Debugging
http://www.autohotkey.com/board/topic/59612-simple-debug-console-output/
https://pyahk.readthedocs.org/en/latest/

*/

#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent                 ; Keep the script running until ExitApp is called
#SingleInstance Force       ; Reload on script relaunch

SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2        ; Make search title in #IfWinActive more flexible
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.


#IfWinActive Dragon Age: Inquisition
; #IfWinActive Notepad ; Easy Debug

/*
 *** RMB toggle for freelook ***
 */
RButton::
  toggle_right := !toggle_right
  if toggle_right
  {
    ; ToolTip, "down"
    Click down right
  }
  else
  {
    ; ToolTip, "up"
    Click up right
  }
Return

/*
 *** Shift toggle for sprint ***
 http://www.autohotkey.com/board/topic/41510-is-there-any-way-to-get-shift-to-toggle-like-caps-lock/?p=259395
 */
LShift:: Send % "{Blind}{LShift " . ((lshift:=!lshift) ? "Down}" : "Up}")

/*
 *** Disable the Windows Key ***
 */
LWin::

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


#IfWinActive