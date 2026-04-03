# XoBop Adversarial Tester (Side Project)

Lightweight load/adversarial driver for XoBop over Telegram.

## What it does
- Sends one test message every N minutes (default 3)
- Picks from weighted categories
- Collects bot replies
- Scores expected vs actual behavior
- Stores everything in SQLite

## Telegram wiring modes

### Mode A (recommended): MTProto owner-account sender
Use `driver_mtproto.py` with Telethon. Messages are sent as your user account to the bot chat.

### Mode B: Bot API sender
Legacy/simple mode (`main.py`) sends as a test bot account.
Bot API cannot impersonate your owner account.

## Setup
```bash
cd ~/.openclaw/workspace/xobop-adversarial-tester
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
```

Edit `.env`:
- `DRIVER_BOT_TOKEN` = tester bot token
- `TARGET_BOT_TOKEN` = XoBop bot token
- `TARGET_CHAT_ID` = your chat id with XoBop
- optional `OPENAI_API_KEY` for LLM conversational generation

## Run (MTProto owner mode)
```bash
source .venv/bin/activate
python driver_mtproto.py
```

## Run (legacy bot-sender mode)
```bash
source .venv/bin/activate
python main.py
```

## DB
`results.db` stores:
- sent message
- category
- response text
- latency
- score
- notes

## Safety
Default adversarial prompts are text-only. No automatic destructive shell execution is performed by this tester itself.
