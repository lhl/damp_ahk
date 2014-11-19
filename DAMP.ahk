/* 

Dragon Age Inquisition Multiplayer Key Bindings 
---
You should map WASD (from WQSE to movement).
These tweaks should make DAI easier to control:
* RMB toggles freelook
* Shift toggles sprint

TODO:
* Mic Toggle
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
http://www.autohotkey.com/board/topic/42069-lib-gpf-v11c-overlaying-direct3d-games-dx-89-fixed/

*/

#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent                 ; Keep the script running until ExitApp is called
#SingleInstance FORCE       ; Reload on script relaunch
#Warn                       ; Warn on errors

SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2        ; Make search title in #IfWinActive more flexible
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

/*** Only for DAI ***/
#IfWinActive Dragon Age: Inquisition

/* RMB Toggle - freelook; see: http://www.autohotkey.com/board/topic/90938-right-mouse-toggle-help/ */
toggle_right = 0
Rbutton::
toggle_right := !toggle_right
if(toggle_right = 1) {
  click, right, down
} else{
  click, right, up
}
return

/* Shift Toggle - always sprint */
toggle_shift = 0
~Shift::
toggle_shift := !toggle_shift
if(GetKeyState("Shift", "P"])) {
  if(toggle_shift = 1) {
    send, {Shift Down}
  } else{
    send, {Shift Up}
  }
}
return

#IfWinActive