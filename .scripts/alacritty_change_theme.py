import yaml
import re


def colour_index(s):
    r = re.compile(r'color(?P<index>[0-9]+)')
    match = r.match(s)
    if match is None:
        return None
    return int(match.group('index'))


category = ['normal', 'bright']
order = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white']

colour_src = '/home/daniel/.cache/wal/colors.yml'
colour_dst = '/home/daniel/.config/alacritty/alacritty.yml'

colour_conf = yaml.load(open(colour_src, 'r'))
alacritty_conf = yaml.load(open(colour_dst, 'r'))

alacritty_conf['colors']['primary'] = colour_conf['special']

for name, colour in colour_conf['colors'].items():
    ind = colour_index(name)
    c, o = divmod(ind, 8)
    ncolname = order[o]
    cat = category[c]
    print(cat, ncolname, colour)
    alacritty_conf['colors'][cat][ncolname] = colour

yaml.dump(alacritty_conf, open(colour_dst, 'w'))
