/* Dragon Age Inquisition Multiplayer Key Bindings */

#SingleInstance FORCE ; Reload on script relaunch
#NoEnv                ; Don't check empty variables
#Warn                 ; Warn on errors
SendMode Input        ; Generally more reliable, see http://www.autohotkey.com/docs/commands/SendMode.htm
SetTitleMatchMode, 2  ; Make search title in #IfWinActive more flexible

#IfWinActive Dragon Age Inquisition

/* RMB Toggle - freelook; see: http://www.autohotkey.com/board/topic/90938-right-mouse-toggle-help/ */
toggle_right = 0
rbutton::
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
