#!/usr/bin/osascript

activate application "SystemUIServer"
set deviceName to "유영훈의 AirPods"

tell application "System Events"
	tell process "SystemUIServer"
		set bluetoothMenu to (menu bar item 1 of menu bar 1 whose description contains "bluetooth")
		tell bluetoothMenu
			click
			
			set deviceMenuItem to (menu item deviceName of menu 1)
			tell deviceMenuItem
				click
				
				if exists menu item "Connect" of menu 1 then
					click menu item "Connect" of menu 1
					return "Connecting..."
				else
					set batteryLevelMenuItem to (menu item 3 of menu 1)
					tell batteryLevelMenuItem
						set batteryLevelText to title of batteryLevelMenuItem
					end tell
					
					key code 53 -- esc key
					
					return batteryLevelText
				end if
			end tell
		end tell
	end tell
end tell
