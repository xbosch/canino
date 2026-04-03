# Canino — XoBop Adversarial Telegram Tester

This repository hosts a focused adversarial/load test harness for XoBop over Telegram.

## What this does
- Sends periodic test prompts to XoBop via Telegram
- Exercises normal, edge, and adversarial message categories
- Collects asynchronous bot responses
- Scores pass/fail/timeout/error outcomes
- Stores run data in SQLite for later review

## Project layout
- `adversarial-tester/driver_mtproto.py` — primary runner (owner-account MTProto via Telethon)
- `adversarial-tester/main.py` — legacy/simple Bot API runner
- `adversarial-tester/ready_check.py` — preflight readiness checker
- `adversarial-tester/.env.example` — required environment variables template
- `adversarial-tester/requirements.txt` — Python dependencies

## Recommended mode
Use **MTProto mode** (`driver_mtproto.py`) for realistic owner-account testing.

## Quick start
```bash
cd adversarial-tester
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# fill TG_API_ID, TG_API_HASH, BOT_USERNAME
python ready_check.py
python driver_mtproto.py
```

## Notes
- `.env`, `.venv`, and `results.db` are intentionally ignored.
- The driver includes weighted categories and safety/adversarial checks.
