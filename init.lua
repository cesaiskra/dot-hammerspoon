-- DO NOT EDIT THIS FILE DIRECTLY
-- This is a file generated from a literate programing source file located at
-- https://github.com/zzamboni/dot-hammerspoon/blob/master/init.org.
-- You should make any changes there and regenerate it from Emacs org-mode using C-c C-v t

hs.logger.defaultLogLevel="info"

hyper = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}

col = hs.drawing.color.x11

swisscom_logo = hs.image.imageFromPath(hs.configdir .. "/files/swisscom_logo_2x.png")

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.zzspoons = {
  url = "https://github.com/zzamboni/zzSpoons",
  desc = "zzamboni's spoon repository",
}

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("URLDispatcher",
               {
                 config = {
                   url_patterns = {
                     { "https?://issue.swisscom.ch", "org.epichrome.app.SwisscomJira" },
                     { "https?://issue.swisscom.com", "org.epichrome.app.SwisscomJira" },
                     { "https?://jira.swisscom.com", "org.epichrome.app.SwisscomJira" },
                     { "https?://wiki.swisscom.com", "org.epichrome.app.SwisscomWiki" },
                     { "https?://collaboration.swisscom.com", "org.epichrome.app.SwisscomCollab" },
                     { "https?://smca.swisscom.com", "org.epichrome.app.SwisscomTWP" },
                     { "https?://portal.corproot.net", "com.google.Chrome" },
                     { "https?://app.opsgenie.com", "org.epichrome.app.OpsGenie" },
                   },
                   default_handler = "com.google.Chrome"
                 },
                 start = true
               }
)

Install:andUse("WindowHalfsAndThirds",
               {
                 config = {
                   use_frame_correctness = true
                 },
                 hotkeys = 'default'
               }
)

Install:andUse("WindowScreenLeftAndRight",
               {
                 hotkeys = 'default'
               }
)

Install:andUse("WindowGrid",
               {
                 config = { gridGeometries = { { "6x4" } } },
                 hotkeys = {show_grid = {hyper, "g"}},
                 start = true
               }
)

Install:andUse("ToggleScreenRotation",
               {
                 hotkeys = { first = {hyper, "f15"} }
               }
)

Install:andUse("UniversalArchive",
               {
                 config = {
                   evernote_archive_notebook = ".Archive",
                   outlook_archive_folder = "Archive (On My Computer)",
                   archive_notifications = false
                 },
                 hotkeys = { archive = { { "ctrl", "cmd" }, "a" } }
               }
)

Install:andUse("SendToOmniFocus",
               {
                 config = {
                   quickentrydialog = false,
                   notifications = false
                 },
                 hotkeys = {
                   send_to_omnifocus = { hyper, "t" }
                 },
                 fn = function(s)
                   s:registerApplication("Swisscom Collab", { apptype = "chromeapp", itemname = "tab" })
                   s:registerApplication("Swisscom Wiki", { apptype = "chromeapp", itemname = "wiki page" })
                   s:registerApplication("Swisscom Jira", { apptype = "chromeapp", itemname = "issue" })
                 end
               }
)

-- 
Install:andUse("EvernoteOpenAndTag",
               {
                 hotkeys = {
                   open_note = { hyper, "o" },
                   ["open_and_tag-+work,+swisscom"] = { hyper, "w" },
                   ["open_and_tag-+personal"] = { hyper, "p" },
                   ["tag-@zzdone"] = { hyper, "z" }
                 }
               }
)

