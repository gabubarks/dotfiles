from xml.etree import ElementTree

def pairwise(iterable):
    a = iter(iterable)
    return zip(a, a)

def colorToHex(c):
    return '#' + "{:02x}".format(int(c[0]*255)) + "{:02x}".format(int(c[1]*255)) + "{:02x}".format(int(c[2]*255))

# Open file
xml_file = ElementTree.parse('Molokai.itermcolors').getroot()
xml_colors = xml_file[0]

# Parse colors
colors = [None]*16
for (colorname, colorchannels) in pairwise(xml_colors):
    colornum = 0
    try:
        colornum = int(colorname.text.split()[1])
    except:
        continue;

    r = 0
    g = 0
    b = 0

    for (channelkey, channelval) in pairwise(colorchannels):
        channelname = channelkey.text.lower().split(' ')[0]
        if channelname in ['red', 'green', 'blue']:
            val = float(channelval.text)
            if channelname == 'red':
                r = val
            elif channelname == 'green':
                g = val
            elif channelname == 'blue':
                b = val

    colors[colornum] = (r, g, b)

# Print colors
for (idx, color) in enumerate(colors):
    print(idx, '\t=\t', colorToHex(color))

