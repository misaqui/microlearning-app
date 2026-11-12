#!/usr/bin/env python3
"""Validate the publication contract, independently of Flutter's data model."""
import argparse
from collections import Counter
import json
from pathlib import Path
import re
import sys
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parents[1]
QUOTAS = {'Universo': 25, 'Naturaleza': 25, 'Historia': 25,
          'Psicología': 25, 'Ciencia': 20, 'Sociedad': 15,
          'Cultura': 15, 'IA': 20, 'Ingeniería': 15, 'Liderazgo': 15}


def validate(items):
    errors = []
    if len(items) != 200:
        errors.append(f'Expected 200 readings, found {len(items)}')
    counts = Counter(x.get('category') for x in items)
    if counts != QUOTAS:
        errors.append(f'Category quotas differ: {dict(counts)}')
    for field in ('id', 'title', 'body'):
        duplicates = [s for s, n in Counter(x.get(field) for x in items).items() if n > 1]
        if duplicates:
            errors.append(f'Duplicate {field}: {str(duplicates)[:250]}')
    for item in items:
        label = item.get('id', '<missing>')
        required = ('id', 'title', 'summary', 'body', 'category', 'source_name',
                    'source_title', 'source_url', 'checked_at', 'language')
        for field in required:
            if not isinstance(item.get(field), str) or not item[field].strip():
                errors.append(f'{label}: missing/invalid {field}')
        if not re.fullmatch(r'[a-z0-9]+(?:-[a-z0-9]+)*', label):
            errors.append(f'{label}: unstable ID format')
        words = len(item.get('body', '').split())
        if not 170 <= words <= 280:
            errors.append(f'{label}: {words} words outside 170–280')
        if item.get('word_count') != words:
            errors.append(f'{label}: word_count differs from {words}')
        if item.get('reading_minutes') != (words + 199) // 200:
            errors.append(f'{label}: reading estimate differs')
        if item.get('language') != 'es':
            errors.append(f'{label}: language must be es')
        url = urlsplit(item.get('source_url', ''))
        if url.scheme != 'https' or not url.netloc or url.path in ('', '/'):
            errors.append(f'{label}: source must be specific HTTPS page')
        if not re.fullmatch(r'\d{4}-\d{2}-\d{2}', item.get('checked_at', '')):
            errors.append(f'{label}: invalid checked_at')
    # Compare normalized bodies, catching trivial rewrites as well as exact copies.
    tokens = [set(re.findall(r'\w+', x.get('body', '').lower())) for x in items]
    for i in range(len(items)):
        for j in range(i):
            overlap = len(tokens[i] & tokens[j]) / max(1, len(tokens[i] | tokens[j]))
            if overlap > .70:
                errors.append(f'Potential near-duplicate: {items[j]["id"]} / {items[i]["id"]} ({overlap:.2f})')
    return errors


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--assemble', action='store_true')
    args = parser.parse_args()
    destination = ROOT / 'assets/content/catalog.json'
    if args.assemble:
        items = []
        for filename in sorted((ROOT / 'assets/content').glob('batch_*.json')):
            items.extend(json.loads(filename.read_text()))
    else:
        items = json.loads(destination.read_text())
    errors = validate(items)
    report = {'readings': len(items), 'categories': dict(Counter(x.get('category') for x in items)),
              'total_words': sum(len(x.get('body', '').split()) for x in items),
              'unique_source_urls': len(set(x.get('source_url') for x in items)),
              'errors': errors}
    print(json.dumps(report, ensure_ascii=False, indent=2))
    if errors:
        sys.exit(1)
    if args.assemble:
        # Interleave categories rather than opening with a wall of astronomy.
        groups = {category: [x for x in items if x['category'] == category] for category in QUOTAS}
        ordered = []
        while any(groups.values()):
            for group in groups.values():
                if group:
                    ordered.append(group.pop(0))
        destination.write_text(json.dumps(ordered, ensure_ascii=False, indent=2) + '\n')
    (ROOT / 'docs/content_audit/validation.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')


if __name__ == '__main__':
    main()
