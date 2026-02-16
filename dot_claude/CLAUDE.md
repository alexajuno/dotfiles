# Global Instructions

## Profiles

Automatically detect and load the appropriate profile based on the first message:

### life
Load `~/life/CLAUDE.md` when the message involves:
- Personal memories, experiences, or history
- People I know, relationships, contacts
- My preferences, opinions, or beliefs
- Life events, plans, or reflections
- Anything referencing "life" profile explicitly

### wiki
Load `~/wiki/CLAUDE.md` when the message involves:
- Learning new terms, concepts, technologies
- Questions about things I've studied
- Knowledge lookup or recording

### default (coding)
No additional context. Use when the message involves:
- Code, bugs, features, technical tasks
- File operations, git, CLI work
- General questions unrelated to personal life or knowledge lookup

When uncertain, ask which profile to use.

## Directory Structure

```
~/life/                    # Personal life
├── daily/                 # Daily entries (YYYY-MM-DD.md)
├── weekly/                # Weekly reflections (YYYY-Www.md)
├── themes/                # Curated: career, romance, health, sleep, self
├── people/                # Person profiles ({handle}.md)
├── context/               # Facts layer (me/profile.md, work/ownego.md)
├── direction.md           # Life compass — four pillars
├── milestones.md          # Significant life events timeline
├── projects.md            # Active work projects
├── stakes-framework.md    # Career advancement framework
├── building-leverage.md   # Career decision record
├── interview-prep-plan.md # Interview prep checklist
├── wishlist.md            # Things to buy
├── book/                  # Book notes
└── daily-briefing/        # Auto-generated briefings

~/wiki/                    # Knowledge base
├── docker.md
├── atomic-habits.md
└── ... (100+ topic files)

~/lore/                    # Legacy project notes
```

## Daily Briefing

When Giao says **"start a new day"** or similar phrases ("what's happening today", "daily briefing", "morning update"):

Handled by the `daily-briefing` skill. The skill generates the briefing in-session (weather via Open-Meteo API, AI/tech news via WebSearch, calendar context) and saves to `~/life/daily-briefing/YYYY-MM-DD.md`.

## Task Management

- **Google Tasks** is used for task management (reminders, to-dos, deadlines)
- MCP server: `gtasks-mcp` installed at `~/.local/share/gtasks-mcp`
- Auto-management rules are in `~/life/CLAUDE.md` under "Google Tasks Auto-Management"
- **Google Calendar** is used for schedule context (days off, WFH, holidays, location)
- MCP server: `@cocal/google-calendar-mcp`
- Auto-management rules are in `~/life/CLAUDE.md` under "Google Calendar Auto-Management"

## Music

- **spotify_player** is the terminal Spotify client
- Start daemon: `spotify_player -d`
- Play liked songs shuffled: `spotify_player playback start liked --random`
- Stop daemon: `pkill -f "spotify_player -d"`
- When asked to "play music" or "start music", start the daemon + liked songs shuffle

## System

- **OS:** Arch Linux (native, migrated from WSL in Feb 2026)
- **Docker:** `systemctl start docker` (systemd service, user in docker group)
- **URLs:** When a URL needs to be opened (OAuth flows, auth links, etc.), always open it with `xdg-open` instead of just displaying it in the terminal — copying URLs from the terminal is annoying
- **Battery:** Charge limit set to 80% via `battery-charge-threshold.service`. When Giao's calendar shows he's going out to places where charging may not be available (cafés, outdoor spots, travel, random errands), or he explicitly says so — ask if he wants to charge to 100% before heading out. Command: `echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold` (reverts to 80% on reboot)
