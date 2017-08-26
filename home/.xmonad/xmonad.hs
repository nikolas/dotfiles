import XMonad
import XMonad.Actions.NoBorders
import XMonad.Actions.Volume
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.DecorationMadness
import XMonad.Prompt
import XMonad.Prompt.Man
--import XMonad.Layout.Accordion
import XMonad.Util.EZConfig

myManageHook = composeAll
    [ className =? "pidgin" --> doFloat
    , className =? "Pidgin" --> doFloat
    , className =? "Gimp" --> doFloat
    , className =? "ardour" --> doFloat
    , className =? "Ardour" --> doFloat
    , className =? "XEyes" --> doFloat
    , resource  =? "desktop_window" --> doIgnore ]

myLayout = smartBorders (circleSimpleTabbed ||| tiled ||| Full)
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
         ((mod4Mask, xK_g), withFocused toggleBorder),
         ((mod4Mask, xK_F1), manPrompt def),
         ((mod4Mask, xK_F8 ), lowerVolume 3 >> return ()),
         ((mod4Mask, xK_F9 ), raiseVolume 3 >> return ()),
         ((mod4Mask, xK_F10), toggleMute    >> return ())
       ]
