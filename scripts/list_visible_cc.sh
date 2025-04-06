#!/bin/zsh

## -- shellcheck will work unless you temporarily change to -- #!/bin/bash (INFO)
# cc is short for Control Center.  Some call this the task bar, status bar, it's the uper right region (default) that works similar to system tray on Windows

CONTROL_CENTER_CONFIG=$(defaults read com.apple.controlcenter)

VISIBLE_ENTRIES=$(echo "${CONTROL_CENTER_CONFIG}" | grep "NSStatusItem Visible.* = 1;")

# Does not indicate setting for "show while open" (NOTABUG)
# Does not indicate index or order (NOTABUG)
# BentoBox showed up mid-development; suspect a desktop manager but one isn't visible (WTF)
# REGEX is not hungry/greedy checked (NOTABUG)
(echo "${VISIBLE_ENTRIES}" | sed -Ee "s/.* Visible ([^\"]+)\".*/\1/")
