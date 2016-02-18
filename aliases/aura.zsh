## Aliases for Aura (arch AUR helper/package manager)

# Wrapper to auto-prompt for sudo when using a for aura
function a(){
    export AURA="$(aura "$@")"

    if echo "$AURA" | grep -q '^aura >>= .*You have to use `.*sudo.*` for that.*$'
    then
        sudo aura "$@"
    else
        echo "$AURA"
    fi
}

# Function to search repos and AUR simultaneously with aura
function asas() {
  aura -Ss "$@"; aura -As "$@";
} 

# Function to upgrade everything
function ausa() {
    sudo aura -Syu; sudo aura -Akua;
}

## Aura is Pacman, so  have some pacman aliases
# Sync (S)
alias as='sudo aura -S'         #Install from repos
alias asi='aura -Si'            #Lookup a package's information
alias ass='aura -Ss'            #Search for a package in repos
alias asdeps='sudo aura -S --asdeps'    #Install package as a dependency
alias asyy='sudo aura -Syy'     #Update repos (forcibly)
alias asyu='sudo aura -Syu'     #Upgrade packages from repos
alias asc='sudo aura -Sc'       #Remove packages that are no longer installed from the cache
# Upgrade (U)
alias au='sudo aura -U'         #Upgrade
alias aud='sudo aura -Ud'       #Upgrade, skipping dependency checks
# Query (Q)
alias aq='aura -Q'              #Query package database
alias aqc='aura -Qc'            #View the changelog of a package
alias aqd='aura -Qd'            #List packages istalled as dependencies
alias aqe='aura -Qe'            #List packages that were explicitly installed
alias aqg='aura -Qg'            #Show all packages that are members of a names group, else list all grouped packages
alias aqi='aura -Qi'            #Lookup an installed package's information
alias aqii='aura -Qii'          #Lookup a package's backup files and modification dates
alias aqm='aura -Qm'            #List installed packages not found in sync dbs, e.g. installed from AUR/ABS or manually installed
alias aqn='aura -Qn'            #List installed packages found in sync dbs
alias aqo='aura -Qo'            #Search for packages that own the specified file(s)
alias aqs='aura -Qs'            #Query package database via regex
alias aqt='aura -Qt'            #List packages not requited by any package
alias aqu='aura -Qu'            #List outdated packages [filter]
alias aql='aura -Ql'            #List all files owned by a given package
# Remove (R)
alias ar='sudo aura -R'         #Remove a package
alias arns='sudo aura -Rns'     #Remove a package, without backups, including dependencies

## Now some Aura specific aliases
# AUR (A)
alias aas='aura -As'            #Search for AUR packages
alias aa='sudo aura -A'         #Install form AUR
alias aaa='sudo aura -Aa'       #Install from AUR and remove unneeded makedeps
alias aad='aura -Ad'            #View all the dependencies of an AUR package
alias aak='sudo aura -Ak'       #Install from AUR, show PKGBUILD diffs
alias aaka='sudo aura -Aka'     #Install from AUR, show PKGBUILD diffs and remove makedeps
alias aakua='sudo aura -Akua'   #Upgrade all AUR packages, show PKGBUILD diffs, and remove unneeded makedeps
alias akua=aakua
alias aax='sudo aura -Ax'       #Install from AUR with makepkg output unsuppressed
alias aai='aura -Ai'            #Lookup an AUR package's information
alias aap='aura -Ap'            #Checkout an AUR package's PKGBUILD
alias aau='sudo aura -Au'       #Upgrade all AUR packages
alias aaw='aura -Aw'            #Download tarball with makepkg and PKGBUILD without building/installing
# ABS (M)
alias am='sudo aura -M'         #Manually build package(s) from ABS
alias amdeps='sudo aura -M --absdeps' #Build a repository package and all its dependencies manually
alias amt='sudo aura -Mt'       #Sync a packages data to the local ABS tree
alias amy='sudo aura -My'       #Sync all package data in the local ABS tree
# Saving/Restoring the global package state (B)
alias ab='sudo aura -B'         #Save the global package state
alias abr='sudo aura -Br'       #Restore a saved state. Downgrades upgraded packages and removes recently installed
alias abc='sudo aura -Bc'       #Remove old save states. Optionally keep n states.
# Working with the Package Cache (C)
alias ac='sudo aura -C'         #Downgrade a package (this is interactive)
alias acs='aura -Cs'            #Search the package cache with regex
alias acb='sudo aura -Cb'       #Backup the package cache to a location
alias acc='sudo aura -Cc'       #Cull the package cache to the n most recent versions of each package file
alias accc='sudo aura -Ccc'     #Cull packages which are not saved in a package record (a la -B)
# Working with the Pacman log (L)
alias al='aura -L'              #View the pacman log
alias ali='aura -Li'            #View the log info on a package
alias als='aura -Ls'            #Search the log via regex
# Working with Orphan dependencies (O)
alias ao='aura -O'              #Display orphans/Adopt an orphaned package
alias aoj='sudo aura -Oj'       #Remove all orphans