Install:andUse("TextClipboardHistory",
               {
                 config = {
                   show_in_menubar = false,
                 },
                 hotkeys = {
                   toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true,
               }
)

-- http://www.hammerspoon.org/Spoons/Caffeine.html
Install:andUse("Caffeine", {
                 start = true,
                 hotkeys = {
                   toggle = { hyper, "1" }
                 }
})

-- http://www.hammerspoon.org/Spoons/MenubarFlag.html
Install:andUse("MenubarFlag",
               {
                 config = {
                   colors = {
                     ["U.S."] = { },
                     Spanish = {col.green, col.white, col.red},
                     German = {col.black, col.red, col.yellow},
                   }
                 },
                 start = true
               }
)

-- http://www.hammerspoon.org/Spoons/MouseCircle.html
Install:andUse("MouseCircle",
               {
                 disable = true,
                 config = {
                   color = hs.drawing.color.x11.rebeccapurple
                 },
                 hotkeys = {
                   show = { hyper, "m" }
                 }
               }
)

-- http://www.hammerspoon.org/Spoons/BrewInfo.html
Install:andUse("BrewInfo",
               {
                 config = {
                   brew_info_style = {
                     textFont = "Inconsolata",
                     textSize = 14,
                     radius = 10 }
                 },
                 hotkeys = {
                   -- brew info
                   show_brew_info = {hyper, "b"},
                   open_brew_url = {shift_hyper, "b"},
                   -- brew cask info
                   show_brew_cask_info = {hyper, "c"},
                   open_brew_cask_url = {shift_hyper, "c"},
                 }
               }
)

-- http://zzamboni.org/zzSpoons/Hammer.html
Install:andUse("Hammer",
               {
                 repo = 'zzspoons',
                 config = { auto_reload_config = false },
                 hotkeys = {
                   config_reload = {hyper, "r"},
                   toggle_console = {hyper, "y"} 
                 },
                 start = true
               }
)

-- http://www.hammerspoon.org/Spoons/ToggleSkypeMute.html
Install:andUse("ToggleSkypeMute",
               {
                 hotkeys = {
                   toggle_skype = { shift_hyper, "v" },
                   toggle_skype_for_business = { shift_hyper, "f" }
                 }
               }
)

-- http://www.hammerspoon.org/Spoons/Emojis.html
Install:andUse("Emojis",
               {
                 disable = true,
                 hotkeys = { toggle = { hyper, "e" } }
               }
)

-- http://www.hammerspoon.org/Spoons/HeadphoneAutoPause.html
Install:andUse("HeadphoneAutoPause",
               {
                 start = true
               }
)

-- http://www.hammerspoon.org/Spoons/Seal.html
Install:andUse("Seal",
               {
                 hotkeys = { show = { {"cmd"}, "space" } },
                 fn = function(s)
                   s:loadPlugins({"apps", "calc", "safari_bookmarks", "screencapture", "useractions"})
                   s.plugins.safari_bookmarks.always_open_with_safari = false
                   s.plugins.useractions.actions =
                     {
                       ["Hammerspoon docs webpage"] = {
                         url = "http://hammerspoon.org/docs/",
                         icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
                         --                              hotkey = { hyper, "h" }
                       },
                       ["Leave corpnet"] = {
                         fn = function()
                           spoon.WiFiTransitions:processTransition('foo', 'corpnet01')
                         end,
                         icon = swisscom_logo,
                       },
                       ["Arrive in corpnet"] = {
                         fn = function()
                           spoon.WiFiTransitions:processTransition('corpnet01', 'foo')
                         end,
                         icon = swisscom_logo,
                       },
                       ["Translate using Leo"] = {
                         url = "http://dict.leo.org/ende/index_de.html#/search=${query}",
                         icon = 'favicon',
                         keyword = "leo",
                       },
                       ["Tell me something"] = {
                         keyword = "tellme",
                         fn = function(str) hs.alert.show(str) end,
                       }
                     }
                   s:refreshAllCommands()
                 end,
                 start = true,
               }
)

-- http://www.hammerspoon.org/Spoons/ColorPicker.html
Install:andUse("ColorPicker",
               {
                 disable = true,
                 hotkeys = {
                   show = { shift_hyper, "c" }
                 },
                 config = {
                   show_in_menubar = false,
                 },
                 start = true,
               }
)

function reconfigSpotifyProxy(proxy)
  local spotify = hs.appfinder.appFromName("Spotify")
  local lastapp = nil
  if spotify then
    lastapp = hs.application.frontmostApplication() 
    spotify:kill()
    hs.timer.usleep(40000)
  end
  --   hs.notify.show(string.format("Reconfiguring %sSpotify", ((spotify~=nil) and "and restarting " or "")), string.format("Proxy %s", (proxy and "enabled" or "disabled")), "")
  -- I use CFEngine to reconfigure the Spotify preferences
  cmd = string.format("/usr/local/bin/cf-agent -K -f %s/files/spotify-proxymode.cf%s", hs.configdir, (proxy and " -DPROXY" or " -DNOPROXY"))
  --   print("reconfigSpotifyProxy: running command ", cmd)
  output, status, t, rc = hs.execute(cmd)
  --   print(output, status, t, rc)
  if spotify and lastapp then
    hs.timer.doAfter(3,
                     function()
                       if not hs.application.launchOrFocus("Spotify") then
                         hs.notify.show("Error launching Spotify", "", "")
                       end
                       if lastapp then
                         hs.timer.doAfter(0.5, hs.fnutils.partial(lastapp.activate, lastapp))
                       end
    end)
  end
end

function reconfigAdiumProxy(proxy)
  --   hs.notify.show("Reconfiguring Adium", string.format("Proxy %s", (proxy and "enabled" or "disabled")), "")
  local script = string.format([[
tell application "Adium"
  repeat with a in accounts
    if (enabled of a) is true then
      set proxy enabled of a to %s
    end if
  end repeat
  go offline
  go online
end tell
]], hs.inspect(proxy))
  hs.osascript.applescript(script)
end

Install:andUse("WiFiTransitions",
               {
                 config = {
                   actions = {
                     -- { -- Test action just to see the SSID transitions
                     --    fn = function(_, _, prev_ssid, new_ssid)
                     --       hs.notify.show("SSID change", string.format("From '%s' to '%s'", prev_ssid, new_ssid), "")
                     --    end
                     -- },
                     { -- Enable proxy in Spotify and Adium config when joining corp network
                       to = "corpnet01",
                       fn = {hs.fnutils.partial(reconfigSpotifyProxy, true),
                             hs.fnutils.partial(reconfigAdiumProxy, true),
                       }
                     },
                     { -- Disable proxy in Spotify and Adium config when leaving corp network
                       from = "corpnet01",
                       fn = {hs.fnutils.partial(reconfigSpotifyProxy, false),
                             hs.fnutils.partial(reconfigAdiumProxy, false),
                       }
                     },
                   }
                 },
                 start = true,
               }
)

local wm=hs.webview.windowMasks
Install:andUse("PopupTranslateSelection",
               {
                 config = {
                   popup_style = wm.utility|wm.HUD|wm.titled|wm.closable|wm.resizable,
                 },
                 hotkeys = {
                   translate_to_en = { hyper, "e" },
                   translate_to_de = { hyper, "d" },
                   translate_to_es = { hyper, "s" },
                   translate_de_en = { shift_hyper, "e" },
                   translate_en_de = { shift_hyper, "d" },
                 }
               }
)

-- Cheat sheet for the running application
Install:andUse("KSheet",
               {
                 hotkeys = {
                   toggle = { hyper, "/" }
}})

----------------------------------------------------------------------
-- Test stuff

local localstuff=loadfile(hs.configdir .. "/init-local.lua")
if localstuff then
  localstuff()
end

-- http://www.hammerspoon.org/Spoons/FadeLogo.html
Install:andUse("FadeLogo",
               {
                 config = {
                   default_run = 1.0,
                 },
                 start = true
               }
)

-- If you don't want to use FadeLogo, you can have a regular notification
-- hs.notify.show("Welcome to Hammerspoon", "Have fun!", "")
