import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

main = xmonad =<< xmobar (ewmh $ defaultConfig)
    { borderWidth = 4
    , focusedBorderColor = "pink"
    , modMask = mod4Mask
    , normalBorderColor = "black"
    , terminal = "urxvtc"
    }
