#!/usr/bin/env python3
from __future__ import annotations

import os
from pathlib import Path

from dotenv import load_dotenv


def main() -> int:
    root = Path(__file__).resolve().parent
    env_path = root / ".env"
    if env_path.exists():
        load_dotenv(env_path)

    required = ["TG_API_ID", "TG_API_HASH", "BOT_USERNAME"]
    missing = [k for k in required if not os.getenv(k)]

    print(f"project={root}")
    print(f"venv_exists={(root / '.venv').exists()}")
    print(f"env_file_exists={env_path.exists()}")
    print(f"db_path={os.getenv('DB_PATH', 'results.db')}")

    if missing:
        print("status=NOT_READY")
        print("missing=" + ",".join(missing))
        return 2

    print("status=READY_FOR_LOGIN")
    print("next=source .venv/bin/activate && python driver_mtproto.py")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
