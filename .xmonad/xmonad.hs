import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.WorkspaceNames
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.Run

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ docks def
    { terminal           = "st"
    , modMask            = mod4Mask
    , normalBorderColor  = "#586e75"
    , focusedBorderColor = "#859900" 
    , layoutHook         = avoidStruts $ smartBorders $ layoutHook def
    , logHook            = dynamicLogWithPP xmobarPP
      { ppOutput  = hPutStrLn xmproc
      , ppCurrent = xmobarColor "#859900" "" . wrap "[" "]"
      , ppTitle   = xmobarColor "#b58900" "" . shorten 50 
      }
    } 
    `additionalKeysP`
    [ ("M-p", spawn "rlaunch -f 'Liberation Mono:size=10' -h 15 -t st --color0 '#002b36' --color1 '#002b36' --color2 '#93a1a1' --color3 '#839496' --color4 '#073642'")
    , ("M-<L>", prevWS)
    , ("M-<R>", nextWS)
    , ("M-<D>", toggleWS)
    , ("M-<UP>", renameWorkspace def)
    , ("M-S-<L>", shiftToPrev >> prevWS)
    , ("M-S-<R>", shiftToNext >> nextWS)
    , ("M-S-<Up>", spawn "~/.xmonad/scripts/rotate.sh --left")
    , ("M-S-<Down>", spawn "~/.xmonad/scripts/rotate.sh --down")
    ]

