#!/bin/sh
# Determinism test: run main.py twice, outputs must be byte-identical,
# and must match the committed entry.txt.
set -e
cd "$(dirname "$0")"
rm -rf /tmp/robot-apology-det1 /tmp/robot-apology-det2
mkdir -p /tmp/robot-apology-det1 /tmp/robot-apology-det2
# main.py writes to /output; run it in a sandbox dir by overriding via a copy
# of the output path is not supported, so run twice against /output directly.
python3 main.py
cp /output/entry.txt /tmp/robot-apology-det1/entry.txt
python3 main.py
cp /output/entry.txt /tmp/robot-apology-det2/entry.txt
cmp /tmp/robot-apology-det1/entry.txt /tmp/robot-apology-det2/entry.txt
cmp /tmp/robot-apology-det1/entry.txt entry.txt
echo "determinism OK: two runs identical and identical to committed entry.txt"
python3 -c "
d = open('entry.txt','rb').read()
assert len(d) == 206, len(d)
t = d.decode('utf-8')
assert t.count(chr(10)) == 1, 'must be exactly two lines'
lines = t.split(chr(10))
assert len(lines) == 2 and all(lines)
assert all(l.count('.') == 1 for l in lines), 'each line exactly one sentence'
assert 1 <= len(t) <= 400, 'gate: 1-400 characters'
print('gate OK: 204 characters, 2 lines, 1 sentence each')
"
