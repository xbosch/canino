# Canino

Telegram adversarial/load tester for XoBop.

## What it does
- Sends periodic test prompts to the bot from your Telegram user account (MTProto via Telethon)
- Covers conversational, shell, cron, memory, edge-case, and adversarial categories
- Collects async replies and scores pass/fail/timeout/error
- Stores results in SQLite (`results.db`)

## Quick install (interactive)
```bash
bash install.sh
```

The installer will:
- create `.venv`
- install dependencies
- ask for all required parameters
- explain where to get Telegram API credentials
- write `.env`
- run readiness check

## Run
```bash
source .venv/bin/activate
python driver_mtproto.py
```

## Files
- `driver_mtproto.py` — main MTProto test driver
- `main.py` — legacy Bot API mode
- `ready_check.py` — preflight checker
- `.env.example` — env template
- `install.sh` — setup wizard

## Notes
- First run requires Telegram login code (and maybe 2FA) in terminal.
- `.env`, `.venv`, and `results.db` are git-ignored.
