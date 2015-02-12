import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

myManageHook = composeAll
  [ className =? "pidgin" --> doFloat
  , className =? "Pidgin" --> doFloat
  , className =? "Gimp" --> doFloat
  , resource  =? "desktop_window" --> doIgnore ]

main = xmonad $ ewmh defaultConfig{
  borderWidth = 3
  , focusedBorderColor = "pink"
  , modMask = mod4Mask
  , normalBorderColor = "black"
  , terminal = "urxvtc"
  , manageHook = myManageHook
  }
