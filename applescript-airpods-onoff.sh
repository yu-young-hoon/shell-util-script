#!/usr/bin/osascript
set bluetoothName to "유영훈의 AirPods"

activate application "SystemUIServer"
tell application "System Events"
	tell process "SystemUIServer"
		set btMenu to (menu bar item 1 of menu bar 1 whose description contains "bluetooth")
		tell btMenu
			click
			tell (menu item bluetoothName of menu 1)
				click
				if exists menu item "연결" of menu 1 then
					click menu item "연결" of menu 1
					display notification "에어팟 연결" with title "Toggle AirPods"
				else if exists menu item "연결 해제" of menu 1 then
					click menu item "연결 해제" of menu 1
					display notification "에어팟 종료" with title "Toggle AirPods"
				else
					click btMenu -- Close main BT drop down if Connect wasn't present
					return "Airpods were not found, try manually pairing them again!"
				end if
			end tell
		end tell
	end tell
end tell