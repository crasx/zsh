# crasx/zsh
 
Welcome to my personal zsh configuration! I have Cerebral palsy, which affects my fine motor control and makes every keystroke a challenge. This config is built around reducing keystrokes and friction — short aliases for the commands I run dozens of times a day, sensible defaults so I'm not fighting the shell, and a prompt that autocompletes all of my ambitions. If you have similar needs or just hate unnecessary typing, you might find it useful too.

---

## Setup

1. Install [oh-my-zsh](https://ohmyz.sh/) and set zsh as your default shell.

2. Clone this repo to `~/zsh`:
   ```sh
   cd ~ && git clone git@github.com:crasx/zsh.git --recurse-submodules
   # or HTTPS
   cd ~ && git clone https://github.com/crasx/zsh.git --recurse-submodules
   ```

3. Symlink the rc file:
   ```sh
   ln -s zsh/.zshrc ~/.zshrc
   ```

4. Optionally add private customizations:
   ```sh
   git clone git@github.com:[your-user]/zsh_private.git zsh/plugins/zsh_private
   ```

---

## Theme

Uses [geometry](https://github.com/geometry-zsh/geometry) — a minimal, information-dense prompt.

- **Left prompt:** hostname · status symbol · current path
- **Right prompt:** git branch/status · last command execution time (disabled in Vagrant)
- Path color is derived from a hash of the hostname, so each machine gets a unique color without any manual config.
- The terminal tab title updates to the current directory name after each command.

---

## Plugins

### oh-my-zsh built-ins

| Plugin | What it adds |
|--------|-------------|
| `cp` | Progress bar for `cp` via `cpv` |
| `history` | `h` alias and history search helpers |
| `profiles` | Named shell profiles |
| `docker` | Tab completion for Docker commands |
| `docker-compose` | Tab completion for Docker Compose |
| `composer` | Tab completion and aliases for Composer |
| `jump` | Bookmark directories with `mark`; jump to them with `jump` |
| `kubectl` | Tab completion for `kubectl` |
| `helm` | Tab completion for Helm |
| `terraform` | Tab completion for Terraform |

### Custom plugins

#### `aliases`
General-purpose aliases and utility functions. See [Commands](#commands) below.

#### `contrib`
Loads [git-open](https://github.com/paulirish/git-open) if present — opens the current repo's remote URL in your browser with `git open`.

#### `platforms`
Platform-specific configuration loaded automatically based on `$OSTYPE`. See [Platform Commands](#platform-commands) below.

---

## Commands

### General

| Command | Description |
|---------|-------------|
| `dc` | `docker compose` |
| `rezsh` | Reload `~/.zshrc` |
| `h` | `history` |
| `ll` | `ls -altr` — list all files, sorted oldest-first |
| `hr` | Print a horizontal rule (line of dashes) |
| `mkcd <dir>` | Create a directory and `cd` into it |
| `aptupgrade` | `sudo apt update && sudo apt upgrade` |
| `openssl_cert_debug <domain>` | Dump TLS certificate details for a domain |

### Git

| Command | Description |
|---------|-------------|
| `gs` | `git status` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `ga` | `git add` |
| `gl` | `git log --oneline --graph` |
| `gpo` | Push current branch to `origin` with `--set-upstream` |
| `gcfd` | `git clean -fd` — delete all untracked files and directories |
| `grhh` | `git reset --hard HEAD` — reset tracked files to HEAD |
| `gcr` | `gcfd` + `grhh` — full reset of the working directory |
| `gitsetup` | Apply opinionated git globals: `main` as default branch, `push.default current`, `co` → `checkout`, autocrlf input, paged branch list, `amend` alias |
| `deletemergedbranches` | Delete local branches already merged into current branch |
| `deletesandboxbranches` | Delete local branches named `sandbox*` (safe — won't delete unmerged) |
| `deletesandboxbranchesforced` | Force-delete local branches named `sandbox*` |
| `git open` | Open the current repo's remote URL in your browser (via `contrib` plugin) |

### Kubernetes

| Command | Description |
|---------|-------------|
| `kubeconfigset <name>` | Swap the active kubeconfig by symlinking `~/.kube/kubeconfig/<name>` to `~/.kube/config`. Tab-completes filenames from `~/.kube/kubeconfig/`. |
| `kubenuke <namespace>` | Force-delete a Kubernetes namespace stuck in `Terminating`. Prompts for confirmation, tries a normal delete first, then strips finalizers via the raw API if needed. |

### Docker

| Command | Description |
|---------|-------------|
| `dc` | `docker compose` |
| `dive <image>` | Explore a Docker image layer-by-layer using [wagoodman/dive](https://github.com/wagoodman/dive), run via Docker (no local install needed) |

### Drupal / PHP

| Command | Description |
|---------|-------------|
| `dr` | `drush -Dssh.tty=0` |
| `drushx` | Drush with Xdebug enabled (`DRUSH_ALLOW_XDEBUG=1`) |
| `c` | `composer` |

### ddev

Loaded only when `ddev` is installed.

| Command | Description |
|---------|-------------|
| `d` | `ddev` |
| `dds` | `ddev start` |
| `ddc` | `ddev composer` |
| `ddr` | `ddev drush` |
| `ddrx` | `ddev exec` with Xdebug enabled |
| `dblt` | `ddev exec vendor/bin/blt` |

### Lando

Loaded only when `lando` is installed.

| Command | Description |
|---------|-------------|
| `l` | `lando` |
| `lnd` | `lando` |
| `ldr` | `lando drush` |
| `lblt` | `lando blt` |

### Vagrant

Loaded only when `vagrant` is installed.

| Command | Description |
|---------|-------------|
| `v` | `vagrant` |
| `vup` | `vagrant up` |
| `vagrantshutdownall` | Halt all running Vagrant VMs |

---

## Platform Commands

### Linux

| Command | Description |
|---------|-------------|
| `bitmount` | GUI-assisted BitLocker drive mount using `dislocker` and `zenity`. Supports both password and `.bek` key file unlock. |
| `wake_device <MAC>` | Send a Wake-on-LAN magic packet to the given MAC address |

Linux also configures:
- Android SDK paths (`ANDROID_SDK_ROOT`, `ANDROID_HOME`, platform-tools in `PATH`)
- Razer DeathAdder mouse: disables pointer acceleration and sets a fast linear profile via `xinput` (if connected)
- WSL: enables Windows filesystem access and VirtualBox in `PATH` when running under WSL

### macOS

| Command | Description |
|---------|-------------|
| `cleardns` | Flush the macOS DNS cache |

macOS also loads NVM and Homebrew shell completions.

---

## History

Large history (50k entries in memory, 1k saved to disk) with deduplication, timestamps, and shared history across sessions. Trivial commands (`ls`, `cd`, `pwd`, `exit`, common git shortcuts) are excluded from history.
