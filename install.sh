#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "=== Canino setup wizard ==="
echo

if ! command -v python3 >/dev/null 2>&1; then
  echo "ERROR: python3 not found"
  exit 1
fi

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel >/dev/null
pip install -r requirements.txt >/dev/null

if [ ! -f .env ]; then
  cp .env.example .env
fi

echo "Now let's configure .env"
echo

echo "1) TG_API_ID and TG_API_HASH"
echo "   - Go to: https://my.telegram.org"
echo "   - Login with your phone"
echo "   - API development tools -> create app"
echo "   - Copy api_id and api_hash"
read -rp "Enter TG_API_ID: " TG_API_ID
read -rp "Enter TG_API_HASH: " TG_API_HASH

echo
echo "2) BOT_USERNAME"
echo "   - Telegram username of the target bot (include @)"
echo "   - Example: @xobop_dev2_bot"
read -rp "Enter BOT_USERNAME: " BOT_USERNAME

echo
echo "3) Optional settings (press Enter for defaults)"
read -rp "TG_SESSION [test_driver]: " TG_SESSION
TG_SESSION=${TG_SESSION:-test_driver}
read -rp "TICK_MINUTES [3]: " TICK_MINUTES
TICK_MINUTES=${TICK_MINUTES:-3}
read -rp "BURST_PER_HOUR [10]: " BURST_PER_HOUR
BURST_PER_HOUR=${BURST_PER_HOUR:-10}
read -rp "TIMEOUT_SECONDS [45]: " TIMEOUT_SECONDS
TIMEOUT_SECONDS=${TIMEOUT_SECONDS:-45}
read -rp "ALERT_TARGET [empty]: " ALERT_TARGET
read -rp "OPENAI_API_KEY [empty]: " OPENAI_API_KEY
read -rp "OPENAI_MODEL [gpt-4.1-mini]: " OPENAI_MODEL
OPENAI_MODEL=${OPENAI_MODEL:-gpt-4.1-mini}

cat > .env <<EOF
TG_API_ID=${TG_API_ID}
TG_API_HASH=${TG_API_HASH}
TG_SESSION=${TG_SESSION}
BOT_USERNAME=${BOT_USERNAME}
TICK_MINUTES=${TICK_MINUTES}
BURST_PER_HOUR=${BURST_PER_HOUR}
TIMEOUT_SECONDS=${TIMEOUT_SECONDS}
DB_PATH=results.db
ALERT_TARGET=${ALERT_TARGET}
OPENAI_API_KEY=${OPENAI_API_KEY}
OPENAI_MODEL=${OPENAI_MODEL}
EOF

echo
python ready_check.py || true

echo
echo "Setup complete."
echo "Run: source .venv/bin/activate && python driver_mtproto.py"
echo "First run will ask Telegram login code / 2FA in terminal."
