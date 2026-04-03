#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 not found"
  exit 1
fi

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
pip install -r requirements.txt

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example"
fi

python ready_check.py || true

echo
echo "Install complete."
echo "Next: edit .env (TG_API_ID, TG_API_HASH, BOT_USERNAME), then run:"
echo "  source .venv/bin/activate && python driver_mtproto.py"
