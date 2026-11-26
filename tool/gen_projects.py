"""Generates lib/data/projects_content.dart from design/directions/products.json (the same
source as the HTML mockups), so the site and the mockups never drift.

Run from the project root:  python tool/gen_projects.py
Images are referenced from assets/images/portfolio/ (copied there from design/directions/img/).
"""
import json
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / 'design' / 'directions'
ASSETS = ROOT / 'assets' / 'images' / 'portfolio'
OUT = ROOT / 'lib' / 'data' / 'projects_content.dart'

# Card copy on the home page (a.html): the category after the name, and one line.
CARDS = {
    'opencash': ('a cashier app for small shops', 'Freelance, the Flutter app: sales with barcode scan, variants, discounts, petty cash and Bluetooth receipts. On Google Play, rated 5.0.', 'cover_opencash_icon.webp', 'The OpenCash app icon'),
    'journey': ('an office platform at Werkudara', 'In the Center of Excellence team I took manual work from many departments into one platform, from plan and prototype to build and upkeep, built with AI agents.', 'cover_journey.webp', 'The Journey home with its five apps: WAM 2026, WLM, Signage, WG People and Journey Admin'),
    'torcons': ('an AI chat app', 'AI chat with live answers, three sign-ins and voice. 1K+ installs, 4.4 on Google Play.', 'cover_torcons.webp', 'Three Torcons chat screens on a pale blue ground'),
    'aicare': ('a telemedicine app', 'Symptom checker, doctor chat and Xendit payments. 5K+ installs, 4.6 on Google Play.', 'cover_aicare.webp', 'Three AI Care screens: home, health services and symptom check'),
    'tjar': ('a marketplace app', 'Customer and merchant apps in Arabic and English, a remote contract in 2024. 1K+ installs.', 'cover_tjar.webp', 'Three Tjar merchant screens in Arabic'),
    'badjetin': ('a money app for couples', 'My own app: budgets, bills, goals and debts, synced across two phones. Version 1.1.', 'cover_badjetin.webp', 'Three Badjetin screens: home, new transaction and monthly overview'),
    'callink': ('a calling app', 'WebRTC calls, rebuilt from React Native to Flutter, then a Kotlin call screen.', 'cover_callink.webp', 'Three Callink screens: welcome, sign-in and chat list'),
    'paketindo': ('a courier app', 'Customer and driver apps on Android, with live tracking on Google Maps. Archived.', 'cover_paketindo.webp', 'Three Paketindo screens: welcome, delivery quote and courier options'),
}
NOW = ['opencash', 'journey']
ARCHIVED = {'paketindo'}


def q(s):
    """A Dart single-quoted string literal."""
    return "'" + s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$') + "'"


def asset(path):
    """design img path ('img/x.webp') -> asset path, checking the file exists."""
    name = Path(path).name
    if not (ASSETS / name).exists():
        raise SystemExit(f'missing asset {name}: copy it from design/directions/img')
    return f'assets/images/portfolio/{name}'


def pic(path, alt):
    a = asset(path)
    with Image.open(ROOT / a) as im:
        w, h = im.size
    return f'Picture(path: {q(a)}, alt: {q(alt)}, width: {w}, height: {h})'


def rows(items):
    return '[' + ', '.join(f'TextRow({q(t)}, {q(d)})' for t, d in items) + ']'


def facts(items):
    return '[' + ', '.join(f'Fact({q(a)}, {q(b)})' for a, b in items) + ']'


def links(items):
    return '[' + ', '.join(f'LinkItem({q(a)}, {q(b)})' for a, b in items) + ']'


def project(p):
    cat, blurb, cover, cover_alt = CARDS[p['id']]
    pics = not p.get('no_pics')
    out = [
        f"  ProjectsData(",
        f"    id: {q(p['id'])},",
        f"    name: {q(p['name'])},",
        f"    category: {q(cat)},",
        f"    summary: {q(blurb)},",
        f"    card: {pic('img/' + cover, cover_alt)},",
        f"    icon: {q(asset(p['icon']))},",
        f"    tag: {q(p['pill'])},",
        f"    headline: {q(p['h1'])},",
        f"    lead: {q(p['lead'])},",
        f"    description: {q(p['description'])},",
        f"    links: {links(p['links'])},",
        f"    facts: {facts(p['facts'])},",
        f"    overviewTitle: {q(p['overview_h'])},",
        f"    overview: {q(p['overview'])},",
        f"    features: {rows(p['features'])},",
        f"    buildTitle: {q(p['build_h'])},",
        f"    build: {q(p['build'])},",
        f"    buildRows: {rows(p['build_rows'])},",
        f"    tools: [{', '.join(q(t) for t in p['tools'])}],",
        f"    isCurrent: {'true' if p['id'] in NOW else 'false'},",
        f"    isArchived: {'true' if p['id'] in ARCHIVED else 'false'},",
    ]
    if pics:
        out += [
            f"    hero: {pic(p['hero'], p['hero_alt'])},",
            f"    overviewPicture: {pic(p['cover'], p['cover_alt'])},",
            f"    buildPicture: {pic(p['build_img'], p['build_alt'])},",
            f"    screensTitle: {q(p['screens_h'])},",
            "    screens: [" + ', '.join(pic(s, a) for s, a in p['shots']) + "],",
        ]
    out.append('  ),')
    return '\n'.join(out)


def main():
    data = json.loads((SRC / 'products.json').read_text(encoding='utf-8'))
    items = {p['id']: p for p in data['products']}
    body = '\n'.join(project(items[i]) for i in data['order'])
    OUT.write_text(
        '// GENERATED by tool/gen_projects.py from design/directions/products.json. Do not edit by hand.\n'
        "import 'package:your_experience/models/projects_data.dart';\n\n"
        '/// Case studies in page order (the "next project" link follows it).\n'
        'const List<ProjectsData> projectsContent = [\n' + body + '\n];\n',
        encoding='utf-8')
    print('wrote', OUT.relative_to(ROOT), len(data['order']), 'projects')


main()
