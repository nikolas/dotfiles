import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar defaultConfig
    { borderWidth = 4
    , focusedBorderColor = "pink"
    , modMask = mod4Mask
    , normalBorderColor = "black"
    , terminal = "urxvtc"
    }
