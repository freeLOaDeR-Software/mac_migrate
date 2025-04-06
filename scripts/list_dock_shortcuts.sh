#!/bin/zsh

## -- shellcheck will work unless you temporarily change to -- #!/bin/bash (INFO)

DOCK_CONFIG=$(defaults read com.apple.dock persistent-apps)

PROGRAM_ENTRIES=$(echo "${DOCK_CONFIG}" | grep '_CFURLString"')

PROGRAM_PATHS=$(echo "${PROGRAM_ENTRIES}" | cut -d '"' -f 4)

# Does not do url char conversion (substitute spaces) and is not hungry/greedy checked (NOTABUG)
(echo "${PROGRAM_PATHS}" | sed -Ee "s|.*/([^./]+).app.*|\1|")
