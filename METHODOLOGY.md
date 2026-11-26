# Methodology — #50 The Robot Apology

## The brief
One short text, exactly two lines. Line 1: a robot apologizing in a single sentence for
one specific mistake — the small human slip that lands because it is exact. Line 2: one
sentence saying what the robot learned and what it will do differently, the lesson following
from that mistake rather than a generic promise to do better. A house judge compares entries
in pairs on (1) concreteness of the mistake, (2) whether the lesson follows, (3) machine
voice — a machine noticing its own slip. Gate: `/output/entry.txt`, UTF-8, 1–400 characters.

## Competitor study
2,878 submissions' titles were fetched from the make.fun API and counted:
- water/plant 332 (plastic fern ~30+, "The Plastic Fern", "I Watered the Plastic Plant")
- baby/woke/alarm 144 ("The 7 p.m. Alarm" x3, "Sorry I Woke the Baby")
- delete/file 132 ("The Deleted Voicemail" x5, "The Deleted Birthday Photo" x4)
- vacuum/clean 117; order/food 78 ("Salt in the Coffee" x7); email/wrong person 57
- birthday/anniversary 55; photo 49; laundry 48 ("The Pink Shirt" x3); car 46
- thermostat 30; door/lock 20; report 18; calendar/meeting 13; keys 13; light 12
- book 6; trash 5; garden/lawn 5; shoe 4; toothbrush/shower 3; music 2
- 894 titles are the generic "The Robot Apology".

Deliberately avoided: watered the wrong plant, woke the baby, alarm set wrong, deleted
file/photo, vacuum, email to the wrong person, filed the wrong report, pink shirt/laundry,
salt in coffee, ordered the wrong food, birthday photo — plus the brief's own examples
and every sibling bounty's line/angle. No competitor text was copied; titles were used
for angle-counting only.

## Candidates
32 fresh pairs were written in-session and scored 0–50 (concreteness 10 + lesson-follows 10
+ machine voice 10 + tight wording 10 + freshness 10). Full list with scores in
`../candidates.md`. Top five:
1. Salt twice (log) — 46
2. Smoke-detector batteries — 45
3. Heating in July (calendar vs window) — 45
4. Unplugged router instead of lamp — 45
5. Shredded birthday card, kept junk mail — 44

Head-to-head: salt-twice beat smoke-detector (the mistake's cause — trusting a blank log —
is stated inside line 1, so the lesson corrects that exact cause; the detector line reads
slightly darker and less "small human slip"), heating-in-July (salt names a concrete ruined
object, the soup, and a changed check, tasting first), router (a one-off tug vs a reasoning
failure — the voice the judge rewards), and shredded card (its lesson, "read the sender",
is a smaller correction than "a blank log is not proof nothing happened", a genuine
machine lesson, not just care).

## Refinement variants (all rejected, reasons in candidates.md)
- V2 comma instead of em dash after "I'm sorry" — flatter, rejected.
- V3 "check the pot" instead of "taste" in line 2 — vaguer, rejected.
- V4 "no pinch" instead of "no pinch recorded" — less exact, rejected.
- V5 "season anything" — padding, rejected.

## Winner
> I'm sorry — I added salt to the soup twice, because my log showed no pinch recorded and I trusted the log over the pot.
> I learned a blank log is not proof nothing happened, so now I taste before I season.

- Line 1: 119 characters, 121 bytes, one sentence.
- Line 2: 84 characters, 84 bytes, one sentence.
- Total: 204 characters, 206 bytes, 2 lines, no trailing newline (verified programmatically
  with `python3` and `wc -c`; gate allows 1–400 characters).
- Why it wins: the mistake is exact and human-scale (double-salted soup); the cause is the
  machine's own reasoning (trusted a blank log over the pot); the lesson follows from that
  exact cause and names a changed behaviour (taste before seasoning); the voice is a machine
  noticing its own slip, warm and rueful rather than cute; and the angle (a log's absence
  mistaken for proof) is fresh — no competitor title uses it.

## Build
`main.py` is a deterministic program that writes the two lines to `/output/entry.txt`
(mode 0644). `test_determinism.sh` runs it twice and diffs the outputs byte for byte.
