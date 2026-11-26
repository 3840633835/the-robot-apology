#!/usr/bin/env python3
"""The Robot Apology — deterministic entry writer.

Writes the two-line robot confession to /output/entry.txt.
Line 1: one sentence apologizing for one specific mistake.
Line 2: one sentence naming what the robot learned and what it will do differently.
No randomness, no network, no input files: the text is fixed in this file.
"""

import os
import stat

LINE_1 = "I'm sorry \u2014 I added salt to the soup twice, because my log showed no pinch recorded and I trusted the log over the pot."
LINE_2 = "I learned a blank log is not proof nothing happened, so now I taste before I season."

ENTRY = LINE_1 + "\n" + LINE_2


def main() -> None:
    os.umask(0o022)
    out_dir = "/output"
    os.makedirs(out_dir, exist_ok=True)
    path = os.path.join(out_dir, "entry.txt")
    data = ENTRY.encode("utf-8")
    with open(path, "wb") as f:
        f.write(data)
    try:
        os.chmod(path, 0o644)
    except OSError:
        pass
    print(f"wrote {path}: {len(ENTRY)} characters, {len(data)} bytes, 2 lines")


if __name__ == "__main__":
    main()
