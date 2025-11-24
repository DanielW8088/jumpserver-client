-- usage: program <cmd> <tab>
on run argv
	set cmd to item 1 of argv
	set tab to item 2 of argv
	openGhostty(cmd, tab)
end run

on openGhostty(cmd, tab)
	if application "Ghostty" is running then
		openGhosttyWithTab(cmd)
	else
		openGhosttyNewWindow(cmd)
	end if
end openGhostty

on openGhosttyWithTab(cmd)
	tell application "Ghostty"
		activate
	end tell
	delay 0.3
	tell application "System Events"
		tell process "Ghostty"
			keystroke "t" using command down
			delay 0.2
			keystroke cmd
			keystroke return
		end tell
	end tell
end openGhosttyWithTab

on openGhosttyNewWindow(cmd)
	tell application "Ghostty"
		activate
	end tell
	delay 0.5
	tell application "System Events"
		tell process "Ghostty"
			keystroke cmd
			keystroke return
		end tell
	end tell
end openGhosttyNewWindow

on logit(log_string)
	set logfile to (system attribute "TMPDIR") & "ghostty_loader.log"
	do shell script "echo `date '+%Y-%m-%d %T'`\"" & log_string & "\" >> " & logfile
end logit
