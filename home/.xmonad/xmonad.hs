import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig

myManageHook = composeAll
    [ className =? "pidgin" --> doFloat
    , className =? "Pidgin" --> doFloat
    , className =? "Gimp" --> doFloat
    , resource  =? "desktop_window" --> doIgnore ]

myLayout = smartBorders (tiled ||| Mirror tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

main = xmonad $ ewmh $ defaultConfig {
  borderWidth = 2
  , focusedBorderColor = "pink"
  , modMask = mod4Mask
  , normalBorderColor = "black"
  , terminal = "urxvtc"
  , manageHook = myManageHook
  , layoutHook = myLayout
  } `additionalKeys`
       [
         -- hide/show window borders thanks to http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Actions-NoBorders.html
         -- ((mod4Mask,  xK_g ),   withFocused toggleBorder)
       ]
