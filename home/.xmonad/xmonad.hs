import XMonad
import XMonad.Actions.NoBorders
import XMonad.Actions.Volume
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.DecorationMadness
--import XMonad.Layout.Gaps
--import XMonad.Layout.Spacing
import XMonad.Prompt
import XMonad.Prompt.Man
--import XMonad.Layout.Accordion
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

myManageHook = composeAll
    [ className =? "pidgin" --> doFloat
    , className =? "Pidgin" --> doFloat
    , className =? "gimp" --> doFloat
    , className =? "Gimp" --> doFloat
    , className =? "ardour" --> doFloat
    , className =? "Ardour" --> doFloat
    , className =? "Clock" --> doFloat
    , className =? "XEyes" --> doFloat
    , resource  =? "desktop_window" --> doIgnore ]

myLayout = smartBorders (circleSimpleDefault ||| tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

main = xmonad $ ewmh $ docks def {
  borderWidth = 1
  , focusedBorderColor = "pink"
  , modMask = mod4Mask
  , normalBorderColor = "black"
  , terminal = "urxvtc"
  , manageHook = myManageHook
  , layoutHook = avoidStruts $ myLayout
  } `additionalKeys`
       [
         ((mod4Mask, xK_g), withFocused toggleBorder)

       , ((0, xF86XK_AudioLowerVolume   ), lowerVolume 3 >> return ())
       , ((0, xF86XK_AudioRaiseVolume   ), raiseVolume 3 >> return ())
       , ((0, xF86XK_AudioMute          ), toggleMute    >> return ())

       , ((0, xF86XK_MonBrightnessUp   ), spawn "xbacklight +20")
       , ((0, xF86XK_MonBrightnessDown   ), spawn "xbacklight -20")
         --((mod4Mask, xK_F1), manPrompt def)
       ]
