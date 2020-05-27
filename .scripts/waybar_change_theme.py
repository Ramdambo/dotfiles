import os.path as path
import re

reg = re.compile(r'^\ +--(?P<name>.*):\ (?P<colour>#.*);$')

colour_src = '/home/daniel/.cache/wal/colors.css'
colour_dst = '/home/daniel/.config/waybar/style.css'

template = '@define-color {} {};\n'

colours = {}

with open(colour_src, 'r+') as f:
    for line in f.readlines():
        match = reg.match(line)
        if match is not None:
            colours[match.group('name')] = match.group('colour')

buffer = ['/*-START-GENERATED-CODE-*/\n']
for name, colour in colours.items():
    buffer.append(template.format(name, colour))

write = False
with open(colour_dst, 'r+') as f:
    lines = iter(f.readlines())
    while '/*-END-GENERATED-CODE-*/' not in (line := next(lines)):
        continue
    buffer.append(line)
    for line in lines:
        buffer.append(line)

with open(colour_dst, 'w+') as f:
    f.writelines(buffer)
