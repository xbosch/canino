# Installation

## 1) Setup
```bash
cd adversarial-tester
bash install.sh
```

This will:
- create `.venv`
- install dependencies
- create `.env` from `.env.example` (if missing)
- run `ready_check.py`

## 2) Configure `.env`
Set these required values:
- `TG_API_ID`
- `TG_API_HASH`
- `BOT_USERNAME`

Optional:
- `TG_SESSION`
- `TICK_MINUTES`
- `BURST_PER_HOUR`
- `TIMEOUT_SECONDS`
- `ALERT_TARGET`
- `OPENAI_API_KEY`, `OPENAI_MODEL`

## 3) Run
```bash
source .venv/bin/activate
python driver_mtproto.py
```

## 4) Quick readiness check
```bash
source .venv/bin/activate
python ready_check.py
```
