import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.SpawnOnce

main = xmonad $ ewmh defaultConfig{
  borderWidth = 4
  , focusedBorderColor = "pink"
  , modMask = mod4Mask
  , normalBorderColor = "black"
  , terminal = "urxvtc"
  , startupHook = do
    spawnOnce "xmobar ~/.xmobarrc"
  }
